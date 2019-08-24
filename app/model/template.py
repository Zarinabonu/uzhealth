from django.db import models


class MessageTemplate(models.Model):
    title = models.CharField(max_length=255)
    text = models.TextField()

    class Meta:
        ordering = ('title', )
        db_table = 'templates'

    def __str__(self):
        return self.title