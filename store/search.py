from django.contrib import messages
from django.db.models.aggregates import Count, Sum
from store.models import Cart
from store.views import GetElements
from django.shortcuts import redirect, render
from adminpanel.models import Authors, Books, Category
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.views.decorators.cache import never_cache


def search(request):
    if not request.GET.get('q'):
        categories = Category.objects.all()
        Bookq = Books.objects.all()
        if request.GET.get('sort'):
            sort = request.GET.get('sort')
            if sort == '1':
                Bookq = Bookq.order_by('sprice')
            elif sort == '2':
                Bookq = Bookq.order_by('-sprice')   
            elif sort == '3':
                Bookq = Bookq.order_by('title')     
        else:
            sort = 0
        page = request.GET.get('page', 1)

        paginator = Paginator(Bookq, 6)
        try:
            books = paginator.page(page)
        except PageNotAnInteger:
            books = paginator.page(1)
        except EmptyPage:
            books = paginator.page(paginator.num_pages)    
        count = Books.objects.all().count()
        auth = Authors.objects.all()
        lang = Books.objects.order_by().values('language').distinct()

        context = {
        'count': count,
        'categories': categories,
        'books': books,
        'auth': auth,
        'user': GetElements.Getuser(request),
        'numitem': GetElements.GetNumItem(request),
        'totamt': GetElements.GetAmt(request),
        'lang': lang,
        'q': 0,
        'sort': sort,
        }
        return render(request, 'store/search.html', context)

    q = request.GET.get('q')


    Bookq = Books.objects.filter(Q(title__icontains=q) | Q(author_id__name__icontains=q) | Q(genre_id__title__icontains=q))
    if request.GET.get('sort'):
        sort = request.GET.get('sort')
        if sort == '1':
            Bookq = Bookq.order_by('sprice')
        elif sort == '2':
            Bookq = Bookq.order_by('-sprice')   
        elif sort == '3':
            Bookq = Bookq.order_by('title')   
    else:
        sort = 0
    page = request.GET.get('page', 1)

    paginator = Paginator(Bookq, 6)
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages) 

    count = Books.objects.filter(title__icontains=q).count()
  
    categories = Category.objects.all()
    auth = Authors.objects.all()
    lang = Books.objects.order_by().values('language').distinct()

    context = {
        'books': books,
        'count': count,
        'categories': categories,
        'auth': auth,
        'user': GetElements.Getuser(request),
        'numitem': GetElements.GetNumItem(request),
        'totamt': GetElements.GetAmt(request),
        'lang': lang,
        'q': q,
        'sort': sort,
    }

    return render(request, 'store/search.html', context)

def langBooks(request, id):  
    lang = Books.objects.filter(language=id)
    if lang:
        books = lang.all()
        if request.GET.get('sort'):
            sort = request.GET.get('sort')
            if sort == '1':
                books = books.order_by('sprice')
            elif sort == '2':
                books = books.order_by('-sprice')   
            elif sort == '3':
                books = books.order_by('title')   
        else:
            sort = 0
        count = books.count()
    else:
        return redirect('/store/search')

    page = request.GET.get('page', 1)

    paginator = Paginator(books, 6)
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages) 

    categories = Category.objects.all()
    auth = Authors.objects.all()
    langs = Books.objects.order_by().values('language').distinct()
    if request.session.has_key('user'): 
        context = {
            'books': books,
            'count': count,
            'categories': categories,
            'auth': auth,
            'user': GetElements.Getuser(request),
            'numitem': GetElements.GetNumItem(request),
            'totamt': GetElements.GetAmt(request),
            'lang': langs,
            'sort': sort,
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
            'count': count,
            'categories': categories,
            'auth': auth,
            'user': GetElements.Getuser(request),
            'numitem': numitems,
            'totamt': totamt,
            'lang': langs,
            'sort': sort,
        }       
    return render(request, 'store/lang.html', context)

@never_cache
def categoery_books(request, title):
    title = title.replace('_', ' ')
    category = Category.objects.filter(title__icontains=title)
    if category:
        books = Books.objects.filter(genre_id__title__icontains=title).all()
        if request.GET.get('sort'):
            sort = request.GET.get('sort')
            if sort == '1':
                books = books.order_by('sprice')
            elif sort == '2':
                books = books.order_by('-sprice')   
            elif sort == '3':
                books = books.order_by('title')   
        else:
            sort = 0

        page = request.GET.get('page', 1)

        paginator = Paginator(books, 6)
        try:
            books = paginator.page(page)
        except PageNotAnInteger:
            books = paginator.page(1)
        except EmptyPage:
            books = paginator.page(paginator.num_pages) 

        langs = Books.objects.order_by().values('language').distinct()
        count = Books.objects.filter(genre_id__title__icontains=title).count()
        if request.session.has_key('user'):
            context = {
                'books': books,
                'category': title,
                'count': count,
                'user': GetElements.Getuser(request),
                'categories': GetElements.categories(),
                'auth': GetElements.authors(),
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'totamt': GetElements.GetAmt(request),
                'sort': sort,
                'lang': langs,
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
                'count': count,
                'category': title,
                'categories': GetElements.categories(),
                'auth': GetElements.authors(),
                'user': GetElements.Getuser(request),
                'numitem': numitems,
                'totamt': totamt,
                'lang': langs,
                'sort': sort,
            }           
        return render(request, 'store/category.html',context)
    else:
        return redirect('/store/search')    


@never_cache
def author_books(request, name):
    name = name.replace('_', ' ')
    books = Books.objects.filter(author_id__name=name).all()
    if request.GET.get('sort'):
        sort = request.GET.get('sort')
        if sort == '1':
            books = books.order_by('sprice')
        elif sort == '2':
            books = books.order_by('-sprice')   
        elif sort == '3':
            books = books.order_by('title')   
    else:
        sort = 0

    page = request.GET.get('page', 1)

    paginator = Paginator(books, 6)
    try:
        books = paginator.page(page)
    except PageNotAnInteger:
        books = paginator.page(1)
    except EmptyPage:
        books = paginator.page(paginator.num_pages) 

    count = Books.objects.filter(author_id__name=name).count()
    langs = Books.objects.order_by().values('language').distinct()
    if books:
        if request.session.has_key('user'):
            context = {
                'books': books,
                'name': name,
                'count': count,
                'categories': GetElements.categories(),
                'user': GetElements.Getuser(request),
                'auth': GetElements.authors(),
                'numitem': GetElements.GetNumItem(request),
                'cartsum': GetElements.GetAmt(request),
                'totamt': GetElements.GetAmt(request),
                'sort': sort,
                'lang': langs,
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
                'name': name,
                'count': count,
                'categories': GetElements.categories(),
                'user': GetElements.Getuser(request),
                'auth': GetElements.authors(),
                'numitem': numitems,
                'cartsum': totamt,
                'totamt': totamt,
                'sort': sort,
                'lang': langs,
            }

        return render(request, 'store/author.html', context)

