# Generated by Django 2.2.4 on 2019-08-22 02:39

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0015_auto_20190821_1929'),
    ]

    operations = [

        migrations.AddField(
            model_name='doctor',
            name='created',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),

    ]
