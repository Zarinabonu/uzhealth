from rest_framework.authentication import TokenAuthentication
from rest_framework.generics import CreateAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticated

from app.model import City, District
from .serializers import CitySerializer, DistrictSerializer


class CityCreateAPIView(CreateAPIView):
    serializer_class = CitySerializer
    queryset = City.objects.all()


class DistrictCreateAPIView(CreateAPIView):
    serializer_class = DistrictSerializer
    queryset = District.objects.all()


class DistrictListAPIView(ListAPIView):
    """
    GET request to get list of all districts,
    to get districts by city send city ID in url with key 'city_id
    """
    queryset = District.objects.all()
    serializer_class = DistrictSerializer
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        qs = District.objects.all()
        city_id = self.request.GET.get('city_id')
        if city_id:
            qs = qs.filter(city_id=city_id)
        return qs
