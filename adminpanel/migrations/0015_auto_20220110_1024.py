# Generated by Django 3.2 on 2022-01-10 10:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0014_auto_20220108_0922'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='discount',
        ),
        migrations.RemoveField(
            model_name='category',
            name='newoffer',
        ),
        migrations.AddField(
            model_name='books',
            name='is_catoffer',
            field=models.IntegerField(default=False),
        ),
        migrations.AddField(
            model_name='books',
            name='newoffer',
            field=models.IntegerField(default=False),
        ),
    ]