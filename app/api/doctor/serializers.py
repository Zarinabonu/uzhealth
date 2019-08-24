from rest_framework.serializers import ModelSerializer

from app.model import Institution, InstitutionType, Doctor, MedicalCandidate, Type, Function, Training, Specialization, \
    Knowledge, Speciality, City
from app.model.doctor import WorkPlaces
from app.model.operator import Operator
from app.model.type import ClassType

class DoctorCreateSerializer(ModelSerializer):
    class Meta:
        model = Doctor
        fields = (
            'id',
            'full_name',
            'passport_serial',
            'birth_year',
            'gender',
            'nationality',
            'phone',
            'email'
        )



    def create(self, validated_data):
        # gender = self.context['request'].data.get('gender')
        doc = Doctor(**validated_data)
        # doc.gender = gender
        # file_upload
        doc.passport_image = self.context['request'].FILES.get('passport_image')
        doc.self_image = self.context['request'].FILES.get('avatar')

        i = Operator.objects.get(user=self.context['request'].user)
        print('INSTATUTION ID :', i.institution)
        doc.work_place = i.institution
        doc.save()
        # medical_candidate
        medical_candidate_name = self.context['request'].data.get('medical_candidate_name')
        medical_candidate_year = self.context['request'].data.get('medical_candidate_year')
        print(self.context['request'].data)
        print(medical_candidate_year)
        med = MedicalCandidate(doctor=doc, name=medical_candidate_name, year=medical_candidate_year)
        med.save()
        # knowledge
        knowledge_university = self.context['request'].data.get('knowledge_university')
        knowledge_faculty = self.context['request'].data.get('knowledge_faculty')
        knowledge_year = self.context['request'].data.get('knowledge_year')
        kn = Knowledge(doctor=doc, university_id=knowledge_university, faculty_id=knowledge_faculty,
                       year=knowledge_year)
        kn.save()
        # type
        type_name = Speciality.objects.get(id=self.context['request'].data.get('type_name'))
        type_type = ClassType.objects.get(id=self.context['request'].data.get('type_type'))
        type_year = self.context['request'].data.get('type_year')
        tp = Type(doctor=doc, type=type_type, name=type_name, year=type_year)
        tp.save()
        # function
        function_name = self.context['request'].data.get('function_name')
        function_year = self.context['request'].data.get('function_year')
        fn = Function(doctor=doc, name=function_name, year=function_year)
        fn.save()
        # training
        training_speciality = self.context['request'].data.get('training_speciality')
        training_year = self.context['request'].data.get('training_year')
        training_hours = self.context['request'].data.get('training_hours')
        tr = Training(doctor=doc, speciality_id=training_speciality, year=training_year, hours=training_hours)
        tr.save()
        # Specialization
        specialization_speciality = self.context['request'].data.get('specialization_speciality')
        specialization_year = self.context['request'].data.get('specialization_year')
        sp = Specialization(doctor=doc, speciality_id=specialization_speciality, year=specialization_year)
        sp.save()



        w = WorkPlaces.objects.create(doctor=doc, work_place=i.institution)
        w.save()
        return doc

    def update(self, instance, validated_data):
        gender = self.context['request'].data.get('gender')
        if gender:
            instance.gender = gender
        instance.full_name = self.context['request'].data.get('full_name')
        instance.birth_year = self.context['request'].data.get('birth_year')
        instance.nationality = self.context['request'].data.get('nationality')
        instance.passport_serial = self.context['request'].data.get('passport_serial')
        instance.phone = self.context['request'].data.get('phone')
        instance.email = self.context['request'].data.get('email')
        if self.context['request'].FILES.get('passport_image'):
            instance.passport_image = self.context['request'].FILES.get('passport_image')
        if self.context['request'].FILES.get('self_image'):
            instance.self_image = self.context['request'].FILES.get('self_image')
        instance.save()

        doc = instance
        if self.context['request'].data.get('medical_candidate_name'):
            med, created = MedicalCandidate.objects.get_or_create(doctor=doc)
            med.name = self.context['request'].data.get('medical_candidate_name')
            med.year = self.context['request'].data.get('medical_candidate_year')
            med.save()
        # print(self.context['request'].data)
        # print(medical_candidate_year)

        # knowledge
        if self.context['request'].data.get('knowledge_university') and self.context['request'].data.get(
                'knowledge_faculty'):
            kn, created = Knowledge.objects.get_or_create(doctor=doc)

            kn.university_id = self.context['request'].data.get('knowledge_university')
            kn.faculty_id = self.context['request'].data.get('knowledge_faculty')
            kn.year = self.context['request'].data.get('knowledge_year')
            kn.save()

        # type
        if self.context['request'].data.get('type_name'):
            tp, created = Type.objects.get_or_create(doctor=doc)
            tp.type_id = self.context['request'].data.get('type_type')
            tp.name_id = self.context['request'].data.get('type_name')
            tp.year = self.context['request'].data.get('type_year')
            tp.save()
        # function
        if self.context['request'].data.get('function_name'):
            fn, created = Function.objects.get_or_create(doctor=doc)
            fn.name = self.context['request'].data.get('function_name')
            fn.year = self.context['request'].data.get('function_year')
            fn.save()
        # training
        if self.context['request'].data.get('training_speciality'):
            tr, created = Training.objects.get_or_create(doctor=doc)
            tr.speciality_id = self.context['request'].data.get('training_speciality')
            tr.year = self.context['request'].data.get('training_year')
            tr.hours = self.context['request'].data.get('training_hours')

            tr.save()
        # Specialization
        if self.context['request'].data.get('specialization_speciality'):
            sp, created = Specialization.objects.get_or_create(doctor=doc)
            sp.speciality_id = self.context['request'].data.get('specialization_speciality')
            sp.year = self.context['request'].data.get('specialization_year')

            sp.save()


        return instance
