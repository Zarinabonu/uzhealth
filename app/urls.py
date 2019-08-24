from django.urls import path

from .views import IndexPage, AdminDoctorDetailView, AdminDoctorUpdatePage, AdminOperatorListPage, AdminSpecListPage, AdminDistrictStatisticPage, TemplateListView, TemplateDetailView
from .views import LoginPage
from .views import AdminCityListPage, AdminDistrictListPage
from .views import AdminUniversityListPage, AdminFacultyListPage
from .views import AdminInstitutionTypeListPage, AdminInstitutionListPage
from .views import AdminIndexPage
from .views import AdminDoctorListView

urlpatterns = [

    path('region/city/list/', AdminCityListPage.as_view(), name='admin_region_city_list'),
    path('region/district/list/', AdminDistrictListPage.as_view(), name='admin_region_district_list'),
    path('university/university/list/', AdminUniversityListPage.as_view(), name='admin_university_university_list'),
    path('university/faculty/list/', AdminFacultyListPage.as_view(), name='admin_university_faculty_list'),
    path('spec/list/', AdminSpecListPage.as_view(), name='admin-spec-list-page'),
    path('institution/type/list/', AdminInstitutionTypeListPage.as_view(), name='admin_institution_type_list'),
    path('institution/list/', AdminInstitutionListPage.as_view(), name='admin_institution_list'),
    path('doctor/list/', AdminDoctorListView.as_view(), name='admin_doctor_list'),
    path('doctor/detail/<int:id>/', AdminDoctorDetailView.as_view(), name='admin_doctor_detail'),
    path('doctor/update/<int:id>/', AdminDoctorUpdatePage.as_view(), name='admin_doctor_update'),
    path('', AdminIndexPage.as_view(), name='admin_index'),
    path('operator/list', AdminOperatorListPage.as_view(), name='operator-list'),

    path('templates/list/', TemplateListView.as_view(), name='template-list'),
    path('templates/detail/<int:id>', TemplateDetailView.as_view(), name='template-detail'),

    path('statistics/<int:id>/', AdminDistrictStatisticPage.as_view(), name='admin-city-statistic-by-district'),

]
