# Generated by Django 3.2 on 2021-12-15 08:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0002_cart'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='qty',
            field=models.FloatField(default=True),
        ),
    ]