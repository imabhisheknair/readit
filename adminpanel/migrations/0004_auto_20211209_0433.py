# Generated by Django 2.2.12 on 2021-12-09 04:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0003_auto_20211208_1335'),
    ]

    operations = [
        migrations.AlterField(
            model_name='books',
            name='author',
            field=models.IntegerField(default=1),
        ),
        migrations.AlterField(
            model_name='books',
            name='genre',
            field=models.IntegerField(default=1),
        ),
    ]