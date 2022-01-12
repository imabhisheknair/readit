from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

from store.models import Order, OrderItems


def ordertable(request):
    if not request.session.has_key('admin'):
        return redirect('/')

    orders = Order.objects.all().order_by('-id')    
    context = {
        'orders': orders
    }    
    return render(request, 'orders.html', context)

def orderview(request, id):
    if not request.session.has_key('admin'):
        return redirect('/')

    order = Order.objects.get(id=id)
    items = OrderItems.objects.filter(order_id=id).all()
    context = {
        'order': order,
        'items': items,

    }
    return render(request, 'order-view.html', context)

def update(request, id):
    action = request.GET.get('action')
    if action == '2':
        order = Order.objects.filter(id=id)
        if order:
            update = Order.objects.filter(id=id).update(status = 'Dispatched')
            return redirect('/adminpanel/orders/view/'+id)
    elif action == '3':
        order = Order.objects.filter(id=id)
        if order:
            update = Order.objects.filter(id=id).update(status = 'Delivered')
            return redirect('/adminpanel/orders/view/'+id) 
    elif action == '4':
        order = Order.objects.filter(id=id)
        if order:
            update = Order.objects.filter(id=id).update(is_active = 0, status = 'Cancelled')
            return redirect('/adminpanel/orders/view/'+id)         
    else:                
        return redirect('/adminpanel/orders/view/'+id)