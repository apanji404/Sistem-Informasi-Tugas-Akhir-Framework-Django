# Generated by Django 4.1.2 on 2023-02-15 11:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0092_remove_cd2_user_remove_cd3_user_delete_cd1_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='jadwalsemprodosen',
            name='jam_mulai',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='jadwalsemprodosen',
            name='jam_selesai',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.DeleteModel(
            name='JamSemproDosen',
        ),
    ]
