from rest_framework import serializers
from .models import Address, Employee, Client, Car, Rent
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password


class AddressSerializer(serializers.HyperlinkedModelSerializer):
    employee = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='employee-detail')
    client = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='client-detail')

    class Meta:
        model = Address
        fields = ['url', 'pk', 'street', 'postal_code', 'city', 'employee', 'client']


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'username', 'password', 'email']


class EmployeeSerializer(serializers.HyperlinkedModelSerializer):
    address_id_address = serializers.SlugRelatedField(queryset=Address.objects.all(), slug_field='street')
    rents = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='rent-detail')
    user = UserSerializer()

    class Meta:
        model = Employee
        fields = ['url', 'pk', 'user', 'first_name', 'last_name', 'phone_number', 'title', 'address_id_address',
                  'rents']

    def create(self, validated_data):
        user_data = validated_data.pop('user')
        password = make_password(user_data['password'])
        user_data['password'] = password
        user = User.objects.create(**user_data)
        employee = Employee.objects.create(user=user, **validated_data)
        return employee

    def update(self, instance, validated_data):
        user_data = validated_data.pop('user')
        password = make_password(user_data['password'])
        user_data['password'] = password
        user = instance.user
        user.username = user_data.get('username', user.username)
        user.password = user_data.get('password', user.password)
        user.email = user_data.get('email', user.email)
        user.save()

        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.phone_number = validated_data.get('phone_number', instance.phone_number)
        instance.title = validated_data.get('title', instance.title)
        instance.address_id_address = validated_data.get('address_id_address', instance.address_id_address)
        instance.save()
        return instance


class ClientSerializer(serializers.HyperlinkedModelSerializer):
    address_id_address = serializers.SlugRelatedField(queryset=Address.objects.all(), slug_field='street')
    rents = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='rent-detail')

    class Meta:
        model = Client
        fields = ['url', 'pk', 'first_name', 'last_name', 'email', 'phone_number', 'address_id_address', 'rents']


class CarSerializer(serializers.HyperlinkedModelSerializer):
    rents = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='rent-detail')

    class Meta:
        model = Car
        fields = ['url', 'pk', 'registration_number', 'vin', 'brand', 'model', 'production_year', 'color', 'car_status',
                  'daily_cost_of_rent', 'rents']


class RentSerializer(serializers.HyperlinkedModelSerializer):
    client_id_client = serializers.SlugRelatedField(queryset=Client.objects.all(), slug_field='last_name')
    car_id_car = serializers.SlugRelatedField(queryset=Car.objects.all(), slug_field='registration_number')
    employee_id_employee = serializers.SlugRelatedField(queryset=Employee.objects.all(), slug_field='last_name')

    class Meta:
        model = Rent
        fields = ['url', 'pk', 'start_date', 'end_date', 'total_cost_of_rent', 'client_id_client', 'car_id_car',
                  'employee_id_employee']
