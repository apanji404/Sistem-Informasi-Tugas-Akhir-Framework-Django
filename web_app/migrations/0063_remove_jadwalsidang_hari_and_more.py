# Generated by Django 4.1.2 on 2023-01-15 15:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0062_remove_jadwalsidang_peserta_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='jadwalsidang',
            name='hari',
        ),
        migrations.RemoveField(
            model_name='jadwalsidang',
            name='tanggal_sidang',
        ),
        migrations.RemoveField(
            model_name='jadwalsidang',
            name='waktu',
        ),
    ]