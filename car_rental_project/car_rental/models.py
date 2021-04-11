from django.db import models
from django.core.validators import MinLengthValidator, RegexValidator, MinValueValidator, MaxValueValidator
from django.contrib.auth.models import User
import datetime


class PostalCodeValidator(RegexValidator):
    regex = '^([0-9]{2}[-]{1}[0-9]{3})$'
    message = u'Invalid postal code'


class Address(models.Model):
    street = models.CharField(max_length=60)
    postal_code = models.CharField(max_length=6, validators=[PostalCodeValidator()])
    city = models.CharField(max_length=20)

    def __str__(self):
        return self.street + ', ' + self.postal_code + ', ' + self.city


class Employee(models.Model):
    MANA = "manager"
    CONS = "consultant"
    SERV = "service technician"
    TITLE = ((MANA, 'Manager'), (CONS, 'Consultant'), (SERV, 'service technician'))
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=False, related_name='user')
    first_name = models.CharField(max_length=15, null=False)
    last_name = models.CharField(max_length=25, null=False)
    phone_number = models.CharField(max_length=9, null=False)
    title = models.CharField(max_length=20, choices=TITLE, default=MANA)
    address_id_address = models.ForeignKey(Address, on_delete=models.CASCADE, null=False, related_name='employee')

    def __str__(self):
        return self.first_name + ' ' + self.last_name + ' Title: ' + self.title


class Client(models.Model):
    first_name = models.CharField(max_length=15, null=False)
    last_name = models.CharField(max_length=25, null=False)
    email = models.EmailField(max_length=45)
    phone_number = models.CharField(max_length=9, null=False)
    address_id_address = models.ForeignKey(Address, on_delete=models.CASCADE, null=False, related_name='client')

    def __str__(self):
        return self.first_name + ' ' + self.last_name


class Car(models.Model):
    AVAI = "available"
    UNAVA = "unavailable"
    SERV = "serviced"
    CARSTATUS = ((AVAI, 'available'), (UNAVA, 'unavailable'), (SERV, 'serviced'))
    registration_number = models.CharField(max_length=8, null=False)
    vin = models.CharField(max_length=17, null=False, validators=[MinLengthValidator(17)])
    brand = models.CharField(max_length=15, null=False)
    model = models.CharField(max_length=45, null=False)
    production_year = models.IntegerField(max_length=4, null=False,
                                          validators=[MaxValueValidator(datetime.date.today().year)])
    color = models.CharField(max_length=15, null=False)
    car_status = models.CharField(max_length=15, choices=CARSTATUS, default=AVAI)
    daily_cost_of_rent = models.FloatField(null=False, validators=[MinValueValidator(0)])

    def __str__(self):
        return self.brand + ' ' + self.model + ' Registration number: ' + self.registration_number + ' VIN: ' + self.vin


class Rent(models.Model):
    start_date = models.DateField(null=False)
    end_date = models.DateField(null=False)
    total_cost_of_rent = models.FloatField(null=False, validators=[MinValueValidator(0)])
    client_id_client = models.ForeignKey(Client, on_delete=models.CASCADE, null=False, related_name='rents')
    car_id_car = models.ForeignKey(Car, on_delete=models.CASCADE, null=False, related_name='rents')
    employee_id_employee = models.ForeignKey(Employee, on_delete=models.CASCADE, null=False, related_name='rents')

    def __str__(self):
        return self.start_date + ' ' + self.end_date + ' ' + str(self.total_cost_of_rent)
