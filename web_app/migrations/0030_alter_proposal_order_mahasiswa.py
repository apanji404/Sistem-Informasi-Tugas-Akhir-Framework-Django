# Generated by Django 4.1.2 on 2022-12-05 17:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('web_app', '0029_remove_user_kelas_nilai_profil_mahasiswa_nilai'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proposal_order',
            name='mahasiswa',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]
