from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from accounts.models import Account, Address
from adminpanel.models import Books, Authors, Category, Offer
from .models import Cart, Coupon_entry, Wishlist
import logging
from django.db.models import Q,Sum
from django.contrib import messages
from django.template import Library
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache



# register = Library()
# logger = logging.getLogger(__name__)


# @register.filter
# def sub(value, arg):
#     """Subtract the arg from the value."""
#     try:
#         nvalue, narg = handle_float_decimal_combinations(
#             valid_numeric(value), valid_numeric(arg), '-'
#         )
#         return nvalue - narg
#     except (ValueError, TypeError):
#         try:
#             return value - arg
#         except Exception:
#             return ''


# @register.filter
# def mul(value, arg):
#     """Multiply the arg with the value."""
#     try:
#         nvalue, narg = handle_float_decimal_combinations(
#             valid_numeric(value), valid_numeric(arg), '*'
#         )
#         return nvalue * narg
#     except (ValueError, TypeError):
#         try:
#             return value * arg
#         except Exception:
#             return ''


# @register.filter
# def div(value, arg):
#     """Divide the arg by the value."""
#     try:
#         nvalue, narg = handle_float_decimal_combinations(
#             valid_numeric(value), valid_numeric(arg), '/'
#         )
#         return nvalue / narg
#     except (ValueError, TypeError):
#         try:
#             return value / arg
#         except Exception:
#             return ''

class GetElements:
    def Getuser(request):
        if not request.session.has_key('userid'):
            return 0
        user = Account.objects.get(id=request.session['userid'])
        return user  

    def GetCart(request):
        if not request.session.has_key('userid'):
            return -1
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartitem = Cart.objects.filter(user_id=user).all()[:1]
            return cartitem
        else:
            return 1

    def GetCartFull(request):
        if not request.session.has_key('userid'):
            return -1
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartitem = Cart.objects.filter(user_id=user).all()
            return cartitem
        else:
            return 1        
          
    def GetNumItem(request):
        if not request.session.has_key('userid'):
            return 0
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user)
        if cart:
            cartitem = Cart.objects.filter(user_id=user).count()
            return cartitem
        else:
            return 0   

    def GetAmt(request):
        if not request.session.has_key('userid'):
            return 0
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
        
    def categories():
        return Category.objects.all()     

    def authors():
        return Authors.objects.all()
    def Getaddr(request):
            user = request.session['userid']
            address = Address.objects.filter(user_id=user)
            if address:
                address = Address.objects.filter(user_id=user).all()
                return address
            else:
                return 0      

@never_cache
def store(request):
    books = Books.objects.all()
    recent = Books.objects.order_by('?').first()
    categories = Category.objects.order_by('?')
    offers = Offer.objects.last()
    context = {
        'books': books, 
        'genres': categories, 
        'auth': GetElements.authors(),
        'user': GetElements.Getuser(request),
        'numitem': GetElements.GetNumItem(request),
        'totamt': GetElements.GetAmt(request),
        'recent': recent,
        'offer': offers,
    }
    return render(request, 'store/index.html', context)
    # else:
    #     if not request.COOKIES['device']:
    #         context = {
    #         'books': books, 
    #         'genres': categories, 
    #         'auth': GetElements.authors(),
    #         'user': GetElements.Getuser(request),
    #         'numitem': GetElements.GetNumItem(request),
    #         'totamt': GetElements.GetAmt(request),
    #         'recent': recent,
    #         'offer': offers,
    #         }
    #     else: 
    #         device = request.COOKIES['device']
    #         cart = Cart.objects.filter(guest_user=device)
    #         if cart:  
    #             cartitems = Cart.objects.filter(guest_user=device).all()
    #             numitems = cartitems.count()
    #             totamt = cartitems.aggregate(Sum('price'))
    #             totamt = totamt.get('price__sum')
    #         else:
    #             cartitems = 0
    #             numitems = 0
    #             totamt = 0    
    #         context = {
    #             'books': books, 
    #             'genres': categories, 
    #             'auth': GetElements.authors(),
    #             'user': GetElements.Getuser(request),
    #             'numitem': numitems,
    #             'totamt': totamt,
    #             'recent': recent,
    #             'offer': offers,
    #         }  


@never_cache
def book_view(request, id):
    id = id.replace('_', ' ')
    book = Books.objects.filter(title=id)
    if book:
        books = Books.objects.get(title=id)
        gid = books.genre
        rel = Books.objects.filter(Q(author_id = books.author_id) | Q(genre_id = books.genre_id), ~Q(id=books.id))
        if not books.image1:
            bookimgs = 0
        else:
            bookimgs = 1  
        if request.session.has_key('user'):    
            context = {
                'books': books,
                'genres': GetElements.categories,
                'auth': GetElements.authors,
                'gid': gid,
                'rel': rel,
                'user': GetElements.Getuser(request),
                'cart': GetElements.GetCart(request),
                'numitem': GetElements.GetNumItem(request),
                'totamt': GetElements.GetAmt(request),
                'bookimgs': bookimgs,
            }
        else:
            device = request.COOKIES['device']
            cart = Cart.objects.filter(guest_user=device)
            if cart:  
                cartitems = Cart.objects.filter(guest_user=device).all()
                numitems = cartitems.count()
                totamt = cartitems.aggregate(Sum('price'))
                totamt = totamt.get('price__sum')
            else:
                cartitems = 0
                numitems = 0
                totamt = 0 
            context = {
                'books': books,
                'genres': GetElements.categories,
                'auth': GetElements.authors,
                'gid': gid,
                'rel': rel,
                'user': GetElements.Getuser(request),
                'cart': cartitems,
                'numitem': numitems,
                'totamt': totamt,
                'bookimgs': bookimgs,
            }

        return render(request, 'store/book_view.html', context)


def wishlist_add(request, id):
    if request.session.has_key('user'):
        book = Books.objects.filter(id=id)
        if book:
            user = Account.objects.get(email=request.session['user'])
            wbook = Wishlist.objects.filter(user_id=user.id, book_id=id)
            if wbook:
                messages.info(request, 'Book already in your wishlist!') 
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next)
                return redirect(store)
            else:
                Wishlist(user_id=user.id, book_id=id).save()
                messages.info(request, 'Added to wishlist!') 
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next)
                return redirect(store) 
        else:
            return redirect(store)            
    else:
        device = request.COOKIES['device']
        book = Books.objects.filter(id=id)
        if book:
            wbook = Wishlist.objects.filter(guest_user=device, book_id=id)
            if wbook:
                messages.info(request, 'Book already in your wishlist!') 
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next)
                return redirect(store)
            else:
                Wishlist(guest_user=device, book_id=id).save()
                messages.info(request, 'Added to wishlist!') 
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next)
                return redirect(store) 
        else:
            return redirect(store)   


def wishlist_delete(request, id):    
    if request.session.has_key('user'):
        wlist = Wishlist.objects.filter(id=id)
        if wlist:
            wlist = Wishlist.objects.filter(id=id).delete()
            messages.info(request, 'Product removed!') 
            return redirect(wishlist)
        else:  
            messages.info(request, 'No such item!') 
            return redirect(wishlist)   
    else:
        device = request.COOKIES['device']
        wlist = Wishlist.objects.filter(guest_user=device)
        if wlist:
            wlist = Wishlist.objects.filter(id=id).delete()
            messages.info(request, 'Product removed!') 
            return redirect(wishlist)
        else:  
            messages.info(request, 'No such item!') 
            return redirect(wishlist) 
               


def wishlist(request):
    if request.session.has_key('user'):
        user = Account.objects.get(email= request.session['user'])
        wlist = Wishlist.objects.filter(user_id=user.id)
        categories = Category.objects.all()
        if wlist:
            context = {
            'user': GetElements.Getuser(request),
            'cart': GetElements.GetCart(request),
            'numitem': GetElements.GetNumItem(request),
            'totamt': GetElements.GetAmt(request),
            'categories': categories,
            'wlist': wlist,
            } 
            wlist = Wishlist.objects.filter(user_id=user.id).all()
            return render(request, 'store/wishlist.html', context)
        else:
            context = {
            'user': GetElements.Getuser(request),
            'cart': GetElements.GetCart(request),
            'numitem': GetElements.GetNumItem(request),
            'totamt': GetElements.GetAmt(request),
            'categories': categories,
            } 
            return render(request, 'store/wishlist.html', context)
    else:
        device = request.COOKIES['device']
        categories = Category.objects.all()
        cart = Cart.objects.filter(guest_user=device)
        if cart:  
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            totamt = cartitems.aggregate(Sum('price'))
            totamt = totamt.get('price__sum')
        else:
            cartitems = 0
            numitems = 0
            totamt = 0 
        wlist = Wishlist.objects.filter(guest_user=device)
        if wlist:
            context = {
            'user': GetElements.Getuser(request),
            'numitem': numitems,
            'totamt': totamt,
            'wlist': wlist,
            'categories': categories,
            } 
            return render(request, 'store/wishlist.html', context)
        else:
            context = {
            'user': GetElements.Getuser(request),
            'numitem': numitems,
            'totamt': totamt,
            'totamt': GetElements.GetAmt(request),
            } 
            return render(request, 'store/wishlist.html', context)

def cart_add(request, id):
    if request.session.has_key('user'):
        user = request.session['userid']
        book = Books.objects.filter(id=id, stock__gte=1)
        if book:
            books = Books.objects.get(id=id)
            price = books.sprice
            cart = Cart.objects.filter(user_id=user, book_id=id)
            if cart:
                cartitem = Cart.objects.get(user_id=user, book_id=id)
                if request.GET.get('qty'):
                    postqty = request.GET.get('qty')
                    if book.stock - int(postqty) >= 1:
                        qty = cartitem.qty + int(request.GET.get('qty'))
                    else:
                        message = 'Requested quantity '+request.GET.get('qty')+' not available!'
                        return JsonResponse({ 'status' : 'fail','message': message})
                else:
                    qty = cartitem.qty + 1 
                cartitem.qty = qty
                cartitem.price = cartitem.qty * price
                cartitem.save()
                numitem = GetElements.GetNumItem(request)
                cartsum = GetElements.GetAmt(request)
                return JsonResponse({ 'status' : 'success', 'numitem': numitem, 'cartsum': cartsum})   
            else:
                if request.GET.get('qty'):
                    postqty = request.GET.get('qty')
                    if book.stock - int(postqty) >= 1:
                        qty = request.GET.get('qty')
                        price = price * int(qty)
                    else:
                        message = 'Requested quantity '+request.GET.get('qty')+' not available!'
                        return JsonResponse({ 'status' : 'fail','message': message})    
                else:
                    qty = 1
                Cart(user_id=user, book_id=id, price=price,qty=qty).save()  
                numitem = GetElements.GetNumItem(request)
                cartsum = GetElements.GetAmt(request)
                return JsonResponse({ 'status' : 'success','cartsum': cartsum, 'numitem': numitem}) 
        else:        
            return JsonResponse({ 'status' : 'fail','message': 'Book is out of stock!'})
    else: 
        device = request.COOKIES['device']
        request.session['guest'] = device
        book = Books.objects.filter(id=id, stock__gte=1)
        if book:
            books = Books.objects.get(id=id)
            price = books.sprice
            cart = Cart.objects.filter(guest_user=device, book_id=id)
            if cart:
                cartitem = Cart.objects.get(guest_user=device, book_id=id)
                if request.GET.get('qty'):
                    postqty = request.GET.get('qty')
                    if book.stock - int(postqty) >= 1:
                        qty = cartitem.qty + int(request.GET.get('qty'))
                    else:
                        message = 'Requested quantity '+request.GET.get('qty')+' not available!'
                        return JsonResponse({ 'status' : 'fail','message': message})    
                else:
                    qty = cartitem.qty + 1 
                cartitem.qty = qty
                cartitem.price = cartitem.qty * price
                cartitem.save()
                cartitems = Cart.objects.filter(guest_user=device).all()
                numitems = cartitems.count()
                totamt = cartitems.aggregate(Sum('price'))
                totamt = totamt.get('price__sum')
                return JsonResponse({ 'status' : 'success', 'numitem': numitems, 'cartsum': totamt})
            else:
                if request.GET.get('qty'):
                    postqty = request.GET.get('qty')
                    if book.stock - int(postqty) >= 1:
                        qty = request.GET.get('qty')
                        price = price * int(qty)
                    else:
                        message = 'Requested quantity '+request.GET.get('qty')+' not available!'
                        return JsonResponse({ 'status' : 'fail','message': message})      
                else:
                    qty = 1
                Cart(guest_user=device, book_id=id, price=price,qty=qty).save() 
                cartitems = Cart.objects.filter(guest_user=device).all()
                numitems = cartitems.count()
                totamt = cartitems.aggregate(Sum('price'))
                totamt = totamt.get('price__sum')  
                return JsonResponse({ 'status' : 'success','cartsum': totamt, 'numitem': numitems})     
        else:        
            return JsonResponse({ 'status' : 'fail','message': 'Book is out of stock!'})

@never_cache
def cart(request):
    if request.session.has_key('user'):

        context = {
            'user': GetElements.Getuser(request),
            'cart': GetElements.GetCartFull(request),
            'numitem': GetElements.GetNumItem(request),
            'totamt': GetElements.GetAmt(request),
            'auth': GetElements.authors(),
            'genres': GetElements.categories(),
        }
    else:
        device = request.COOKIES['device']
        cart = Cart.objects.filter(guest_user=device)
        if cart:
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            totamt = cartitems.aggregate(Sum('price'))
            totamt = totamt.get('price__sum')
        else:
            cartitems = 1
            numitems = 0
            totamt = 0   
        context = {
            'auth': GetElements.authors(),
            'genres': GetElements.categories(),
            'cart': cartitems,
            'numitem': numitems,
            'totamt': totamt,
            'user': GetElements.Getuser(request),
        }
    return render(request, 'store/cart.html', context)        


def cart_delete(request, id):
    if request.session.has_key('user'):
        item = Cart.objects.filter(id=id)
        if item:
            user = request.session['userid']
            coupon = Cart.objects.filter(user_id=user, is_coupon=1)
            if coupon:
                Cart.objects.filter(id=id).delete()
                coupon = Cart.objects.filter(user_id=user, is_coupon=1)
                if not coupon:
                    entry = Coupon_entry.objects.filter(user_id=user).last()
                    entry.delete()
                    del request.session['coupon']
            else:        
                Cart.objects.filter(id=id).delete()
               
            # messages.info(request, 'Book removed from cart!')
            return JsonResponse({'status': 'success',
            'numitem': GetElements.GetNumItem(request),
            'cartsum': GetElements.GetAmt(request)}) 
        else:
            messages.info(request, 'no such item!')
            if request.GET.get('next'):
                next = request.GET.get('next')
                return redirect(next)
            else:
                return redirect(store)
    else:
        item = Cart.objects.filter(id=id)
        if item:
            device = device = request.COOKIES['device']
            item.delete()
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            if numitems > 0:
                totamt = cartitems.aggregate(Sum('price'))
                totamt = totamt.get('price__sum')
            else:
                totamt = 0    
            return JsonResponse({'status': 'success',
            'numitem': numitems,
            'cartsum': totamt,
            })
        else:
            messages.info(request, 'no such item!')
            if request.GET.get('next'):
                next = request.GET.get('next')
                return redirect(next)
            else:
                return redirect(store)


def cart_move(request, id):
    if request.session.has_key('user'):  
        wlist = Wishlist.objects.filter(id=id)
        user = request.session['userid']
        if wlist:
            wish = Wishlist.objects.get(id=id)
            book = wish.book_id
            cart = Cart.objects.filter(book_id=book, user_id=user)
            if cart:
                messages.error(request, 'Item already in cart!')
                return redirect('/wishlist')
            else:    
                Cart(user_id=user, book_id=book, price=wish.book.sprice).save()
                Wishlist.objects.filter(id=id).delete()
                messages.info(request, 'Book moved to cart!')
                return redirect(wishlist)      
        else:
            messages.info(request, 'No such item!')
            return redirect(wishlist)      
    else:
        device = request.COOKIES['device']
        wlist = Wishlist.objects.filter(id=id)
        if wlist:
            wish = Wishlist.objects.get(id=id)
            book = wish.book_id
            cart = Cart.objects.filter(book_id=book, guest_user=device)
            if cart:
                messages.error(request, 'Item already in cart!')
                return redirect('/wishlist')
            else:    
                Cart(guest_user=device, book_id=book, price=wish.book.sprice).save()
                Wishlist.objects.filter(id=id).delete()
                messages.info(request, 'Book moved to cart!')
                return redirect(wishlist)      
        else:
            messages.info(request, 'No such item!')
            return redirect(wishlist)      


def cart_min(request, id):
    if request.session.has_key('user'):
        item = Cart.objects.get(id=id)
        if item.qty == 1:
            Cart.objects.filter(id=id).delete()
            return JsonResponse({'status': 'success',
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'qty': 0})
        else:
            price = round(item.price-item.book.sprice, 2)
            Cart.objects.filter(id=id).update(qty=item.qty-1,price=price)    
            itemqty = Cart.objects.get(id=id) 
            return JsonResponse({'status': 'success',
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'qty': itemqty.qty,
                'price': itemqty.price})
    else:
        device = request.COOKIES['device']
        item = Cart.objects.get(id=id)
        if item.qty == 1:
            Cart.objects.filter(id=id).delete()
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            if numitems > 0:
                totamt = cartitems.aggregate(Sum('price'))
                totamt = totamt.get('price__sum')
            else:
                totamt = 0    
            return JsonResponse({'status': 'success',
                'numitem': numitems,
                'cartsum': totamt,
                'qty': 0})
        else:
            price = round(item.price-item.book.sprice, 2)
            Cart.objects.filter(id=id).update(qty=item.qty-1,price=price)    
            itemqty = Cart.objects.get(id=id) 
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            totamt = cartitems.aggregate(Sum('price'))
            totamt = totamt.get('price__sum')
            return JsonResponse({'status': 'success',
                'numitem': numitems,
                'cartsum': totamt,
                'qty': itemqty.qty,
                'price': itemqty.price})


def cart_plus(request, id):
    if request.session.has_key('user'):   
        item = Cart.objects.get(id=id)
        book = Books.objects.get(id=item.book_id)
        stock = book.stock
        if (stock - item.qty) >= 1:
            price = round(item.price+item.book.sprice,2)
            Cart.objects.filter(id=id).update(qty=item.qty+1,price=price)   
            itemqty = Cart.objects.get(id=id) 
            return JsonResponse({
                'status': 'success',
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'qty': itemqty.qty,
                'price': itemqty.price
                })       
        else:
            return JsonResponse({ 'status' : 'fail','message': 'Book is out of stock!'})
    else:
        device = request.COOKIES['device']
        item = Cart.objects.get(id=id)
        book = Books.objects.get(id=item.book_id)
        stock = book.stock
        if (stock - item.qty) >= 1:
            price = round(item.price+item.book.sprice,2)
            Cart.objects.filter(id=id).update(qty=item.qty+1,price=price)   
            itemqty = Cart.objects.get(id=id) 
            cartitems = Cart.objects.filter(guest_user=device).all()
            numitems = cartitems.count()
            totamt = cartitems.aggregate(Sum('price'))
            totamt = totamt.get('price__sum')
            return JsonResponse({
                'status': 'success',
                'numitem': numitems,
                'cartsum': totamt,
                'qty': itemqty.qty,
                'price': itemqty.price
                })       
        else:
            return JsonResponse({ 'status' : 'fail','message': 'Book is out of stock!'})


@login_required(login_url='/account/register')
@never_cache
def checkout(request):
    if request.POST:
        qty = request.POST.get('qty')
        bookid = request.POST.get('bookid')
        user = request.session['userid']
        cart = Cart.objects.filter(user_id=user, book_id=bookid)
        if cart:
            Cart.objects.filter(user_id=user, book_id=bookid).delete()
        book = Books.objects.get(id=bookid)
        if (book.stock - int(qty)) >= 1: 
            total = round(int(qty) * book.sprice, 2)
            Cart(user_id=user, book_id=bookid, qty=qty, price=total).save()
            item = Cart.objects.filter(user_id=user).last()
            coupon = Cart.objects.filter(id=item.id, is_coupon=1)
            if coupon:
                code = Coupon_entry.objects.filter(user_id=user).last()
                coupon_code = code.coupon.code
                discount = code.discount_price
            else:
                coupon = 0
                coupon_code = 'None'
                discount = 0.00
            context = {
                'item': item,
                'user': GetElements.Getuser(request),
                'address': GetElements.Getaddr(request),
                'coupon':coupon,
                'coupon_code': coupon_code,
                'discount': discount,
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'totamt': GetElements.GetAmt(request),
            }
        else:
            messages.error(request, 'Book out of stock')
            title = book.title.replace(' ', '_')
            return redirect('/book/'+title)
        return render(request, 'store/buynow.html', context)
    else:
        return redirect('/cart')    