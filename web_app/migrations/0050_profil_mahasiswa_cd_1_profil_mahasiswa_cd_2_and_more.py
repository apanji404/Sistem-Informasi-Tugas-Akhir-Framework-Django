# Generated by Django 4.1.2 on 2022-12-24 06:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0049_nilai'),
    ]

    operations = [
        migrations.AddField(
            model_name='profil_mahasiswa',
            name='CD_1',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='profil_mahasiswa',
            name='CD_2',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='profil_mahasiswa',
            name='CD_3',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='profil_mahasiswa',
            name='individual_performance',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='profil_mahasiswa',
            name='presentation',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.DeleteModel(
            name='Nilai',
        ),
    ]
