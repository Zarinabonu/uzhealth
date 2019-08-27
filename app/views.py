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
    template_name = 'operator/index.html'

    def dispatch(self, request, *args, **kwargs):

        if request.user.is_authenticated:
            if request.user.is_superuser:
                return HttpResponseRedirect(reverse('admin_index'))
            elif request.user.is_staff:
                return HttpResponseRedirect(reverse('staff_index'))
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        arr = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50-55', '55-60', '60-65', '65-70', '70-75', '75-80', '80-85']
        arr2 = []
        today = datetime.datetime.now()
        year = today.year

        listt = [year - 20, year - 25, year - 30, year - 35, year - 40, year - 45, year - 50, year - 55, year - 60, year - 65, year - 70, year - 75, year - 80, year - 85]
        for i in range(0, len(listt) - 1):
            doctors = Doctor.objects.filter(jobs__work_place__user=self.request.user)
            doctors = doctors.filter(birth_year__gte=listt[i + 1])
            doctors = doctors.filter(birth_year__lte=listt[i])
            arr2.append(doctors.count())
        response = [{'range': i, 'doctor_count': dc} for i, dc in zip(arr, arr2)]
        context['by_ages'] = response

        list = []
        list2 = []
        special_list = Speciality.objects.all()
        for s in special_list:
            doc = Doctor.objects.filter(jobs__work_place__user=self.request.user)
            doc = doc.filter(specialization__speciality=s)
            list.append(doc.count())
            list2.append(s.name)
        response = [{'speciality': spec, 'doctor_count': dcount} for spec, dcount in zip(list2, list)]
        print('LIST OF SPECIALIZATION: ', response)


        op = Operator.objects.get(user=self.request.user)

        context['male_cnt'] = Doctor.objects.filter(work_place=op.institution, gender=0).count()
        context['female_cnt'] = Doctor.objects.filter(work_place=op.institution, gender=1).count()
        return context


class TemplateListView(ListView):
    template_name = 'administrator/templates/list.html'
    queryset = MessageTemplate.objects.all()
    context_object_name = 'templates'


class TemplateDetailView(DetailView):
    template_name = 'administrator/templates/detail.html'
    model = MessageTemplate
    context_object_name = 'template'
    pk_url_kwarg = 'id'
    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)

        context['cities'] = City.objects.all()
        context['doctors'] = Doctor.objects.all()
        return context


class LoginPage(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return HttpResponseRedirect(reverse('index'))
        return render(request, 'login.html', {'error': True})


class LogoutView(LoginRequiredMixin, View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('login'))


# administrator views
@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminIndexPage(TemplateView):
    template_name = 'administrator/index.html'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)

        context['cities'] = City.objects.all()

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

        list = []
        list2 = []
        special_list = Speciality.objects.all()
        city = City.objects.all()
        for s in special_list:
            # doc = Doctor.objects.filter(work_place__district__city=c)
            doc = Doctor.objects.filter(specialization__speciality=s)
            list.append(doc.count())
            list2.append(s.name)
        response = [{'speciality': spec, 'doctor_count': dcount} for spec, dcount in zip(list2, list)]
        context['male_cnt'] = Doctor.objects.filter(gender=0).count()
        context['female_cnt'] = Doctor.objects.filter(gender=1).count()


        # context['districts'] = District.objects.all()
        return context


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminDistrictStatisticPage(DetailView):
    template_name = 'administrator/statistics/city.html'
    model = City
    context_object_name = 'city'
    pk_url_kwarg = 'id'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        arr = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50-55', '55-60', '60-65', '65-70', '70-75', '75-80', '80-85']
        arr2 = []
        today = datetime.datetime.now()
        year = today.year
        city_id = self.kwargs['id']

        listt = [year - 20, year - 25, year - 30, year - 35, year - 40, year - 45, year - 50, year - 55, year - 60, year - 65, year - 70, year - 75, year - 80, year - 85]
        for i in range(0, len(listt) - 1):
            # =city_id)
            doctors = Doctor.objects.filter(jobs__work_place_id=city_id)
            doctors = doctors.filter(birth_year__gte=listt[i + 1])
            doctors = doctors.filter(birth_year__lte=listt[i])
            arr2.append(doctors.count())
        response = [{'range': i, 'doctor_count': dc} for i, dc in zip(arr, arr2)]

        context['by_ages'] = response
        list = []
        list2=[]
        special_list = Speciality.objects.all()
        for s in special_list:
            do = Doctor.objects.filter(jobs__work_place_id=city_id)
            doc = do.filter(specialization__speciality=s)
            list.append(doc.count())
            list2.append(s.name)
        response = [{'speciality': spec, 'doctor_count': dcount} for spec, dcount in zip(list2, list)]
        print('RESPOMSE :',response)



        context['male_cnt'] = Doctor.objects.filter(work_place__district__city_id=city_id, gender=0).count()
        context['female_cnt'] = Doctor.objects.filter(work_place__district__city_id=city_id, gender=1).count()
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
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminUniversityListPage(PaginationMixin, ListView):
    template_name = 'administrator/university/university_list.html'
    paginate_by = 10
    context_object_name = 'universities'

    def get_queryset(self):
        qs = University.objects.all()
        return qs


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminFacultyListPage(PaginationMixin, ListView):
    template_name = 'administrator/university/faculty_list.html'
    paginate_by = 10
    context_object_name = 'faculties'

    def get_queryset(self):
        qs = Faculty.objects.all()
        return qs


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminCityListPage(PaginationMixin, ListView):
    template_name = 'administrator/region/city_list.html'
    paginate_by = 10
    context_object_name = 'cities'

    def get_queryset(self):
        qs = City.objects.all()
        return qs


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminSpecListPage(PaginationMixin, ListView):
    template_name = 'administrator/spec/list.html'
    paginate_by = 10
    context_object_name = 'specs'

    def get_queryset(self):
        qs = Speciality.objects.all()
        return qs


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminDistrictListPage(PaginationMixin, ListView):
    template_name = 'administrator/region/district_list.html'
    paginate_by = 10
    context_object_name = 'districts'

    def get_queryset(self):
        qs = District.objects.all()
        return qs

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['cities'] = City.objects.all()
        return context


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminInstitutionTypeListPage(PaginationMixin, ListView):
    template_name = 'administrator/institution/institution_type_list.html'
    paginate_by = 10
    context_object_name = 'institution_types'

    def get_queryset(self):
        qs = InstitutionType.objects.all()
        return qs


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminInstitutionListPage(PaginationMixin, ListView):
    template_name = 'administrator/institution/institution_list.html'
    paginate_by = 10
    context_object_name = 'institutions'

    def get_queryset(self):
        qs = Institution.objects.all()
        return qs

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['cities'] = City.objects.all()
        context['institution_types'] = InstitutionType.objects.all()
        return context


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminDoctorListView(PaginationMixin, ListView):
    template_name = 'administrator/doctor/list.html'
    paginate_by = 10
    context_object_name = 'doctors'

    def get_queryset(self):
        qs = Doctor.objects.all()
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
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminDoctorDetailView(DetailView):
    template_name = 'administrator/doctor/detail.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminDoctorUpdatePage(DetailView):
    template_name = 'administrator/doctor/update.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'


@method_decorator(login_required, name='dispatch')
@method_decorator(user_passes_test(lambda u: u.is_superuser), name='dispatch')
class AdminOperatorListPage(ListView):
    template_name = 'administrator/operators/list.html'
    queryset = StaffOperator.objects.filter(user__is_staff=True, user__is_superuser=False)
    context_object_name = 'operators'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['cities'] = City.objects.all()
        return context
