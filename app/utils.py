import requests
from requests.auth import HTTPBasicAuth

from django.core.mail import EmailMultiAlternatives
from django.utils.html import strip_tags
from django.conf import settings


def send_sms(number, text):
    data = {
        "messages":
            [
                {
                    "recipient": number,
                    "message-id": 1113,
                    "sms": {
                        "originator": "3700",
                        "content": {
                            "text": text
                        }
                    }
                }
            ]
    }
    url = "http://91.204.239.42:8083/broker-api/send"
    requests.post(url, json=data, auth=HTTPBasicAuth('manpower', 'A1MeUf5'))


def send_email(title, text, emails):
    msg = EmailMultiAlternatives(title, strip_tags(text), settings.EMAIL_HOST_USER, emails)
    msg.attach_alternative(text, "text/html")
    msg.send()
