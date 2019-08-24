from rest_framework.serializers import ModelSerializer

from app.model import City, District, Speciality
from app.model.type import ClassType


class ClassTypeSerializer(ModelSerializer):
    class Meta:
        model = Speciality
        fields = ('id', 'name')
