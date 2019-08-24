from rest_framework.serializers import ModelSerializer

from app.model import University, Faculty


class UniversitySerializer(ModelSerializer):
    class Meta:
        model = University
        fields = ('id', 'name')


class FacultySerializer(ModelSerializer):
    class Meta:
        model = Faculty
        fields = ('id', 'name')
