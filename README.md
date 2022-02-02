# Readit

Readit is an e-commerce website for book stores that integrated so many features like OTP login, payment gateway(PayPal and razor pay) and also provides a graphical representation of sales along with weekly, yearly, and daily sales reports which can be downloaded.

## Installation

Python and Django need to be installed
.

```bash
pip install django
```

## Usage
Goto main folder and run

```python
python manage.py runserver
```
Then go to the browser and enter the URL http://127.0.0.1:8000/


## Users side:
- User registration and login with validation
- User verification using OTP
- Order Management
- Cart Management
- Address Management
- Coupon Codes
- Offer Management
- Category wise listing
- Different Payment Gateways

## Admin side:
- Order statistics
- Product, order management
- Image cropping
- Category Management
- Offers, Coupon Management
- User Management
- Sales Report and download options

## Integrated
- Twilio for OTP verification.
- RazorPay for payment.
- PayPal for payment.

Hosted in AWS.
Used Nginx as a proxy server and also as a load balancer.


## Link
[Readit](https://readitnow.store/)
