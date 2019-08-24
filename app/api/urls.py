from django.urls import path

from app.api.doctor.views import DoctorCreateAPIView, DoctorUpdateAPIView
from app.api.template.views import TemplateCreateAPIView, MessageSentAPIView
from .institution.views import InstitutionTypeCreateAPIView, InstitutionCreateAPIView, InstitutionListAPIView, \
    OperatorCreateAPIView, StaffOperatorCreateAPIView
from .region.views import CityCreateAPIView, DistrictCreateAPIView, DistrictListAPIView
from .university.views import UniversityCreateAPIView, FacultyCreateAPIView
from .spec.views import ClassTypeCreateAPIView

urlpatterns = [
    path('institution-type/create/', InstitutionTypeCreateAPIView.as_view(), name='institution-type.create.api'),
    path('institution/create/', InstitutionCreateAPIView.as_view(), name='institution.create.api'),
    path('institution/list/', InstitutionListAPIView.as_view(), name='institution.list.api'),
    path('operator/create/', OperatorCreateAPIView.as_view(), name='operator.create.api'),
    path('staffoperator/create/', StaffOperatorCreateAPIView.as_view(), name='staff.operator.create.api'),

    path('spec/create/', ClassTypeCreateAPIView.as_view(), name='spec.create.api'),

    path('region/city/create/', CityCreateAPIView.as_view(), name='region.city.create.api'),
    path('region/district/create/', DistrictCreateAPIView.as_view(), name='region.district.create.api'),
    path('region/district/list/', DistrictListAPIView.as_view(), name='region.district.list.api'),

    path('university/university/create/', UniversityCreateAPIView.as_view(), name='university.university.create.api'),
    path('university/faculty/create', FacultyCreateAPIView.as_view(), name='university.faculty.create.api'),

    path('doctor/create/', DoctorCreateAPIView.as_view(), name='doctor.create.api'),
    path('doctor/update/<int:id>', DoctorUpdateAPIView.as_view(), name='doctor.update.api'),

    path('template/create/', TemplateCreateAPIView.as_view(), name='template-create-api'),
    path('message/send/', MessageSentAPIView.as_view(), name='message-send-api'),
]
