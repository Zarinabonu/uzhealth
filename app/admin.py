from django.contrib import admin

from app.model.operator import Operator, StaffOperator
from app.model.type import ClassType
from .model import *


admin.site.register(Doctor)
admin.site.register(Function)
admin.site.register(Training)
admin.site.register(MedicalCandidate)
admin.site.register(Knowledge)
admin.site.register(Specialization)
admin.site.register(Speciality)
admin.site.register(University)
admin.site.register(Type)
admin.site.register(Institution)
admin.site.register(InstitutionType)
admin.site.register(City)
admin.site.register(District)
admin.site.register(ClassType)
admin.site.register(Operator)
admin.site.register(StaffOperator)
admin.site.register(Archive)

