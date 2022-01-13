from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db.models.aggregates import Sum
from django.http.response import JsonResponse
from django.shortcuts import redirect, render

from accounts.models import Account, Address
from adminpanel.models import Books, Category
from store.models import Cart, Coupon, Coupon_entry, CouponOrders, Order, OrderItems
import razorpay
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseBadRequest, request

# authorize razorpay client with API Keys.
# razorpay_client = razorpay.Client(
#     auth=(settings.RAZOR_KEY_ID, settings.RAZOR_KEY_SECRET))
 


class GetElements:
    def Getuser(request):
        user = Account.objects.get(id=request.session['userid'])
        return user  

    def GetCart(request):
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartitem = Cart.objects.filter(user_id=user).all()
            return cartitem
        else:
            return 1
          
    def GetNumItem(request):
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartitem = Cart.objects.filter(user_id=user).count()
            return cartitem
        else:
            return 0   

    def GetAmt(request):
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartamt = Cart.objects.filter(user_id=user).aggregate(Sum('price'))
            amt = cartamt.get('price__sum')
            return round(amt, 2)
        else:
            return 0

    def GetRel(request):
        cartitem = Books.objects.all().order_by('id')[:5]
        return cartitem
        # cartbooks = Cart.objects.filter(~Q(user = request.session['userid'])).only('id').all()[:6]
        # relbooks = Books.objects.filter(id__in=cartbooks).all()
        # return relbooks
    def Getaddr(request):
            user = request.session['userid']
            address = Address.objects.filter(user_id=user)
            if address:
                address = Address.objects.filter(user_id=user).all()
                return address
            else:
                return 0  
    def GetCats():
        return Category.objects.all()

@login_required(login_url='/account/register')
def checkoutpage(request):
    if request.POST:
        address = request.POST.get('address')
        if not address:
            messages.info(request, 'Please add billing address!')
            return redirect('/cart/checkout')
        mode = request.POST.get('mode')
        total = request.POST.get('total')
        if mode == '1':
            method = 'Pay on Delivery'
        elif mode == '2':
            method = 'Razorpay'
        else:
            method = 'Paypal'        
        user = request.session['userid']
        coupon = Cart.objects.filter(user_id=user, is_coupon=1)
        if coupon:
            iscoupon = True
            code = request.session['coupon']
            del request.session['coupon']
        else:
            iscoupon = False    
        Order(user_id=user,address_id=address,mode=method,total=total, is_coupon=iscoupon).save()
        oid = Order.objects.filter(user_id=user).latest('id')
        cart = Cart.objects.filter(user_id=user).all()
        for item in cart:
            orderitem = OrderItems()
            orderitem.order_id = oid.id
            orderitem.book_id = item.book_id
            orderitem.qty = item.qty
            orderitem.price = item.price
            orderitem.save()
            bookstock = Books.objects.get(id=item.book_id)
            stock = bookstock.stock - item.qty
            Books.objects.filter(id=item.book_id).update(stock=stock)
        Cart.objects.filter(user_id=user).all().delete()  
        if coupon:
            CouponOrders(order_id=oid.id, coupon_id=code, user_id=user).save()  
        request.session['order'] = oid.id
        return redirect(ordercomplete)

    else:    
        user = request.session['userid']
        coupon = Cart.objects.filter(user_id=user, is_coupon=1)
        if coupon:
            code = Coupon_entry.objects.filter(user_id=user).last()
            coupon_code = code.coupon.code
            discount = code.discount_price
        else:
            coupon = 0
            coupon_code = 'None'
            discount = 0.00
        total = GetElements.GetAmt(request)    
        grand_total = total - discount 
        grand_total = round(grand_total, 2)

        context = {
            'user': GetElements.Getuser(request),
            'cart': GetElements.GetCart(request),
            'numitem': GetElements.GetNumItem(request),
            'totamt': total,
            'categories': GetElements.GetCats(),
            'address': GetElements.Getaddr(request),
            'coupon':coupon,
            'coupon_code': coupon_code,
            'discount': discount,
            'gtotal': grand_total,
        }
        return render(request,'store/checkout.html', context)


@login_required(login_url='/account/login')
def ordercomplete(request):
    if not request.session.has_key('order'):
        return redirect('/')
    oid = request.session['order']
    o_detail = Order.objects.get(id=oid)
    o_items = OrderItems.objects.filter(order_id=oid).all()
    context = {
        'details': o_detail,
        'items': o_items,
        'user': GetElements.Getuser(request),
        'cart': GetElements.GetCart(request),
        'numitem': GetElements.GetNumItem(request),
        'totamt': GetElements.GetAmt(request),
    }    
    del request.session['order']
    return render(request, 'store/order-complete.html', context)        


@login_required(login_url='/account/login')
def applycoupon(request):
    code = request.GET.get('code')    
    user = request.session['userid']
    coupon = Coupon.objects.filter(code=code, is_active=True)
    if coupon:
        coupon = Coupon.objects.get(code=code)
        coupon_entry = CouponOrders.objects.filter(user_id=user, coupon_id=coupon.id)
        if coupon_entry:
            return JsonResponse({'status': 'fail', 'message': 'Coupon already used'})
        else:
            cartitem = Cart.objects.filter(user_id=user)  
            if cartitem:
                oldcartamt = GetElements.GetAmt(request)
                cartamt = GetElements.GetAmt(request) 
                discount = (cartamt / 100) * coupon.discount
                newtotal = round(cartamt - discount, 2)                
                # for item in items:
                #     price = (item.price / 100) * coupon.discount
                #     item.price = round(item.price - price, 2)
                #     item.save()
                #     discount += price
                Coupon_entry(coupon_id=coupon.id, user_id=user, discount_price=discount).save()  
                Cart.objects.filter(user_id=user).update(is_coupon=1)
                discount = round(discount, 2)   
                message = 'coupon applied! Congrats, You saved &#8377;'+str(discount)+' in this order.'
                request.session['coupon'] = coupon.id
                return JsonResponse({
                    'status': 'success',
                    'message': message,
                    'newtotal': newtotal,
                    'oldtotal': oldcartamt,
                    'discount': discount,
                    'code': coupon.code,
                    })    
            else:
                return JsonResponse({'status': 'fail', 'message': 'Invalid coupon code'})
    else:
        return JsonResponse({'status': 'fail', 'message': 'Invalid coupon code'})    


@login_required(login_url='/account/login')
def remove_coupon(request):
    user = request.session['userid']
    entry = Coupon_entry.objects.filter(user_id=user).last()
    entry.delete()
    cartitems = Cart.objects.filter(user_id=user, is_coupon=1)
    for item in cartitems:
        qty = item.qty
        price = item.book.sprice
        total = round((qty * price), 2)
        Cart.objects.filter(id=item.id).update(is_coupon=0, price=total)
    del request.session['coupon']
    subtotal = GetElements.GetAmt(request)     
    return JsonResponse({'status': 'success', 'message': 'Coupon removed', 'subtotal': subtotal})


@login_required(login_url='/account/login')
def createRazorpay(request):
    client = razorpay.Client(auth=(settings.RAZOR_KEY_ID, settings.RAZOR_KEY_SECRET))
    user = request.session['userid']
    coupon = Cart.objects.filter(user_id=user, is_coupon=1)
    if coupon:
        entry = Coupon_entry.objects.filter(user_id=user).last()   
        discountRate = entry.coupon.discount
        cartTotal = GetElements.GetAmt(request)
        discount = (cartTotal / 100) * discountRate   
        cartamt = cartTotal - discount
    else:    
        cartamt = GetElements.GetAmt(request)    
    grand_total = int(cartamt)
    razoramt = grand_total * 100
    DATA = {
        "amount": razoramt,
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {
            "mode": "test",
            }
        }
    order = client.order.create(data=DATA)    
    orderid = order['id']
    return JsonResponse({'status': 'success', 'message': 'order created', 'orderid': orderid})


@login_required(login_url='/account/login')
def buynowcoupon(request):
    code = request.GET.get('code')   
    bookid = request.GET.get('product')  
    user = request.session['userid']
    coupon = Coupon.objects.filter(code=code, is_active=True)
    if coupon:
        coupon = Coupon.objects.get(code=code)
        coupon_entry = CouponOrders.objects.filter(user_id=user, coupon_id=coupon.id)
        if coupon_entry:
            return JsonResponse({'status': 'fail', 'message': 'Coupon already used'})
        else: 
            cartitem = Cart.objects.filter(user_id=user, book_id=bookid)  
            if cartitem:
                item = Cart.objects.get(book_id=bookid, user_id=user)
                oldprice = item.price
                discount = (item.price / 100) * coupon.discount
                discount = round(discount, 2)  
                price = item.price - discount   
                # item.price = price
                # item.save() 
                Coupon_entry(coupon_id=coupon.id, user_id=user, discount_price=discount).save()  
                Cart.objects.filter(user_id=user, book_id=bookid).update(is_coupon=1)  
                message = 'coupon applied! Congrats, You saved &#8377;'+str(discount)+' in this order.'
                request.session['coupon'] = coupon.id
                return JsonResponse({
                    'status': 'success',
                    'message': message,
                    'newtotal': price,
                    'oldtotal': oldprice,
                    'discount': discount,
                    })    
            else:
                return JsonResponse({'status': 'fail', 'message': 'Invalid coupon code!'})
    else:
        return JsonResponse({'status': 'fail', 'message': 'Invalid coupon code'})    


@login_required(login_url='/account/login')
def buynowCouponRemove(request):
    user = request.session['userid']
    bookid = request.GET.get('product')
    entry = Coupon_entry.objects.filter(user_id=user).last()
    entry.delete()
    item = Cart.objects.get(user_id=user, book_id=bookid, is_coupon=1)
    qty = item.qty
    price = item.book.sprice
    total = round((qty * price), 2)
    Cart.objects.filter(id=item.id).update(is_coupon=0, price=total)
    return JsonResponse({'status': 'success', 'message': 'Coupon removed', 'subtotal': total})


@login_required(login_url='/account/login')
def buynowCheckout(request):
    id = request.POST.get('cartid')
    address = request.POST.get('address')
    mode = request.POST.get('mode')
    total = request.POST.get('total')
    if mode == '1':
        method = 'Pay on Delivery'
    elif mode == '2':
        method = 'Razorpay'
    else:
        method = 'Paypal'        
    user = request.session['userid']
    coupon = Cart.objects.filter(id=id, is_coupon=1)
    if coupon:
        code = Coupon_entry.objects.filter(user_id=user).last()
        iscoupon = True
    else:
        iscoupon = False    
    Order(user_id=user,address_id=address,mode=method,total=total, is_coupon=iscoupon).save()
    oid = Order.objects.filter(user_id=user).latest('id')
    cart = Cart.objects.get(id=id)
    orderitem = OrderItems()
    orderitem.order_id = oid.id
    orderitem.book_id = cart.book_id
    orderitem.qty = cart.qty
    orderitem.price = cart.price
    orderitem.save()
    Cart.objects.filter(id=id).delete()  
    if coupon:
        CouponOrders(order_id=oid.id, coupon_id=code.coupon_id, user_id=user).save()  
    request.session['order'] = oid.id
    return redirect(ordercomplete)


@login_required(login_url='/account/login')
def createBuynowRazorpay(request):    
    client = razorpay.Client(auth=(settings.RAZOR_KEY_ID, settings.RAZOR_KEY_SECRET))
    
    cartid = request.GET.get('product')    
    cartsum = Cart.objects.get(id=cartid)   
    cartamt = cartsum.price
    if cartsum.is_coupon == 1:
        user = request.session['userid']
        coupon = Coupon_entry.objects.filter(user_id = user).last()
        discountRate = coupon.coupon.discount
        discount = (cartamt / 100) * discountRate
        cartamt = cartamt - discount
    grand_total = int(cartamt)
    razoramt = grand_total * 100
    DATA = {
        "amount": razoramt,
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {
            "mode": "test",
            }
        }
    order = client.order.create(data=DATA)    
    orderid = order['id']
    return JsonResponse({'status': 'success', 'message': 'order created', 'orderid': orderid})

