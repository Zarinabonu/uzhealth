from rest_framework.authentication import TokenAuthentication
from rest_framework.generics import CreateAPIView, UpdateAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from app.api.institution.serializers import InstitutionSerializer
from app.api.region.serializers import DistrictSerializer
from app.model import InstitutionType, Institution, Doctor, District, Archive
from app.model.doctor import WorkPlaces
from app.model.operator import Operator
from .serializers import DoctorCreateSerializer



class DoctorCreateAPIView(CreateAPIView):
    """
    --- medical_candidate
    additionally send in formdata to create 'medical candidate' -> 'medical_candidate_name', 'medical_candidate_year'///
    --- knowledge
    additionally send in formdata to create 'knowledge' -> 'knowledge_university' - id, 'knowledge_faculty' - id, 'knowledge_year'///
    --- type
    additionally send in formdata to create 'type' -> 'type_type' , 'type_name', 'type_year'///
    --- function
    additionally send in formdata to create 'function' -> 'function_name' , 'function_year'///
    --- training
    additionally send in formdata to create 'training' -> 'training_speciality' - id , 'training_year', 'training_hours'///
    --- Specialization
    additionally send in formdata to create 'specialization' -> 'specialization_speciality' , 'specialization_year'///
    """
    queryset = Doctor.objects.all()
    serializer_class = DoctorCreateSerializer
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)

class DoctorUpdateAPIView(UpdateAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorCreateSerializer
    lookup_url_kwarg = 'id'


class ChangeWorkAPIView(APIView):
    def post(self):
        u = Doctor.objects.get(id=self.request.POST.get('doctor_id'))
        i = Institution.objects.get(id=self.request.POST.get('institution_id'))
        archive = Archive.objects.create(user=self.request, doctor=u, from_institution=u.work_place, to_institution=i)
        archive.save()

        u.work_place = i

        u.save()
        return Response(status=200)


class WorkPlaceAPIView(APIView):
    def post(self):
        d = Doctor.objects.get(id=self.request.POST.get('id'))
        op = Operator.objects.get(user=self.request.user)
        w = WorkPlaces.objects.create(doctor=d,work_place=op)
        w.save()
        return Response(status=200)


class DoctorDestroyAPIView(APIView):
    def post(self):
        d = self.request.POST.get('id')
        op = Operator.objects.get(user=self.request.user)
        w = WorkPlaces.objects.get(doctor__id=d,work_place__id=op.institution.id)
        archive = Archive.objects.create(user=self.request, doctor__id=d, from_institution=op.institution)
        archive.save()

        w.delete()
