import datetime
import imp
import os
import base64
from django.core.files.base import ContentFile
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.contrib import messages 
from django.db.models.aggregates import Count, Sum
from django.db.models.query_utils import Q
from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from accounts.models import Account
from store.models import Coupon, Order, OrderItems
from .models import Authors, Books, Category, Offer
from store import views as storeview
from accounts import views as accview
from .reports import monthReport,yearReport,pendingOrder,totalOrder, categoryEarnings, paymentCount, statusReport

@login_required(login_url='/account/login')
def panel(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):
        
        status = statusReport()    
        month_order = monthReport(request)
        if month_order.get('total__sum') >= 0:
            month_order = round(month_order.get('total__sum'), 2)
            year_order = yearReport(request)
            year_order = round(year_order.get('total__sum'), 2)
        else:    
            month_order = 0
            year_order = 0
        result = categoryEarnings(request)
        paycount = paymentCount(request)
        book = OrderItems.objects.values('book_id__genre_id__title').annotate(cat_count=Sum('qty')).order_by('-cat_count')[:6]
        context = {
            'curr_month_order_sum': month_order,
            'curr_year_order_sum': year_order,
            'pending': pendingOrder(request),
            'totalOrder': totalOrder(request),
            'catbook': book,
            'result': result,
            'paycount': paycount,
            'statusCount': status,
        }
        
        return render(request, 'index.html', context)    
    else: 

        return redirect(accview.loginpage)

@login_required(login_url='/account/login')    
def salesReport(request):
    if request.POST:
        if request.POST.get('start'):
            date1 = request.POST.get('start')
            date2 = request.POST.get('end')
            books = OrderItems.objects.values('book_id', 'book_id__title').filter(order_id__status = 'Delivered', order_id__date_added__gte = date1, order_id__date_added__lte = date2).annotate(mode_count=Sum('qty'), sum_prce=(Sum('price'))).order_by('-sum_prce')
            totalOrders = OrderItems.objects.filter(order_id__status = 'Delivered', order_id__date_added__range = [date1, date2]).aggregate(Sum('qty'))
            totalSum = OrderItems.objects.filter(order_id__status = 'Delivered', order_id__date_added__range = [date1, date2]).aggregate(Sum('price'))
            dates = 'From : '+date1+' To: '+date2
            bookcount = books.count()
        else:
            date = request.POST.get('month')   
            date =  date.split('-')
            year = date[0]
            month = date[1]
            books = OrderItems.objects.values('book_id', 'book_id__title').filter(order_id__status = 'Delivered', order_id__date_added__year = year, order_id__date_added__month = month).annotate(mode_count=Sum('qty'), sum_prce=(Sum('price'))).order_by('-sum_prce')
            totalOrders = OrderItems.objects.filter(order_id__status = 'Delivered', order_id__date_added__year = year, order_id__date_added__month = month).aggregate(Sum('qty'))
            totalSum = OrderItems.objects.filter(order_id__status = 'Delivered', order_id__date_added__year = year, order_id__date_added__month = month).aggregate(Sum('price'))
            months = ['', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            dates = 'Report: '+months[int(month)]+', '+year
            bookcount = books.count()
    else:
        books = 1
        totalOrders = 0
        totalSum = 0
        dates = ''
        bookcount = 0
    today = str(datetime.date.today()) 
    today = today.split('-')
    todayEarnings = Order.objects.filter(date_added__year = today[0],date_added__month = today[1],date_added__day = today[2], status = 'Delivered').aggregate(Sum('total'))  
    todayOrders = Order.objects.filter(date_added__year = today[0],date_added__month = today[1],date_added__day = today[2]).count() 
    todayPending = Order.objects.filter(date_added__year = today[0],date_added__month = today[1],date_added__day = today[2], status = 'Placed').count() 
    context = {
        'books': books,
        'totalOrders': totalOrders,
        'totalSum': totalSum,
        'dates': dates,
        'count': bookcount,
        'todayEarnings': todayEarnings,
        'todayOrders': todayOrders,
        'todayPending': todayPending,
    }
    return render(request, 'sales_report.html', context)    

@login_required(login_url='/account/login')
def cust_view(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):    
        users = Account.objects.filter(is_admin=0).all()
        return render(request, 'customer.html', {'users': users})    
    else: 
        return redirect(accview.loginpage)

@login_required(login_url='/account/login')
def cust_block(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):  
        id = request.GET.get('id')
        user = Account.objects.filter(id=id)
        if user:
            user = Account.objects.get(id=id)
            if user.is_active == True:
                Account.objects.filter(id=id).update(is_active=False)
                return redirect(cust_view)
            else:  
                Account.objects.filter(id=id).update(is_active=True)
                return redirect(cust_view)  
        return redirect(cust_view)    
    else: 
        return redirect(accview.loginpage)


@login_required(login_url='/account/login')
def gen_view(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'): 
        genres = Category.objects.all()
        return render(request, 'genres.html', {'genres': genres}) 
    else: 
        return redirect(accview.loginpage)


@login_required(login_url='/account/login')
def gen_add(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'): 
        if request.POST:
            title = request.POST.get('title')   
            gen = Category.objects.filter(title=title)
            if gen:
                messages.info(request, 'Genre exists!')
                return redirect(gen_view)
            else:    
                new = Category()
                new.title = title
                new.save() 
                messages.info(request, 'Genre added!')
                return redirect(gen_view)   
        else:    
            return render(request, 'add_genres.html')     
    else: 
        messages.info(request, 'Login first!')
        return redirect(accview.loginpage)         

@login_required(login_url='/account/login')
def gen_edit(request):
    if request.POST:
        id = request.POST.get('id')
        gen = Category.objects.filter(id=id)
        if gen:
            Category.objects.filter(id=id).update(title=request.POST.get('title'))
            messages.info(request, 'Genre updated!')
            return redirect(gen_view)
    else:
        id = id = request.GET.get('id')
        gen = Category.objects.get(id=id)
        return render(request, 'edit_genre.html', {'gen': gen})


@login_required(login_url='/account/login')
def delete_g(request):
    id = request.GET.get('id')
    g = Category.objects.filter(id=id)
    if g:
        Books.objects.filter(genre=id).delete()
        Category.objects.filter(id=id).delete()
        messages.info(request, 'Genre deleted!')
        return redirect(gen_view) 

@login_required(login_url='/account/login')
def delete_a(request):
    id = request.GET.get('id')
    g = Authors.objects.filter(id=id)
    if g:
        Books.objects.filter(author=id).delete()
        Authors.objects.filter(id=id).delete()
        return redirect(auth_view) 


@login_required(login_url='/account/login')
def auth_view(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'): 
        authors = Authors.objects.all()
        return render(request, 'authors.html', {'authors': authors})  
    else:
        return redirect(accview.loginpage)    

@login_required(login_url='/account/login')
def auth_add(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):
        if request.POST:
            name = request.POST.get('name')
            auth = Authors.objects.filter(name=name)
            if auth:
                return redirect(auth_view)
            else:
                new = Authors()
                new.name = name
                new.save()  
                return redirect(auth_view)   
        else:        
            return render(request, 'add_author.html')  
    else:
        return redirect(accview.loginpage) 

@login_required(login_url='/account/login')
def auth_edit(request):
    if request.POST:
        id = request.POST.get('id')
        auth = Authors.objects.filter(id=id)
        if auth:
            Authors.objects.filter(id=id).update(name=request.POST.get('name'))
            return redirect(auth_view)
    else:
        id = id = request.GET.get('id')
        auth = Authors.objects.get(id=id)
        return render(request, 'edit_author.html', {'auth': auth})

@login_required(login_url='/account/login')
def books_view(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'): 
        def Getbooks():
            if request.GET.get('cat'):
                books = Books.objects.filter(genre_id=request.GET.get('cat')).all()
                return books
            else:
                return Books.objects.all()

        
        auth = Authors.objects.all()
        genres = Category.objects.all()
        context = {
            'books': Getbooks(), 
            'authors': auth, 
            'genres': genres,
        }
        return render(request, 'books.html', context) 
    else:
        return redirect(accview.loginpage)    


@login_required(login_url='/account/login')
def books_add(request):
    if request.session.has_key('user'):
        return redirect(storeview.store)
    elif request.session.has_key('admin'):
        if request.method == "POST":
            category = request.POST.get('genre')
            price = request.POST.get('price')
            price = float(price)
            prodDiscount = request.POST.get('discount')
            prodDiscount = float(prodDiscount)
            cat_offer = Offer.objects.filter(category_id=category)
            if cat_offer:
                offer = Offer.objects.get(category_id=category)
                if offer.discount > prodDiscount:
                    discountRange = offer.discount
                    discount = (price / 100) * discountRange
                    sprice = price -discount
                    is_catoffer = True
                    newoffer = offer.discount
                else:
                    newoffer = False
                    is_catoffer = False
                    sprice = request.POST.get('lastp')    
            else:
                is_catoffer =False
                newoffer = False
                sprice = request.POST.get('lastp')    
            prod = Books()
            prod.title = request.POST.get('title')
            prod.genre_id = request.POST.get('genre')
            prod.author_id = request.POST.get('author')
            prod.desc = request.POST.get('desc')
            prod.stock = request.POST.get('stock')
            prod.publisher = request.POST.get('publisher')
            prod.language = request.POST.get('language')
            prod.price = price
            prod.sprice = sprice
            prod.discount = request.POST.get('discount')
            prod.is_catoffer = is_catoffer
            prod.newoffer = newoffer

            book_title = request.POST.get('title')
            images1 = request.POST.get('cropped_image1')
            images2 = request.POST.get('cropped_image2')
            images3 = request.POST.get('cropped_image3')
            format, img1 = images1.split(';base64,')
            ext = format.split('/')[-1]
            book_image1 = ContentFile(base64.b64decode(img1), name= book_title + '1.' + ext)

            format, img2 = images2.split(';base64,')
            ext = format.split('/')[-1]
            book_image2 = ContentFile(base64.b64decode(img2), name= book_title + '2.' + ext)

            format, img3 = images3.split(';base64,')
            ext = format.split('/')[-1]
            book_image3 = ContentFile(base64.b64decode(img3), name= book_title + '3.' + ext)

            if len(request.FILES) != 0:
                prod.image = book_image1
                prod.image1 = book_image2
                prod.image2 = book_image3

            prod.save()
            return redirect(books_add)
        else:
            auth = Authors.objects.all()
            genre = Category.objects.all()
            return render(request, 'add_book.html', {'auth': auth, 'genre': genre})
    else:
        return redirect(accview.loginpage)         

@login_required(login_url='/account/login')
def books_edit(request, id):
    if request.POST:
        category = request.POST.get('genre')
        price = request.POST.get('price')
        price = float(price)
        prodDiscount = request.POST.get('discount')
        prodDiscount = float(prodDiscount)
        cat_offer = Offer.objects.filter(category_id=category)
        if cat_offer:
            offer = Offer.objects.get(category_id=category)
            if offer.discount > prodDiscount:
                discountRange = offer.discount
                discount = (price / 100) * discountRange
                sprice = price -discount
                is_catoffer = True
                newoffer = offer.discount
            else:
                newoffer = False
                is_catoffer = False
                sprice = request.POST.get('lastp')
        else:
            sprice = request.POST.get('lastp')   
            is_catoffer = False
            newoffer = False
        id = request.POST.get('id')
        prod = Books.objects.get(id=id)
        prod.title = request.POST.get('title')
        prod.genre_id = request.POST.get('genre')
        prod.author_id = request.POST.get('author')
        prod.desc = request.POST.get('desc')
        prod.price = price
        prod.sprice = sprice
        prod.discount = request.POST.get('discount')
        prod.stock = request.POST.get('stock')
        prod.publisher = request.POST.get('publisher')
        prod.language = request.POST.get('language')
        prod.is_catoffer = is_catoffer
        prod.newoffer = newoffer
        if len(request.FILES) != 0:
            if len(prod.image) > 0:
                os.remove(prod.image.path)
            prod.image = request.FILES['image']    

        prod.save()
        return redirect(books_view)
            
    else:    
        book = Books.objects.filter(id=id)
        if book:
            books = Books.objects.get(id=id)
            auth = Authors.objects.all()
            genres = Category.objects.all()
            return render(request, 'edit_book.html', {'books': books, 'auth': auth, 'genre': genres})
        return render(request, 'edit_book.html')

@login_required(login_url='/account/login')
def books_delete(request):
    id = request.GET.get('id')
    book = Books.objects.filter(id=id)
    if book:
        book = Books.objects.filter(id=id).delete()
        return redirect(books_view)

@login_required(login_url='/account/login')
def logout(request):
    auth.logout(request)
    return redirect(accview.loginpage)

@login_required(login_url='/account/login')
def coupons(request):
    coupons = Coupon.objects.all()
    category = Category.objects.all()
    context = {
        'coupons': coupons,
        'category': category,
    }
    return render(request, 'coupons.html', context)    

@login_required(login_url='/account/login')
def coupon_add(request):
    code = request.POST.get('code')
    discount = request.POST.get('discount')

    coupon = Coupon.objects.filter(code=code)
    if coupon:
        messages.error(request, 'Coupon code exists')
        return redirect('/adminpanel/coupons')
    else:
        obj = Coupon()
        obj.code = code
        obj.discount = discount
        obj.save()
        messages.Error(request, 'Coupon code added')
        return redirect('/adminpanel/coupons')
        
@login_required(login_url='/account/login')
def editCoupon(request, id):
    coupon = Coupon.objects.get(id=id)
    if coupon.is_active == True:
        Coupon.objects.filter(id=id).update(is_active=False)
        label = 'Enable'
        message = 'Disabled'
        return JsonResponse({'status': 'success', 'message': message, 'label': label})        
    else:
        Coupon.objects.filter(id=id).update(is_active=True)
        label = 'Disable'
        message = 'Enabled'
        return JsonResponse({'status': 'success', 'message': message, 'label': label})    

@login_required(login_url='/account/login')
def couponDelete(request):
    id = request.POST.get('coupon')

    coupon = Coupon.objects.filter(id=id)
    if coupon:
        Coupon.objects.filter(id=id).delete()
        messages.Info(request, 'Coupon Deleted') 
        return redirect('/adminpanel/coupons')
    else:
        messages.Info(request, 'Coupon not found') 
        return redirect('/adminpanel/coupons')    

@login_required(login_url='/account/login')
def Offers(request):
    category = Category.objects.all()
    offers = Offer.objects.all()
    context = {
        'category': category,
        'offers': offers,
    }
    return render(request, 'offers.html', context)        

@login_required(login_url='/account/login')
def OffersAdd(request):
    if request.POST:
        category = request.POST.get('category')
        offer = request.POST.get('discount')
        offer = float(offer)
        exist = Offer.objects.filter(category_id=category)
        if exist:
            Offer.objects.filter(category_id=category).delete()

        books = Books.objects.filter(genre_id=category)
        if books:
            for book in books:
                if offer > book.discount:
                    mrp = book.price
                    discountAmt = (mrp / 100) * int(offer)
                    book.sprice = mrp - discountAmt
                    book.is_catoffer = True
                    book.newoffer = offer
                    book.save()
        else:
            messages.Error(request, 'No books found')
            return redirect('/adminpanel/offers')   
        Offer(category_id=category, discount=offer).save()        
        messages.Info(request, 'Offer added!')
        return redirect('/adminpanel/offers')   
    else:
        return redirect('/adminpanel/offers')    

@login_required(login_url='/account/login')
def offersDelete(request):
    id = request.POST.get('offer')
    offer = Offer.objects.filter(id=id)
    if offer:
        offer = Offer.objects.get(id=id)
        category = offer.category_id        
        books = Books.objects.filter(genre_id=category, is_catoffer = True)
        if books:
            for book in books:
                mrp = book.price
                discount  = book.discount
                discountamt = (mrp / 100) * discount
                book.sprice = mrp - discountamt
                book.is_catoffer = False
                book.save()
        else:
            Offer.objects.filter(id=id).delete()
            return redirect('/adminpanel/offers') 
        Offer.objects.filter(id=id).delete()
        messages.Error(request, 'Deleted!')
        return redirect('/adminpanel/offers')    
    else:
        messages.Error(request, 'No offer found')
        return redirect('/adminpanel/offers')                  