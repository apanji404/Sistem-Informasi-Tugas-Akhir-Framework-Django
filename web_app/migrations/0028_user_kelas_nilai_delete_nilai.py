# Generated by Django 4.1.2 on 2022-12-05 10:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0027_alter_proposal_order_status_nilai'),
    ]

    operations = [
        migrations.AddField(
            model_name='user_kelas',
            name='nilai',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.DeleteModel(
            name='nilai',
        ),
    ]
