# Generated by Django 3.2 on 2022-01-12 11:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0030_alter_order_date_added'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='date_added',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]