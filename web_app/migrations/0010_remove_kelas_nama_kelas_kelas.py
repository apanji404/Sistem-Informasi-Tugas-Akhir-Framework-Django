# Generated by Django 4.1.2 on 2022-11-28 10:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0009_user_kelas'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='kelas',
            name='nama',
        ),
        migrations.AddField(
            model_name='kelas',
            name='kelas',
            field=models.CharField(max_length=50, null=True),
        ),
    ]