from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.db.models.aggregates import Sum
from django.db.models.query_utils import Q
from django.http.response import HttpResponse, JsonResponse
from adminpanel.models import Authors, Category
from store.models import Cart, Order, OrderItems, Wishlist
from .forms import CreateUserForm
from django.shortcuts import render
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from store import views as storeview
from adminpanel import views as adminview
from .models import Account, Address, MyAddress
from django.contrib import messages
from . import twilio_client


def register(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):
        return redirect(adminview.panel)    
    else:    
        form = CreateUserForm() 

        if request.POST:
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                if request.session.has_key('guest'):
                    device = request.COOKIES['device']
                    cartItems = Cart.objects.filter(guest_user=device)
                    if cartItems:
                        user = Account.objects.latest('id')
                        userid = user.id
                        Cart.objects.filter(guest_user=device).update(user_id=userid, guest_user=True)
                    del request.COOKIES['device']
                user = Account.objects.get(email=form.cleaned_data['email'])
                # messages.info(request, 'Registration successfull, Please login to your account!')
                # return redirect(loginpage)
                request.session['user'] = user.email
                request.session['userid'] = user.id
                login(request, user)
                messages.info(request, 'READit account created for '+user.email)
                return redirect(storeview.store)
            
        context = {'form': form}
        return render(request, 'register.html', context)  
       

def loginpage(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):
        return redirect(adminview.panel)    
    else: 
        if request.POST:
            email = request.POST.get('email', False)
            password = request.POST.get('password')
            obj = Account.objects.filter(email=email)
            if obj:
                obj = Account.objects.get(email=email)
                user = authenticate(request, phone = obj.phone, password = password)
                if user:
                    login(request, user)
                    if obj.is_superuser == 0:
                        request.session['user'] = obj.email
                        request.session['userid'] = obj.id
                        if request.GET.get('next'):
                            next = request.GET.get('next')
                            messages.info(request, 'Signed in as '+obj.email)
                            return redirect(next)
                        else:    
                            messages.info(request, 'Signed in as '+obj.email)
                            return redirect(storeview.store)
                    else:
                        request.session['admin'] = obj.email
                        if request.GET.get('next'):
                            next = request.GET.get('next')
                            return redirect(next)
                        return redirect(adminview.panel)    
                else:      
                    messages.error(request, 'Invalid credentials!')
                    return render(request, 'login.html') 
            else:      
                messages.error(request, 'Invalid credentials!')
                return render(request, 'login.html')           
        else:        
            return render(request, 'login.html')    

@login_required(login_url='/account/login')
def myaccount(request):
    if request.session.has_key('user'):
        useremail = request.session['user']
        user = Account.objects.get(email = useremail)
        def Getaddr():
            address = MyAddress.objects.filter(user_id=user.id)
            if address:
                address = MyAddress.objects.filter(user_id=user.id).all()
                return address
            else:
                return 0    
        def Wishlists():
            wlist = Wishlist.objects.filter(user_id=user.id)
            if wlist:
                wlist = Wishlist.objects.filter(user_id=user.id).all()
                return wlist
            else:
                return 0  
        def GetCart():
            if request.session.has_key('userid'):
                user = request.session['userid']
                cart = Cart.objects.filter(user_id=user)
                if cart:
                    cartitem = Cart.objects.filter(user_id=user).all().order_by('id')[:2]
                    return cartitem
                else:
                    return 0
            else:
                return -1            
        def GetNumItem():
            if request.session.has_key('userid'):
                user = request.session['userid']
                cart = Cart.objects.filter(user_id=user)
                if cart:
                    cartitem = Cart.objects.filter(user_id=user).count()
                    return cartitem
                else:
                    return 0
            else:
                return 0     

        def GetAmt():
            if request.session.has_key('userid'):
                user = request.session['userid']
                cart = Cart.objects.filter(user_id=user)
                if cart:
                    cartamt = Cart.objects.filter(user_id=user).aggregate(Sum('price'))
                    amt = cartamt.get('price__sum')
                    return amt
                else:
                    return 0
            else:
                return 0  

        def GetOrders(request):
            if request.session.has_key('userid'):
                user = request.session['userid']
                orders = Order.objects.filter(user_id=user).all().order_by('-id')
                if orders:
                    return orders
                else:
                    return 0    

        def orderItems(request):
            if request.session.has_key('userid'):
                user = request.session['userid']
                items = OrderItems.objects.all()
                if items:
                    return items
        action = Order.objects.filter(user_id=user.id, is_active=1, status='Placed')
        if action:
            count = 1
        else:
            count = 0
        genres = Category.objects.all()
        authors = Authors.objects.all()
        context = {
            'user': user,
            'address': Getaddr(),
            'wishlist': Wishlists(),
            'cart': GetCart(),
            'numitem': GetNumItem(),
            'totamt': GetAmt(),
            'orders': GetOrders(request),
            'items': orderItems(request),
            'count': count,
            'genres': genres,
            'auth': authors,

        }
        return render(request, 'my-account.html', context)    
    elif request.session.has_key('admin'):
        return redirect(adminview.panel)     
    

def update_profile(request):
    fname = request.GET.get('fname')
    email = request.GET.get('email')
    phone = request.GET.get('phone')
    userid = request.session['userid']

    user = Account.objects.filter(Q(email=email), ~Q(id=userid))
    if user:
        return JsonResponse({'status': 'fail', 'message': 'Email already exists!'})
    else:
        user = Account.objects.filter(Q(phone = phone), ~Q(id=userid))
        if user:
            return JsonResponse({'status': 'fail', 'message': 'Phone number already registered!'})
        else:
            Account.objects.filter(id=userid).update(fullname=fname,email=email,phone=phone)
            request.session['user'] = email
            return JsonResponse({'status': 'success', 'message': 'Changes saved!'})

def update_password(request):
    curr_pass = request.GET.get('cpass') 
    new_pass =  request.GET.get('npass')  
    user = Account.objects.get(email=request.session['user'])
    phone = user.phone
    user = authenticate(phone=phone, password=curr_pass)
    if user:
        up_user = Account.objects.get(phone=phone)
        up_user.set_password(new_pass)
        up_user.save()
        return JsonResponse({'status': 'success', 'message': 'Password changed'})
    else:
        return JsonResponse({'status': 'fail', 'message': 'Invalid Password'})              

@login_required(login_url='/account/login')
def saveaddress(request):
    fname = request.POST.get('fname')
    state = request.POST.get('state')
    city = request.POST.get('city')
    address = request.POST.get('address')
    phone = request.POST.get('phone')
    zip = request.POST.get('zip')
    user = Account.objects.get(email=request.session['user'])
    id = user.id
    Address(name=fname, state=state, city=city, address=address, zip=zip, mobile=phone, user_id=id).save()
    MyAddress(name=fname, state=state, city=city, address=address, zip=zip, mobile=phone, user_id=id).save()

    if request.POST.get('next'):
        next = request.POST.get('next')
        return redirect(next)
    return redirect(myaccount)

@login_required(login_url='/account/login')
def address_edit(request, id):
    fname = request.POST.get('fname')
    state = request.POST.get('state')
    city = request.POST.get('city')
    address = request.POST.get('address')
    phone = request.POST.get('phone')
    zip = request.POST.get('zip')
    Address.objects.filter(id=id).update(name=fname, state=state, city=city, address=address, zip=zip, mobile=phone)
    MyAddress.objects.filter(id=id).update(name=fname, state=state, city=city, address=address, zip=zip, mobile=phone)

    return redirect(myaccount)

@login_required(login_url='/account/login')
def address_delete(request, id):
    add = MyAddress.objects.filter(id=id)
    if add:
        MyAddress.objects.filter(id=id).delete()
        messages.info(request, 'Address deleted!')
        return redirect(myaccount)


def admin(request):
    return render('admin/')        

def logout(request):
    auth.logout(request)
    return redirect(loginpage)    


def otpverify(request):
    if request.method == 'POST':
        phone = '+91'+request.POST.get('phone')
        user = Account.objects.filter(phone = phone, is_active=1)
        if user:
            request.session['phone_number'] = phone
            verification = twilio_client.verifications(phone, 'sms')
            return redirect(token_validation)
        else:
            messages.info(request, 'Invalid phone number!')
            return redirect(loginpage)    
    else:
        return redirect(loginpage) 
    
def token_validation(request):
    if not request.session.has_key('phone_number'):
        messages.info(request, 'Enter phone number')
        return redirect(otpverify)
    if request.method == 'POST':
            verification = twilio_client.verification_checks(request.session['phone_number'], request.POST.get('code'))

            if verification.status == 'approved':
                request.session['is_verified'] = True
                return redirect(verified)
            else:
                messages.error(request, 'Enter valid OTP')
                return render(request, 'enter-otp.html')
    else:
        return render(request, 'enter-otp.html')


def verified(request):
    if not request.session.get('is_verified'):
        return redirect(otpverify)
    else:
        phone = request.session['phone_number']
        user = Account.objects.get(phone=phone)   
        request.session['user'] = user.email
        request.session['userid'] = user.id
        login(request, user)
        messages.info(request, 'Signed in as '+user.email) 
        return redirect(storeview.store)

def orderCancel(request, id):
    order = Order.objects.filter(id=id)
    if order:
        order = Order.objects.filter(id=id).update(is_active=0)
        messages.info(request, 'Order cancelled!')
        return redirect('/account/me')

