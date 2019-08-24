from django.db import models


class University(models.Model):
    name = models.CharField(max_length=255, unique=True)

    class Meta:
        ordering = ('name', )
        db_table = 'university_university'

    def __str__(self):
        return self.name


class Faculty(models.Model):
    name = models.CharField(max_length=255, unique=True)

    class Meta:
        ordering = ('name', )
        db_table = 'university_faculty'

    def __str__(self):
        return self.name
