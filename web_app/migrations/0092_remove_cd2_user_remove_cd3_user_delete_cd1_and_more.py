# Generated by Django 4.1.2 on 2023-02-14 21:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0091_profil_mahasiswa_hari_ini_profil_mahasiswa_judul_ta'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cd2',
            name='user',
        ),
        migrations.RemoveField(
            model_name='cd3',
            name='user',
        ),
        migrations.DeleteModel(
            name='CD1',
        ),
        migrations.DeleteModel(
            name='CD2',
        ),
        migrations.DeleteModel(
            name='CD3',
        ),
    ]