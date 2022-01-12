from django.conf.urls import url
from django.urls import path
from . import views, orders

urlpatterns = [
    path('', views.panel),
    path('customer/view', views.cust_view),
    path('customer/block', views.cust_block),
    path('genres/view', views.gen_view),
    path('genres/add', views.gen_add),
    path('genres/edit', views.gen_edit),
    path('genres/delete', views.delete_g),
    path('authors/view', views.auth_view),
    path('authors/add', views.auth_add),
    path('authors/edit', views.auth_edit),
    path('authors/delete', views.delete_a),
    path('books/view', views.books_view),
    path('books/add', views.books_add),
    url(r'^books/edit/(?P<id>\w+)', views.books_edit),
    path('books/delete', views.books_delete),
    path('orders/view', orders.ordertable),
    url(r'^orders/view/(?P<id>\w+)', orders.orderview),
    url(r'^orders/update/(?P<id>\w+)', orders.update),
    path('coupons', views.coupons),
    path('coupons/add', views.coupon_add),
    url(r'^coupon/edit/(?P<id>\w+)', views.editCoupon),
    path('coupons/delete', views.couponDelete),
    path('offers', views.Offers),
    path('offers/add', views.OffersAdd),
    path('offers/delete', views.offersDelete),
    path('sales-report', views.salesReport),
    path('logout', views.logout),
]
