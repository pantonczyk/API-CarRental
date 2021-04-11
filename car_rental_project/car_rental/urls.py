from django.urls import path
from . import views

urlpatterns = [
    path('addresses', views.AddressList.as_view(), name=views.AddressList.name),
    path('addresses/<int:pk>', views.AddressDetail.as_view(), name=views.AddressDetail.name),
    path('employees', views.EmployeeList.as_view(), name=views.EmployeeList.name),
    path('employees/<int:pk>', views.EmployeeDetail.as_view(), name=views.EmployeeDetail.name),
    path('clients', views.ClientList.as_view(), name=views.ClientList.name),
    path('clients/<int:pk>', views.ClientDetail.as_view(), name=views.ClientDetail.name),
    path('cars', views.CarList.as_view(), name=views.CarList.name),
    path('cars/<int:pk>', views.CarDetail.as_view(), name=views.CarDetail.name),
    path('rents', views.RentList.as_view(), name=views.RentList.name),
    path('rents/<int:pk>', views.RentDetail.as_view(), name=views.RentDetail.name),
    path('users', views.UserList.as_view(), name=views.UserList.name),
    path('users/<int:pk>', views.UserDetail.as_view(), name=views.UserDetail.name),
    path('', views.ApiRoot.as_view(), name=views.ApiRoot.name),
]