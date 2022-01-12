from django.db import models
from django.db.models.base import Model
from django.db.models.deletion import CASCADE
import datetime
import os

from django.db.models.fields import FloatField, IntegerField, TextField

class Category(models.Model):
    title = models.CharField(max_length=100)
    date_added = models.DateTimeField(auto_now_add=True)
    

class Authors(models.Model):
    name = models.CharField(max_length=100)
    date_added = models.DateTimeField(auto_now_add=True)        

def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('', filename)

class Books(models.Model):
    title = models.CharField(max_length=100)
    author = models.ForeignKey(Authors, default=True, on_delete=CASCADE)
    genre = models.ForeignKey(Category ,default=True, on_delete=CASCADE)
    image = models.ImageField(upload_to=filepath, null=True, blank=True)
    image1 = models.ImageField(upload_to=filepath, null=True, blank=True)
    image2 = models.ImageField(upload_to=filepath, null=True, blank=True)
    desc = TextField(max_length=100,default=True)
    publisher = TextField(max_length=100, default=True)
    language = TextField(max_length=100, default=True)
    stock = IntegerField(default=0)
    price = FloatField(default=1)
    sprice = FloatField(default=1)
    discount = FloatField(default=0) 
    is_catoffer = models.IntegerField(default=False)
    newoffer = models.IntegerField(default=False)
    

class Offer(models.Model):
    category = models.ForeignKey(Category, on_delete=CASCADE, default=True)
    discount = models.IntegerField(default=False)