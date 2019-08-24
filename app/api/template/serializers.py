from rest_framework.serializers import ModelSerializer

from app.model.template import MessageTemplate


class TemplateSerializer(ModelSerializer):
    class Meta:
        model = MessageTemplate
        fields = ('text', 'title')
