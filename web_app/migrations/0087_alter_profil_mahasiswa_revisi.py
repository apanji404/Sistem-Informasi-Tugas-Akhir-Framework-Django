# Generated by Django 4.1.2 on 2023-01-25 15:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0086_alter_profil_mahasiswa_revisi'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profil_mahasiswa',
            name='revisi',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
    ]