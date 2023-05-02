# Generated by Django 4.1.2 on 2023-01-04 07:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0056_alter_profil_staff_nip'),
    ]

    operations = [
        migrations.CreateModel(
            name='JadwalSidang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hari', models.CharField(max_length=200, null=True)),
                ('waktu', models.CharField(max_length=200, null=True)),
                ('penguji1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='penguji1', to='web_app.profil_staff')),
                ('penguji2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='penguji2', to='web_app.profil_staff')),
                ('peserta', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.profil_mahasiswa')),
                ('ruang', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.ruangsidang')),
            ],
        ),
        migrations.CreateModel(
            name='JadwalKelasDosen',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hari', models.CharField(choices=[('Senin', 'Senin'), ('Selasa', 'Selasa'), ('Rabu', 'Rabu'), ('Kamis', 'Kamis'), ('Jumat', 'Jumat')], max_length=200, null=True)),
                ('waktu', models.CharField(choices=[('08:30 - 10.30', '08:30 - 10.30'), ('10:30 - 12.30', '10:30 - 12.30'), ('12:30 - 14.30', '12:30 - 14.30'), ('14:30 - 16.30', '14:30 - 16.30')], max_length=200, null=True)),
                ('dosen', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.profil_staff')),
            ],
        ),
        migrations.CreateModel(
            name='BebanPengujian',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('beban', models.IntegerField()),
                ('dosen', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.profil_staff')),
            ],
        ),
    ]
