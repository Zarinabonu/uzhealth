from django.db import models
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import User

from app.model import University, Faculty, Speciality, Institution
from app.model.type import ClassType
from django.db.models.signals import post_save
from datetime import datetime
import settings
from settings.settings import REGION_CODES
import pyqrcode
from django.core.files import File

GENDER = (
    (0, _('Male')),
    (1, _('Female')),
)


class Doctor(models.Model):
    full_name = models.CharField(null=True, max_length=255)
    passport_image = models.ImageField(null=True)
    passport_serial = models.CharField(null=True, max_length=255)
    birth_year = models.IntegerField(null=True)
    self_image = models.ImageField(null=True)
    gender = models.IntegerField(null=True, choices=GENDER)
    nationality = models.CharField(null=True, max_length=10)
    work_place = models.ForeignKey(Institution, on_delete=models.CASCADE, null=True, blank=True)
    # work_places = models.ForeignKey('WorkPlacesList', on_delete=models.CASCADE, null=True, blank=True,related_name='works')
    phone = models.CharField(max_length=255, null=True, blank=True)
    email = models.CharField(max_length=255, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    register_num = models.TextField(null=True,blank=True)
    qr_file = models.FileField(null=True, upload_to="files/")
    # auto_increment_id = models.AutoField(primary_key=True)


    class Meta:
        ordering = ('-id', )
        db_table = 'doctor'

    def __str__(self):
        return self.full_name


class WorkPlaces(models.Model):
    doctor = models.ForeignKey(Doctor, null=True, on_delete=models.DO_NOTHING, related_name='jobs')
    work_place = models.ForeignKey(Institution, on_delete=models.CASCADE, null=True, blank=True)


id = 1
@receiver(post_save, sender=Doctor)
def create_doctor_user(sender, instance, created, **kwargs):
    global id
    r5 = 0
    if created:
        currentYear = datetime.now().year
        r1 = str(currentYear % 10)
        r2 = str(datetime.now().month)
        if len(r2)==1:
            r2 = "0"+r2
        r3 = str(chr(65+datetime.today().weekday()))
        r4 = str(datetime.now().day)
        if len(r4)==1:
            r4 = "0"+r4
        r5 = str(id)

        if len(r5)==1:
            r5 = "00"+r5
        elif len(r5)==2:
            r5 = "0"+r5
        print(instance)
        r6 = str(REGION_CODES.get(instance.work_place.district.city.name_uz))
        print('WW',r1,r2,r3,r4,r5,r6)
        instance.register_num = r1+r2+r3+r4+r5+r6
        somesjon = '{"register": ' + instance.register_num + '}'
        quar = pyqrcode.create(somesjon)
        quar.svg('qr_code.svg', scale=8)
        local_file = open('qr_code.svg')
        djangofile = File(local_file)
        instance.qr_file.save('qr_img'+str(instance.id), djangofile)
        local_file.close()


        instance.save()

        id += 1





class Function(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    year = models.IntegerField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_function'

    def __str__(self):
        return self.doctor.full_name


class Knowledge(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    university = models.ForeignKey(University, on_delete=models.CASCADE, blank=True, null=True)
    faculty = models.ForeignKey(Faculty, on_delete=models.CASCADE)
    year = models.IntegerField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_knowledge'

    def __str__(self):
        return self.doctor.full_name


class MedicalCandidate(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, null=True)
    year = models.IntegerField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_medical_candidate'

    def __str__(self):
        return self.doctor.full_name


class Specialization(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    speciality = models.ForeignKey(Speciality, on_delete=models.CASCADE)
    year = models.TextField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_specialization'

    def __str__(self):
        return self.speciality.name


class Training(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    speciality = models.ForeignKey(Speciality, on_delete=models.CASCADE)
    year = models.IntegerField(null=True)
    hours = models.IntegerField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_training'

    def __str__(self):
        return self.doctor.full_name


class Type(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    type = models.ForeignKey(ClassType, on_delete= models.CASCADE, null=True, blank=True)
    name = models.ForeignKey(Speciality, on_delete=models.CASCADE, null=True, blank=True)
    year = models.TextField(null=True)

    class Meta:
        ordering = ('-id', )
        db_table = 'doctor_type'

    def __str__(self):
        return self.doctor.full_name
