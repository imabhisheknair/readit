from django.contrib.auth.forms import UserCreationForm
from django.db.models import fields

from adminpanel import models
from .models import Account, Address

class CreateUserForm(UserCreationForm):
    class Meta:
        model = Account
        fields = ['fullname', 'email', 'phone', 'password1', 'password2']
       
        
