# Generated by Django 4.1.2 on 2023-01-15 15:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0058_daftarsidang_hari_sidang'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='daftarsidang',
            name='tanggal_sidang',
        ),
        migrations.RemoveField(
            model_name='jadwalsidang',
            name='peserta',
        ),
        migrations.AddField(
            model_name='jadwalsidang',
            name='daftar_sidang',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.daftarsidang'),
        ),
    ]
