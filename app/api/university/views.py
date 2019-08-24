from rest_framework.generics import CreateAPIView

from app.model import University, Faculty
from .serializers import UniversitySerializer, FacultySerializer


class UniversityCreateAPIView(CreateAPIView):
    serializer_class = UniversitySerializer
    queryset = University.objects.all()


class FacultyCreateAPIView(CreateAPIView):
    serializer_class = FacultySerializer
    queryset = Faculty.objects.all()
