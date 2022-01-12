from django.conf.urls import url
from django.urls import path

from store import search
from . import checkout
from . import views

urlpatterns = [
    path('', views.store),
    path('wishlist/', views.wishlist),
    url(r'^wishlist/add/(?P<id>\w+)', views.wishlist_add),
    url(r'^wishlist/delete/(?P<id>\w+)', views.wishlist_delete),
    url(r'^book/(?P<id>\w+)', views.book_view),
    url(r'^cart/add/(?P<id>\w+)', views.cart_add),
    url(r'^cart/move/(?P<id>\w+)', views.cart_move),
    url(r'^cart/delete/(?P<id>\w+)', views.cart_delete),
    url(r'^cart/min/(?P<id>\w+)', views.cart_min),
    url(r'^cart/plus/(?P<id>\w+)', views.cart_plus),
    path('cart', views.cart),
    path('cart/checkout', checkout.checkoutpage),
    path('cart/ordersuccess', checkout.ordercomplete),
    path('store/search', search.search),
    url(r'^category/(?P<title>\w+)', search.categoery_books),
    url(r'^author/(?P<name>\w+)', search.author_books),
    url(r'^lang/(?P<id>\w+)', search.langBooks),
    path('checkout/applycoupon', checkout.applycoupon),
    path('checkout/remove-coupon', checkout.remove_coupon),
    path('checkout', views.checkout),
    path('razorpay/create', checkout.createRazorpay),
    path('razorpay/buynow/create', checkout.createBuynowRazorpay),
    path('buynow/applycoupon', checkout.buynowcoupon),
    path('buynow/remove-coupon', checkout.buynowCouponRemove),
    path('buynow/checkout', checkout.buynowCheckout),

]
