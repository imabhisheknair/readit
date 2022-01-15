from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.db.models.deletion import CASCADE
from phonenumber_field.modelfields import PhoneNumberField
import random


class AccountManager(BaseUserManager):
    def create_user(self, fullname, email, phone, password=None):
        if not email:
            raise ValueError('You must have an email')

        user = self.model(
            email = self.normalize_email(email),
            fullname = fullname,
            phone = phone,
            is_active = 1,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, phone, password=None):
        # if not email:
        #     raise ValueError('You must have an email')

        user = self.model(
            # email = self.normalize_email(email),
            # # fullname = fullname,
            # phone = '+91'+str(random.randint(6300000000,9999999999)),
            phone = phone,
            is_active = 1,
            is_superuser = 1,
            is_admin = 1,
            is_staff = 1
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

class Account(AbstractBaseUser, PermissionsMixin):
    
    fullname = models.CharField(max_length=50)
    email = models.EmailField(max_length=50,unique=True)
    phone = PhoneNumberField(unique=True, max_length=50)

    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD='phone'

    REQUIRED_FIELD = ['fullname', 'email', 'phone', 'password']

    objects = AccountManager()


class Address(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE)
    name = models.CharField(max_length=30, default='name')
    state = models.CharField(max_length=25)
    city = models.CharField(max_length=25)
    zip = models.IntegerField()
    address = models.CharField(max_length=50)
    mobile = PhoneNumberField(max_length = 50)


class MyAddress(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE)
    name = models.CharField(max_length=30, default='name')
    state = models.CharField(max_length=25)
    city = models.CharField(max_length=25)
    zip = models.IntegerField()
    address = models.CharField(max_length=50)
    mobile = PhoneNumberField(max_length = 50)


