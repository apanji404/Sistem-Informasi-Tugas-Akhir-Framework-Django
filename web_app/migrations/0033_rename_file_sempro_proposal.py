# Generated by Django 4.1.2 on 2022-12-06 10:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0032_sempro_file'),
    ]

    operations = [
        migrations.RenameField(
            model_name='sempro',
            old_name='file',
            new_name='proposal',
        ),
    ]
