# Generated by Django 3.2 on 2022-01-02 14:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0024_alter_couponorders_user'),
    ]

    operations = [
        migrations.DeleteModel(
            name='BuyNow',
        ),
    ]