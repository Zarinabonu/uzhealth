from django.db import models


class ClassType(models.Model):
    name_uz = models.CharField(max_length=255)
    name_ru = models.CharField(max_length=255)