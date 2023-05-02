# Generated by Django 4.1.2 on 2023-01-15 15:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0066_delete_jadwalsidang'),
    ]

    operations = [
        migrations.CreateModel(
            name='JadwalSidang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('daftar_sidang', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.daftarsidang')),
                ('penguji1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='penguji1', to='web_app.profil_staff')),
                ('penguji2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='penguji2', to='web_app.profil_staff')),
                ('ruang', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.ruangsidang')),
            ],
        ),
    ]
