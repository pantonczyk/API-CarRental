from rest_framework import generics
from rest_framework.response import Response
from rest_framework.reverse import reverse
from .models import Address, Employee, Client, Car, Rent
from .serializers import AddressSerializer, EmployeeSerializer, ClientSerializer, CarSerializer, RentSerializer, \
    UserSerializer
from django_filters import DateTimeFilter, NumberFilter, ChoiceFilter, CharFilter, FilterSet
from django.contrib.auth.models import User
from rest_framework import permissions


class AddressList(generics.ListCreateAPIView):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer
    name = 'address-list'
    search_fields = ['street', 'city']
    filterset_fields = ['street', 'city']
    ordering_fields = ['street', 'city']
    permission_classes = [permissions.IsAuthenticated]


class AddressDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer
    name = 'address-detail'
    permission_classes = [permissions.IsAuthenticated]


class EmployeeList(generics.ListCreateAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer
    name = 'employee-list'
    search_fields = ['title', 'last_name']
    filterset_fields = ['title']
    ordering_fields = ['title', 'last_name']
    permission_classes = [permissions.IsAdminUser]


class EmployeeDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer
    name = 'employee-detail'
    permission_classes = [permissions.IsAdminUser]


class ClientList(generics.ListCreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    name = 'client-list'
    search_fields = ['first_name', 'last_name']
    filterset_fields = ['last_name']
    ordering_fields = ['first_name', 'last_name']
    permission_classes = [permissions.IsAuthenticated]


class ClientDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    name = 'client-detail'
    permission_classes = [permissions.IsAuthenticated]


class CarFilter(FilterSet):
    brand = CharFilter(field_name='brand')
    model = CharFilter(field_name='model')
    color = CharFilter(field_name='color')
    car_status = ChoiceFilter(choices=Car.CARSTATUS)
    from_production_year = NumberFilter(field_name='production_year', lookup_expr='gte')
    to_production_year = NumberFilter(field_name='production_year', lookup_expr='lte')
    min_daily_cost_of_rent = NumberFilter(field_name='daily_cost_of_rent', lookup_expr='gte')
    max_daily_cost_of_rent = NumberFilter(field_name='daily_cost_of_rent', lookup_expr='lte')

    class Meta:
        model = Car
        fields = ['brand', 'model', 'color', 'car_status', 'from_production_year',
                  'to_production_year', 'min_daily_cost_of_rent', 'max_daily_cost_of_rent']


class CarList(generics.ListCreateAPIView):
    queryset = Car.objects.all()
    serializer_class = CarSerializer
    name = 'car-list'
    search_fields = ['registration_number', 'vin', 'brand', 'model']
    filterset_class = CarFilter
    ordering_fields = ['brand', 'car_status', 'production_year', 'daily_cost_of_rent']
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class CarDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Car.objects.all()
    serializer_class = CarSerializer
    name = 'car-detail'
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class RentFilter(FilterSet):
    from_start_date = DateTimeFilter(field_name='start_date', lookup_expr='gte')
    to_start_date = DateTimeFilter(field_name='start_date', lookup_expr='lte')
    min_total_cost_of_rent = NumberFilter(field_name='total_cost_of_rent', lookup_expr='gte')
    max_total_cost_of_rent = NumberFilter(field_name='total_cost_of_rent', lookup_expr='lte')

    class Meta:
        model = Rent
        fields = ['client_id_client', 'car_id_car', 'employee_id_employee', 'from_start_date', 'to_start_date',
                  'min_total_cost_of_rent', 'max_total_cost_of_rent']


class RentList(generics.ListCreateAPIView):
    queryset = Rent.objects.all()
    serializer_class = RentSerializer
    name = 'rent-list'
    filterset_class = RentFilter
    ordering_fields = ['client_id_client', 'car_id_car', 'employee_id_employee']
    permission_classes = [permissions.IsAuthenticated]


class RentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Rent.objects.all()
    serializer_class = RentSerializer
    name = 'rent-detail'
    permission_classes = [permissions.IsAuthenticated]


class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    name = 'user-list'
    permission_classes = [permissions.IsAdminUser]


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    name = 'user-detail'
    permission_classes = [permissions.IsAdminUser]


class ApiRoot(generics.GenericAPIView):
    name = 'api-root'

    def get(self, request, *args, **kwargs):
        return Response({'addresses': reverse(AddressList.name, request=request),
                         'employees': reverse(EmployeeList.name, request=request),
                         'clients': reverse(ClientList.name, request=request),
                         'cars': reverse(CarList.name, request=request),
                         'rents': reverse(RentList.name, request=request),
                         'users': reverse(UserList.name, request=request)
                         })
