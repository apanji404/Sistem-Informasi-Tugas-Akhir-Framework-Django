# Generated by Django 4.1.2 on 2023-01-21 06:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0069_alter_proposal_jml_mhs_alter_proposal_judul_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='proposal',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.proposal'),
        ),
    ]