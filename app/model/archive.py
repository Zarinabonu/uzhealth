from django.db import models
from django.contrib.auth.models import User
from .region import District
from .institution import Institution
from .doctor import Doctor


class Archive(models.Model):
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    doctor = models.ForeignKey(Doctor, on_delete=models.DO_NOTHING)
    from_institution = models.ForeignKey(Institution, on_delete=models.DO_NOTHING, related_name='from_inst')
    to_institution = models.ForeignKey(Institution,on_delete=models.DO_NOTHING, related_name='to_inst')
    date = models.DateTimeField(auto_now_add=True)