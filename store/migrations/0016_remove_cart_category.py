# Generated by Django 3.2 on 2021-12-28 10:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0015_alter_cart_category'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cart',
            name='category',
        ),
    ]
