from django.urls import path

from app.staff_views import IndexPage, StaffDoctorListView, StaffDoctorDetailView, StaffDoctorUpdatePage, \
    StaffOperatorListPage, TemplateListView, TemplateDetailView, QR_Code_Get_DoctorInfo

urlpatterns = [

    path('doctor/list/', StaffDoctorListView.as_view(), name='staff_doctor_list'),
    path('doctor/detail/<int:id>/', StaffDoctorDetailView.as_view(), name='staff_doctor_detail'),
    path('doctor/update/<int:id>/', StaffDoctorUpdatePage.as_view(), name='staff_doctor_update'),
    path('', IndexPage.as_view(), name='staff_index'),
    path('operator/list', StaffOperatorListPage.as_view(), name='staff_operator-list'),

    path('templates/list/', TemplateListView.as_view(), name='staff_template-list'),
    path('templates/detail/<int:id>', TemplateDetailView.as_view(), name='staff_template-detail'),
    path('operator/qr/detail', QR_Code_Get_DoctorInfo.as_view(), name='staff_operator-qr-detail'),

]
