# Generated by Django 4.1.2 on 2022-11-27 21:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0002_rename_fk_user_kelas_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='kelas',
            name='user',
        ),
        migrations.AlterField(
            model_name='kelas',
            name='nama_kelas',
            field=models.CharField(max_length=50, null=True),
        ),
    ]