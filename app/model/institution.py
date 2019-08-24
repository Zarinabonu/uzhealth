from django.db import models
from django.contrib.auth.models import User
from .region import District



class InstitutionType(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        ordering = ('name', )
        db_table = 'institution_type'

    def __str__(self):
        return self.name


class Institution(models.Model):
    district = models.ForeignKey(District, on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255, default='', null=True)
    type = models.ForeignKey(InstitutionType, on_delete=models.SET_NULL, blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'institution'

    def __str__(self):
        return self.name
