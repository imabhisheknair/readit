# Generated by Django 3.2 on 2021-12-14 06:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import phonenumber_field.modelfields


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0010_account_is_staff'),
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('state', models.CharField(max_length=25)),
                ('city', models.CharField(max_length=25)),
                ('zip', models.IntegerField()),
                ('address', models.CharField(max_length=50)),
                ('mobile', phonenumber_field.modelfields.PhoneNumberField(max_length=50, region=None)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
