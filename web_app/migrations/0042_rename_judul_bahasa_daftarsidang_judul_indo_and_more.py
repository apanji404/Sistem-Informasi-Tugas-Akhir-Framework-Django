# Generated by Django 4.1.2 on 2022-12-20 08:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0041_remove_daftarsidang_email2'),
    ]

    operations = [
        migrations.RenameField(
            model_name='daftarsidang',
            old_name='judul_bahasa',
            new_name='judul_indo',
        ),
        migrations.RenameField(
            model_name='daftarsidang',
            old_name='judul_english',
            new_name='judul_inggris',
        ),
    ]