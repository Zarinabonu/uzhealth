from rest_framework.authentication import TokenAuthentication
from rest_framework.generics import CreateAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticated

from app.model import City, District, Speciality
from app.model.type import ClassType
from .serializers import ClassTypeSerializer


class ClassTypeCreateAPIView(CreateAPIView):
    serializer_class = ClassTypeSerializer
    queryset = Speciality.objects.all()
