from django.db import models


class Speciality(models.Model):
    name = models.TextField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'speciality'

    def __str__(self):
        return self.name
