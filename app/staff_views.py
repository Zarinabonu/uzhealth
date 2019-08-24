import datetime

from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.generic import TemplateView, ListView, DetailView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import authenticate, login, logout
from pure_pagination.mixins import PaginationMixin


# main views
from app.model import University, District, City, Faculty, Institution, InstitutionType, Doctor, Specialization, \
    Speciality
from app.model.operator import Operator, StaffOperator
from app.model.template import MessageTemplate


class IndexPage(LoginRequiredMixin, TemplateView):
    template_name = 'staff/index.html'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        arr = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50-55', '55-60', '60-65', '65-70', '70-75', '75-80', '80-85']
        arr2 = []
        today = datetime.datetime.now()
        year = today.year

        listt = [year - 20, year - 25, year - 30, year - 35, year - 40, year - 45, year - 50, year - 55, year - 60, year - 65, year - 70, year - 75, year - 80, year - 85]
        for i in range(0, len(listt) - 1):
            s_op = StaffOperator.objects.get(user=self.request.user)
            doctors = Doctor.objects.filter(work_place__district__city=s_op.city)
            doctors = doctors.filter(birth_year__gte=listt[i + 1])
            doctors = doctors.filter(birth_year__lte=listt[i])
            arr2.append(doctors.count())
        response = [{'range': i, 'doctor_count': dc} for i, dc in zip(arr, arr2)]

        context['by_ages'] = response
        context['male_cnt'] = Doctor.objects.filter(work_place__district__city=s_op.city, gender=0).count()
        context['female_cnt'] = Doctor.objects.filter(work_place__district__city=s_op.city, gender=1).count()
        return context


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class TemplateListView(ListView):
    template_name = 'staff/templates/list.html'
    queryset = MessageTemplate.objects.all()
    context_object_name = 'templates'


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class TemplateDetailView(DetailView):
    template_name = 'staff/templates/detail.html'
    model = MessageTemplate
    context_object_name = 'template'
    pk_url_kwarg = 'id'
    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)

        context['cities'] = City.objects.all()
        context['doctors'] = Doctor.objects.all()
        return context



# Staffistrator views
@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class StaffIndexPage(TemplateView):
    template_name = 'staff/index.html'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        c_op = StaffOperator.objects.get(user=self.request.user)
        context['districts'] = District.objects.filter(city=c_op.city)

        # context = super().get_context_data(*args, **kwargs)
        arr = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50-55', '55-60', '60-65', '65-70', '70-75', '75-80', '80-85']
        arr2 = []
        today = datetime.datetime.now()
        year = today.year


        listt = [year - 20, year - 25, year - 30, year - 35, year - 40, year - 45, year - 50, year - 55, year - 60, year - 65, year - 70, year - 75, year - 80, year - 85]
        for i in range(0, len(listt) - 1):
            doctors = Doctor.objects.filter(birth_year__gte=listt[i + 1])
            doctors = doctors.filter(birth_year__lte=listt[i])
            arr2.append(doctors.count())
        response = [{'range': i, 'doctor_count': dc} for i, dc in zip(arr, arr2)]

        context['by_ages'] = response
        # context['districts'] = District.objects.all()
        return context


# class DoctorsByYearAPIView(APIView):
#     def get(self, request):
#         arr = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50-55', '55-60', '60-65', '65-70', '70-75', '75-80', '80-85']
#         arr2 = []
#         today = datetime.datetime.now()
#         year = today.year
#
#         listt = [year - 20, year - 25, year - 30, year - 35, year - 40, year - 45, year - 50, year - 55, year - 60, year - 65, year - 70, year - 75, year - 80, year - 85]
#         for i in range(0, len(listt) - 1):
#             doctors = Doctor.objects.filter(birth_year__gte=listt[i + 1])
#             doctors = doctors.filter(birth_year__lte=listt[i])
#             arr2.append(doctors.count())
#         response = [{'range': i, 'doctor_count': dc} for i, dc in zip(arr, arr2)]
#         return HttpResponse(response, content_type="application/json")




@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class StaffDoctorListView(PaginationMixin, ListView):
    template_name = 'staff/doctor/list.html'
    paginate_by = 10
    context_object_name = 'doctors'

    def get_queryset(self):
        c_op = StaffOperator.objects.get(user=self.request.user)
        qs = Doctor.objects.filter(work_place__district__city=c_op.city)
        if self.request.GET.get('fullname'):
            qs = qs.filter(full_name__icontains=self.request.GET.get('fullname'))
        if self.request.GET.get('gender'):
            if self.request.GET.get('gender') == 'm':
                qs = qs.filter(gender=0)
            else:
                qs = qs.filter(gender=1)
        if self.request.GET.get('age'):
            qs = qs.filter(birth_year=2019-int(self.request.GET.get('age')))

        return qs

@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class StaffDoctorDetailView(DetailView):
    template_name = 'staff/doctor/detail.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'

@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class StaffDoctorUpdatePage(DetailView):
    template_name = 'staff/doctor/update.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'

@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_staff), name='dispatch')
class StaffOperatorListPage(ListView):
    template_name = 'staff/operators/list.html'
    queryset = Operator.objects.filter(user__is_staff=False)
    context_object_name = 'operators'

    def get_queryset(self):
        c_op = StaffOperator.objects.get(user=self.request.user)
        qs = Operator.objects.filter(user__is_staff=False, institution__isnull=False, institution__district__city=c_op.city)
        return qs

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        c_op = StaffOperator.objects.get(user=self.request.user)
        # print(c_op.city)
        context['districts'] = District.objects.filter(city=c_op.city)
        return context


