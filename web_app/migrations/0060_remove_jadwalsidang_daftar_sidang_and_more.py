# Generated by Django 4.1.2 on 2023-01-15 15:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0059_remove_daftarsidang_tanggal_sidang_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='jadwalsidang',
            name='daftar_sidang',
        ),
        migrations.AddField(
            model_name='jadwalsidang',
            name='peserta',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.profil_mahasiswa'),
        ),
    ]
