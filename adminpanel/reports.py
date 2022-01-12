import datetime

from django.db.models.aggregates import Count
from store.models import Order, OrderItems
from .models import Category
from django.db.models import Q,Sum

def monthReport(request):
    today = datetime.date.today()
    print(today)
    current_month = today.month
    current_year = today.year
    return Order.objects.filter(date_added__year=current_year, date_added__month=current_month).aggregate(Sum('total'))

def yearReport(request):
    today = datetime.date.today()
    current_year = today.year

    return Order.objects.filter(date_added__year=current_year).aggregate(Sum('total'))    

def pendingOrder(request):
    orders = Order.objects.filter(status='Placed', is_active=1).count()
    return orders

def totalOrder(request):
    orders = Order.objects.all().count()
    return orders    

def categoryEarnings(request):
    result = Order.objects.values('date_added__month', 'date_added__day', 'date_added__year').annotate(Sum('total')).order_by('-date_added__date')[:7]
    return result

def paymentCount(request):
    result = Order.objects.values('mode').annotate(mode_count=Sum('total')).order_by('-mode_count')  
    return result


def statusReport():
    status = Order.objects.values('status').annotate(Count('status'))
    return status
