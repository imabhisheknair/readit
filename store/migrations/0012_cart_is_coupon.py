# Generated by Django 3.2 on 2021-12-28 07:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0011_auto_20211228_0616'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='is_coupon',
            field=models.BooleanField(default=False),
        ),
    ]
