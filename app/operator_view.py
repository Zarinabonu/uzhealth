from django.contrib.auth.models import User
from django.views.generic import TemplateView, ListView, DetailView
from pure_pagination import PaginationMixin

from app.model import City, Doctor, University, Faculty, Speciality, Institution
from app.model.operator import Operator
from app.model.template import MessageTemplate
from app.model.type import ClassType


class OperatorDoctorListView(PaginationMixin, ListView):
    template_name = 'operator/doctor/list.html'
    paginate_by = 10
    context_object_name = 'doctors'

    def get_queryset(self):
        u = User.objects.get(id=self.request.user.id)
        print('REQUEST ID', u)
        op = Operator.objects.get(user=u)
        print('REQUEST OPerator', op)

        qs = Doctor.objects.filter(work_place=op.institution)
        if self.request.GET.get('fullname'):
            qs = qs.filter(full_name__icontains=self.request.GET.get('fullname'))
        if self.request.GET.get('gender'):
            if self.request.GET.get('gender') == 'm':
                qs = qs.filter(gender=0)
            else:
                qs = qs.filter(gender=1)
        if self.request.GET.get('age'):
            qs = qs.filter(birth_year=2019 - int(self.request.GET.get('age')))

        # if u.institution_set.all().count()>0:
        #     qs = Doctor.objects.filter(work_place=u.institution_set.all()[0])
        return qs


class OperatorDoctorDetailView(DetailView):
    template_name = 'operator/doctor/detail.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'


class OperatorDoctorUpdatePage(DetailView):
    template_name = 'operator/doctor/update.html'
    context_object_name = 'doctor'
    model = Doctor
    pk_url_kwarg = 'id'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['universities'] = University.objects.all()
        context['faculties'] = Faculty.objects.all()
        context['specs'] = Speciality.objects.all()
        context['types'] = ClassType.objects.all()
        # awt
        return context


class OperatorDoctorCreatePage(TemplateView):
    template_name = 'operator/doctor/create.html'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['universities'] = University.objects.all()
        context['faculties'] = Faculty.objects.all()
        context['specs'] = Speciality.objects.all()
        context['types'] = ClassType.objects.all()
        # awt
        return context


class TemplateListView(ListView):
    template_name = 'operator/templates/list.html'
    queryset = MessageTemplate.objects.all()
    context_object_name = 'templates'


class TemplateDetailView(DetailView):
    template_name = 'operator/templates/detail.html'
    model = MessageTemplate
    context_object_name = 'template'
    pk_url_kwarg = 'id'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        op = Operator.objects.get(user=self.request.user)

        i = Institution.objects.get(user=self.request.user)

        context['cities'] = City.objects.all()
        # work_place__user
        # self.request.user
        context['doctors'] = Doctor.objects.filter(work_place__id=op.institution.id)
        #print('Context :', context['doctors'])
        return context
