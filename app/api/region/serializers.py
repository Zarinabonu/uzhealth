from rest_framework.serializers import ModelSerializer

from app.model import City, District


class CitySerializer(ModelSerializer):
    class Meta:
        model = City
        fields = ('id', 'name_ru')


class DistrictSerializer(ModelSerializer):
    class Meta:
        model = District
        fields = ('id', 'city', 'name_ru')
