# Generated by Django 3.2 on 2021-12-29 08:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0018_coupon_entry_discount_price'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='coupon',
        ),
        migrations.AddField(
            model_name='order',
            name='is_coupon',
            field=models.BooleanField(default=True),
        ),
        migrations.CreateModel(
            name='CouponOrders',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('coupon', models.ForeignKey(default=False, on_delete=django.db.models.deletion.CASCADE, to='store.coupon')),
                ('order', models.ForeignKey(default=False, on_delete=django.db.models.deletion.CASCADE, to='store.order')),
            ],
        ),
    ]
