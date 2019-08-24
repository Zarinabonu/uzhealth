from django.db import models
from django.db.models import Count
from django.utils.translation import gettext_lazy as _


class City(models.Model):
    name_uz = models.CharField(max_length=255)
    name_ru = models.CharField(max_length=255)

    class Meta:
        ordering = ('-name_ru', )
        db_table = 'cities'
        verbose_name = _('City')
        verbose_name_plural = _('Cities')

    def __str__(self):
        return self.name_ru

    @property
    def getDoctorCount(self):
        c = 0
        for d in self.district_set.all():
            c += d.getDoctorCount
        return c


class District(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    name_uz = models.CharField(max_length=255)
    name_ru = models.CharField(max_length=255)

    class Meta:
        ordering = ('-name_ru', )
        db_table = 'districts'
        verbose_name = _('District')
        verbose_name_plural = _('Districts')

    def __str__(self):
        return self.name_ru

    @property
    def getDoctorCount(self):
        # print(self.institution_set.aggregate(dcount=Count('doctor'))['dcount'])
        return self.institution_set.aggregate(dcount=Count('doctor'))['dcount']