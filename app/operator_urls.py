from django.urls import path

from app.operator_view import OperatorDoctorListView, OperatorDoctorUpdatePage, OperatorDoctorDetailView, \
    OperatorDoctorCreatePage, TemplateDetailView, TemplateListView
from .views import IndexPage, AdminDoctorDetailView, AdminDoctorUpdatePage, AdminOperatorListPage
from .views import LoginPage
from .views import AdminCityListPage, AdminDistrictListPage
from .views import AdminUniversityListPage, AdminFacultyListPage
from .views import AdminInstitutionTypeListPage, AdminInstitutionListPage
from .views import AdminIndexPage
from .views import AdminDoctorListView

urlpatterns = [
    # path('administrator/region/city/list/', AdminCityListPage.as_view(), name='admin_region_city_list'),
    # path('administrator/region/district/list/', AdminDistrictListPage.as_view(), name='admin_region_district_list'),
    # path('administrator/university/university/list/', AdminUniversityListPage.as_view(), name='admin_university_university_list'),
    # path('administrator/university/faculty/list/', AdminFacultyListPage.as_view(), name='admin_university_faculty_list'),
    # path('administrator/institution/type/list/', AdminInstitutionTypeListPage.as_view(), name='admin_institution_type_list'),
    # path('administrator/institution/list/', AdminInstitutionListPage.as_view(), name='admin_institution_list'),
    path('doctor/list/', OperatorDoctorListView.as_view(), name='operator-doctor-list'),
    path('doctor/detail/<int:id>/', OperatorDoctorDetailView.as_view(), name='operator-doctor-detail'),
    path('doctor/update/<int:id>/', OperatorDoctorUpdatePage.as_view(), name='operator-doctor-update'),
    path('doctor/create/', OperatorDoctorCreatePage.as_view(), name='operator-doctor-create'),

    path('templates/list/', TemplateListView.as_view(), name='operator-template-list'),
    path('templates/detail/<int:id>', TemplateDetailView.as_view(), name='operator-template-detail'),
    # path('administrator/', AdminIndexPage.as_view(), name='admin_index'),
    # path('administrator/operator/list', AdminOperatorListPage.as_view(), name='operator-list'),

]