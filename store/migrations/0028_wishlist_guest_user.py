# Generated by Django 3.2 on 2022-01-12 07:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0027_auto_20220112_0528'),
    ]

    operations = [
        migrations.AddField(
            model_name='wishlist',
            name='guest_user',
            field=models.CharField(default=True, max_length=100),
        ),
    ]
