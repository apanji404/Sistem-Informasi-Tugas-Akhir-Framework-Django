# Generated by Django 4.1.2 on 2022-12-29 10:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0054_rename_nik_profil_staff_nip_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profil_staff',
            name='nip',
            field=models.BigIntegerField(null=True),
        ),
    ]