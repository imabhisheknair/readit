from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.fields import FloatField, IntegerField
from accounts.models import Account, Address
from adminpanel.models import Books


class Wishlist(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE, default=True)
    book = models.ForeignKey(Books, on_delete=CASCADE, default=False)
    date_added = models.DateTimeField(auto_now_add=True) 
    guest_user = models.CharField(max_length=100, default=True) 

class Cart(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE, default=True)
    book = models.ForeignKey(Books, on_delete=CASCADE, default=True)
    qty = IntegerField(default=True)
    price = FloatField(default=False)
    is_coupon = models.BooleanField(default=False)
    date_added = models.DateTimeField(auto_now_add=True)   
    guest_user = models.CharField(max_length=100, default=True) 

    def save(self, *args, **kwargs):
        self.price = round(self.price, 2)
        super(Cart, self).save(*args, **kwargs)

class Coupon(models.Model):
    code = models.CharField(max_length=50)
    discount = models.FloatField(default=False)
    is_active = models.BooleanField(default=True)

class Coupon_entry(models.Model):
    coupon = models.ForeignKey(Coupon, on_delete=CASCADE, default=False)
    user = models.ForeignKey(Account, on_delete=CASCADE, default=False)
    date_added = models.DateTimeField(auto_now_add=True)    
    discount_price = models.FloatField(default=False)

    def save(self, *args, **kwargs):
        self.discount_price = round(self.discount_price, 2)
        super(Coupon_entry, self).save(*args, **kwargs)

class Order(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE, default=False)
    address = models.ForeignKey(Address, on_delete=CASCADE, default=False)
    mode = models.CharField(max_length=50, default='')
    status = models.CharField(max_length=50, default='Placed')    
    total = models.FloatField(default=True)
    is_coupon = models.BooleanField(default=True)
    date_added = models.DateTimeField(auto_now_add=True)
    is_active = models.IntegerField(default=True)


class OrderItems(models.Model):
    order = models.ForeignKey(Order, on_delete=CASCADE, default=False)
    book = models.ForeignKey(Books, on_delete=CASCADE, default=False)
    qty = models.IntegerField(default=True)
    price = models.FloatField(default=True)

    def save(self, *args, **kwargs):
        self.price = round(self.price, 2)
        super(OrderItems, self).save(*args, **kwargs)


class CouponOrders(models.Model):
    user = models.ForeignKey(Account, on_delete=CASCADE, default=False)
    order = models.ForeignKey(Order, on_delete=CASCADE, default=False)
    coupon = models.ForeignKey(Coupon, on_delete=CASCADE, default=False)

class Payment(models.Model):
    order = models.ForeignKey(Order, on_delete=CASCADE)
    mode = models.CharField(max_length=50, default='')
    status = models.IntegerField(default=False)      
