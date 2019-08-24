from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework.views import APIView

from app.model import Doctor
from app.utils import send_sms, send_email

from app.api.template.serializers import TemplateSerializer
from app.model.template import MessageTemplate


class TemplateCreateAPIView(CreateAPIView):
    serializer_class = TemplateSerializer
    queryset = MessageTemplate.objects.all()


class MessageSentAPIView(APIView):
    def post(self, request):
        ids = self.request.POST.get('ids')
        ids = ids.split(',')
        print(ids)
        title = self.request.POST.get('title')
        text = self.request.POST.get('text')
        if 'sms' in self.request.POST.get('action'):
            for id in ids:
                d = Doctor.objects.get(id=id)
                if d.phone:
                    send_sms(d.phone, title + '\n' + text)
        if 'email' in self.request.POST.get('action'):
            for id in ids:
                d = Doctor.objects.get(id=id)
                if d.email:
                    send_email(title, text, [d.email,])

        return Response(status=201)


