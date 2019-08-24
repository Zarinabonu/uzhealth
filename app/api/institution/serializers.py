from django.contrib.auth.models import User
from rest_framework.serializers import ModelSerializer, Serializer
from rest_framework import serializers
from app.model import Institution, InstitutionType
from app.model.operator import Operator, StaffOperator


class InstitutionTypeSerializer(ModelSerializer):
    class Meta:
        model = InstitutionType
        fields = ('id', 'name', )


class InstitutionSerializer(ModelSerializer):
    class Meta:
        model = Institution
        fields = ('id', 'district', 'name', 'address', 'type')


class OperatorCreateSerializer(Serializer):
    fio = serializers.CharField(max_length=255, required=False)
    password = serializers.CharField(max_length=255, required=False)
    username = serializers.CharField(max_length=255,required=False)
    institution_id = serializers.IntegerField(required=False)

    class Meta:
        model = Operator
        fields = ()

    def create(self, validated_data):
        u = User.objects.create(username=validated_data.get('username'), first_name=validated_data.get('fio') )
        u.set_password(validated_data.get('password'))
        u.save()

        u.operator.institution_id=validated_data.get('institution_id')
        u.operator.save()
        u.save()
        return u.operator


class StaffOperatorCreateSerializer(Serializer):
    fio = serializers.CharField(max_length=255, required=False)
    password = serializers.CharField(max_length=255, required=False)
    username = serializers.CharField(max_length=255,required=False)
    city_id = serializers.IntegerField(required=False)

    class Meta:
        model = StaffOperator
        fields = ()

    def create(self, validated_data):
        u = User.objects.create(username=validated_data.get('username'), first_name=validated_data.get('fio'), is_staff=True )
        u.set_password(validated_data.get('password'))
        u.save()
        u.staffoperator.city_id=validated_data.get('city_id')
        u.staffoperator.save()
        u.save()
        return u.staffoperator