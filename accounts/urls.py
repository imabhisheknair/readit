from django.conf.urls import url
from django.urls import path
from . import views

urlpatterns = [
    path('login', views.loginpage),
    path('register', views.register),
    path('verify', views.otpverify),
    path('token_validation', views.token_validation),
    path('verified', views.verified),
    path('logout', views.logout),
    path('me', views.myaccount),
    path('address/add', views.saveaddress),
    url(r'^address/edit/(?P<id>\w+)', views.address_edit),
    url(r'^address/delete/(?P<id>\w+)', views.address_delete),
    url(r'^orders/cancel/(?P<id>\w+)', views.orderCancel),
    path('update', views.update_profile),
    path('update_pass', views.update_password),


]
