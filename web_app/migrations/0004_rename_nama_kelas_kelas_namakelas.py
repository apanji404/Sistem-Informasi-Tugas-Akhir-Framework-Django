# Generated by Django 4.1.2 on 2022-11-27 21:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0003_remove_kelas_user_alter_kelas_nama_kelas'),
    ]

    operations = [
        migrations.RenameField(
            model_name='kelas',
            old_name='nama_kelas',
            new_name='namakelas',
        ),
    ]
