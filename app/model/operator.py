from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

from app.model import Institution, City


class Operator(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    # full_name = models.CharField(max_length=255)
    institution = models.ForeignKey(Institution, on_delete=models.SET_NULL, null=True, blank=True)

@receiver(post_save, sender=User)
def gen_op(instance, created, **kwargs):
    if created:
        op = Operator.objects.create(user=instance)
        staff_op = StaffOperator.objects.create(user=instance)
        return op


class StaffOperator(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    # full_name = models.CharField(max_length=255)
    city = models.ForeignKey(City, on_delete=models.SET_NULL, null=True, blank=True)

