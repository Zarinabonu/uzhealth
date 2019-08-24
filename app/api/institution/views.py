from rest_framework.generics import CreateAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticated

from app.model import InstitutionType, Institution
from app.model.operator import Operator
from .serializers import InstitutionTypeSerializer, InstitutionSerializer, OperatorCreateSerializer, StaffOperatorCreateSerializer


class InstitutionTypeCreateAPIView(CreateAPIView):
    serializer_class = InstitutionTypeSerializer
    queryset = InstitutionType.objects.all()


class OperatorCreateAPIView(CreateAPIView):
    serializer_class = OperatorCreateSerializer
    # queryset = Operator.objects.all()

class StaffOperatorCreateAPIView(CreateAPIView):
    serializer_class = StaffOperatorCreateSerializer


class InstitutionCreateAPIView(CreateAPIView):
    serializer_class = InstitutionSerializer
    queryset = Institution.objects.all()


class InstitutionListAPIView(ListAPIView):
    """
    GET request to get list of all districts,
    to get districts by city send city ID in url with key 'city_id
    """
    queryset = Institution.objects.all()
    serializer_class = InstitutionSerializer
    # permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        qs = Institution.objects.all()
        district_id = self.request.GET.get('district_id')
        if district_id:
            qs = qs.filter(district_id=district_id)
        return qs
