# Generated by Django 4.1.2 on 2022-11-30 09:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0020_alter_proposal_jml_mhs'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proposal',
            name='penelitian_sebelumnya',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
