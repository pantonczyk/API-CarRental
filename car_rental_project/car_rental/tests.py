from . import views
from .models import Address, Client, Car
from rest_framework import status
from rest_framework.reverse import reverse
from django.utils.http import urlencode
from django import urls
from rest_framework.test import APIClient, APITestCase
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token


class RemoteAuthenticatedTest(APITestCase):
    client_class = APIClient

    def setUp(self):
        self.username = 'mister_neutron'
        self.user = User.objects.create_user(username='mister_neutron', email='mister_neutron@example.com',
                                             password='F4kePaSs0d')
        Token.objects.create(user=self.user)
        super(RemoteAuthenticatedTest, self).setUp()


class AddressTests(RemoteAuthenticatedTest):

    def post_address(self, street, postal_code, city):
        url = reverse(views.AddressList.name)
        data = {'street': street, 'postal_code': postal_code, 'city': city}
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.user.auth_token.key)
        response = self.client.post(url, data, format='json', REMOTE_USER=self.username)
        return response

    def test_post_and_get_address(self):
        new_street = 'Długa 12'
        new_postal_code = '14-200'
        new_city = 'Włoszczowa'
        response = self.post_address(new_street, new_postal_code, new_city)

        assert response.status_code == status.HTTP_201_CREATED
        assert Address.objects.count() == 1
        assert Address.objects.get().street == new_street
        assert Address.objects.get().postal_code == new_postal_code
        assert Address.objects.get().city == new_city

    def test_filter_address(self):
        new_street = 'Długa 26'
        new_postal_code = '15-100'
        new_city = 'Sosnowiec'

        new_street1 = 'Krótka 12'
        new_postal_code1 = '15-124'
        new_city1 = 'Radom'

        self.post_address(new_street, new_postal_code, new_city)
        self.post_address(new_street1, new_postal_code1, new_city1)
        filter_city = {'city': new_city}
        url = '{0}?{1}'.format(reverse(views.AddressList.name), urlencode(filter_city))
        response = self.client.get(url, format='json')
        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['city'] == new_city

    def test_search_address(self):
        new_street = 'Cicha 26'
        new_postal_code = '11-800'
        new_city = 'Władysławowo'

        new_street1 = 'Krótka 13'
        new_postal_code1 = '15-124'
        new_city1 = 'Radom'

        self.post_address(new_street, new_postal_code, new_city)
        self.post_address(new_street1, new_postal_code1, new_city1)
        search_address = {'street': new_street, 'city': new_city}
        url = '{0}?{1}'.format(reverse(views.AddressList.name), urlencode(search_address))
        response = self.client.get(url, format='json')
        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['city'] == new_city

    def test_order_address(self):
        new_street = 'Cicha 26'
        new_postal_code = '11-800'
        new_city = 'Władysławowo'

        new_street1 = 'Krótka 13'
        new_postal_code1 = '15-124'
        new_city1 = 'Radom'
        self.post_address(new_street, new_postal_code, new_city)
        self.post_address(new_street1, new_postal_code1, new_city1)

        ordering_address = {'street': new_street, 'city': new_city}
        url = '{0}?{1}'.format(reverse(views.AddressList.name), urlencode(ordering_address))
        response = self.client.get(url, format='json')

        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['city'] == new_city

    def test_delete_address(self):
        new_street = 'Długa 12'
        new_postal_code = '14-200'
        new_city = 'Włoszczowa'
        response = self.post_address(new_street, new_postal_code, new_city)
        url = urls.reverse(views.AddressDetail.name, None, {response.data['pk']})
        response = self.client.delete(url)
        assert response.status_code == status.HTTP_204_NO_CONTENT
        assert response.data is None

    def test_update_address(self):
        new_street = 'Krótka 34'
        new_postal_code = '14-155'
        new_city = 'Barczewo'
        response = self.post_address(new_street, new_postal_code, new_city)
        url = urls.reverse(views.AddressDetail.name, None, {response.data['pk']})
        updated_new_city = 'Warszawa'
        data = {'city': updated_new_city}
        patch_response = self.client.patch(url, data, format='json')
        assert patch_response.status_code == status.HTTP_200_OK
        assert patch_response.data['city'] == updated_new_city


class CarTests(RemoteAuthenticatedTest):

    def post_car(self, registration_number, vin, brand, model, production_year, color, car_status, daily_cost_of_rent):
        url = reverse(views.CarList.name)
        data = {'registration_number': registration_number, 'vin': vin, 'brand': brand, 'model': model,
                'production_year': production_year, 'color': color, 'car_status': car_status,
                'daily_cost_of_rent': daily_cost_of_rent}
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.user.auth_token.key)
        response = self.client.post(url, data, format='json', REMOTE_USER=self.username)
        return response

    def test_post_and_get_car(self):
        new_registration_number = 'LC88194'
        new_vin = 'ZARW3A1Z7U7HM8658'
        new_brand = 'VW'
        new_model = 'eGolf'
        new_production_year = 1998
        new_color = 'czerwony'
        new_car_status = 'available'
        new_daily_cost_of_rent = 2500.65
        response = self.post_car(new_registration_number, new_vin, new_brand, new_model, new_production_year,
                                 new_color, new_car_status, new_daily_cost_of_rent)

        assert response.status_code == status.HTTP_201_CREATED
        assert Car.objects.count() == 1
        assert Car.objects.get().registration_number == new_registration_number
        assert Car.objects.get().vin == new_vin
        assert Car.objects.get().brand == new_brand
        assert Car.objects.get().model == new_model
        assert Car.objects.get().production_year == new_production_year
        assert Car.objects.get().color == new_color
        assert Car.objects.get().car_status == new_car_status
        assert Car.objects.get().daily_cost_of_rent == new_daily_cost_of_rent

    def test_filter_car(self):
        new_registration_number1 = 'LC88194'
        new_vin1 = 'ZARW3A1Z7U7HM8658'
        new_brand1 = 'VW'
        new_model1 = 'eGolf'
        new_production_year1 = 1998
        new_color1 = 'czerwony'
        new_car_status1 = 'available'
        new_daily_cost_of_rent1 = 2500.65

        new_registration_number2 = 'WSK2167'
        new_vin2 = 'ZLAKVZXS48PW02455'
        new_brand2 = 'Audi'
        new_model2 = 'A6'
        new_production_year2 = 2005
        new_color2 = 'czarny'
        new_car_status2 = 'available'
        new_daily_cost_of_rent2 = 1500.65
        self.post_car(new_registration_number1, new_vin1, new_brand1, new_model1, new_production_year1, new_color1,
                      new_car_status1, new_daily_cost_of_rent1)
        self.post_car(new_registration_number2, new_vin2, new_brand2, new_model2, new_production_year2, new_color2,
                      new_car_status2, new_daily_cost_of_rent2)

        filter_brand = {'brand': new_brand2}
        url1 = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(filter_brand))
        response1 = self.client.get(url1, format='json')
        assert response1.status_code == status.HTTP_200_OK
        assert response1.data['count'] == 1
        assert response1.data['results'][0]['brand'] == new_brand2

        filter_model = {'model': new_model1}
        url2 = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(filter_model))
        response2 = self.client.get(url2, format='json')
        assert response2.status_code == status.HTTP_200_OK
        assert response2.data['count'] == 1
        assert response2.data['results'][0]['model'] == new_model1

        filter_color = {'color': new_color1}
        url3 = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(filter_color))
        response3 = self.client.get(url3, format='json')
        assert response3.status_code == status.HTTP_200_OK
        assert response3.data['count'] == 1
        assert response3.data['results'][0]['color'] == new_color1

        filter_car_status = {'car_status': new_car_status2}
        url4 = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(filter_car_status))
        response4 = self.client.get(url4, format='json')
        assert response4.status_code == status.HTTP_200_OK
        assert response4.data['count'] == 2
        assert response4.data['results'][0]['car_status'] == new_car_status2

        from_production_year = {'from_production_year': 1998}
        to_production_year = {'to_production_year': 1998}
        url5 = '{0}?{1}&{2}'.format(reverse(views.CarList.name), urlencode(from_production_year),
                                    urlencode(to_production_year))
        response5 = self.client.get(url5, format='json')
        assert response5.status_code == status.HTTP_200_OK
        assert response5.data['count'] == 1

    def test_search_car(self):
        new_registration_number1 = 'LC88194'
        new_vin1 = 'ZARW3A1Z7U7HM8658'
        new_brand1 = 'VW'
        new_model1 = 'eGolf'
        new_production_year1 = 1998
        new_color1 = 'czerwony'
        new_car_status1 = 'available'
        new_daily_cost_of_rent1 = 2500.65

        new_registration_number2 = 'WSK2167'
        new_vin2 = 'ZLAKVZXS48PW02455'
        new_brand2 = 'Audi'
        new_model2 = 'A6'
        new_production_year2 = 2005
        new_color2 = 'czarny'
        new_car_status2 = 'available'
        new_daily_cost_of_rent2 = 1500.65
        self.post_car(new_registration_number1, new_vin1, new_brand1, new_model1, new_production_year1, new_color1,
                      new_car_status1, new_daily_cost_of_rent1)
        self.post_car(new_registration_number2, new_vin2, new_brand2, new_model2, new_production_year2, new_color2,
                      new_car_status2, new_daily_cost_of_rent2)

        search_car = {'registration_number': new_registration_number2, 'vin': new_vin2, 'brand': new_brand2,
                      'model': new_model2}

        url = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(search_car))
        response = self.client.get(url, format='json')
        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['vin'] == new_vin2

    def test_order_address(self):
        new_registration_number1 = 'LC88194'
        new_vin1 = 'ZARW3A1Z7U7HM8658'
        new_brand1 = 'VW'
        new_model1 = 'eGolf'
        new_production_year1 = 1998
        new_color1 = 'czerwony'
        new_car_status1 = 'available'
        new_daily_cost_of_rent1 = 2500.65

        new_registration_number2 = 'WSK2167'
        new_vin2 = 'ZLAKVZXS48PW02455'
        new_brand2 = 'Audi'
        new_model2 = 'A6'
        new_production_year2 = 2005
        new_color2 = 'czarny'
        new_car_status2 = 'available'
        new_daily_cost_of_rent2 = 1500.65
        self.post_car(new_registration_number1, new_vin1, new_brand1, new_model1, new_production_year1, new_color1,
                      new_car_status1, new_daily_cost_of_rent1)
        self.post_car(new_registration_number2, new_vin2, new_brand2, new_model2, new_production_year2, new_color2,
                      new_car_status2, new_daily_cost_of_rent2)

        ordering_car = {'brand': new_brand2, 'car_status': new_car_status2, 'production_year': new_production_year2,
                        'daily_cost_of_rent': new_daily_cost_of_rent2}
        url = '{0}?{1}'.format(reverse(views.CarList.name), urlencode(ordering_car))
        response = self.client.get(url, format='json')

        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['brand'] == new_brand2

    def test_delete_car(self):
        new_registration_number = 'LC88194'
        new_vin = 'ZARW3A1Z7U7HM8658'
        new_brand = 'VW'
        new_model = 'eGolf'
        new_production_year = 1998
        new_color = 'czerwony'
        new_car_status = 'available'
        new_daily_cost_of_rent = 2500.65
        response = self.post_car(new_registration_number, new_vin, new_brand, new_model, new_production_year,
                                 new_color, new_car_status, new_daily_cost_of_rent)

        url = urls.reverse(views.CarDetail.name, None, {response.data['pk']})
        print(url)
        response = self.client.delete(url)
        assert response.status_code == status.HTTP_204_NO_CONTENT
        assert response.data is None

    def test_update_car(self):
        new_registration_number = 'LC88194'
        new_vin = 'ZARW3A1Z7U7HM8658'
        new_brand = 'VW'
        new_model = 'eGolf'
        new_production_year = 1998
        new_color = 'czerwony'
        new_car_status = 'available'
        new_daily_cost_of_rent = 2500.65
        response = self.post_car(new_registration_number, new_vin, new_brand, new_model, new_production_year,
                                 new_color, new_car_status, new_daily_cost_of_rent)

        url = urls.reverse(views.CarDetail.name, None, {response.data['pk']})
        updated_daily_cost_of_rent = 1500.35
        data = {'daily_cost_of_rent': updated_daily_cost_of_rent}
        patch_response = self.client.patch(url, data, format='json')
        assert patch_response.status_code == status.HTTP_200_OK
        assert patch_response.data['daily_cost_of_rent'] == updated_daily_cost_of_rent
