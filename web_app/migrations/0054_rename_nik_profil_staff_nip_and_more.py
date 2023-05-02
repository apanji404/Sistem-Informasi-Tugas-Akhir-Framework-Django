# Generated by Django 4.1.2 on 2022-12-29 10:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0053_alter_profil_staff_kelompok_keahlian'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profil_staff',
            old_name='nik',
            new_name='nip',
        ),
        migrations.AlterField(
            model_name='daftarsidang',
            name='kelompok_keahlian',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='profil_staff',
            name='kelompok_keahlian',
            field=models.CharField(choices=[('Seculab', 'Seculab'), ('SEA', 'SEA'), ('Rnest', 'Rnest'), ('Magics', 'Magics'), ('I-Smile', 'I-Smile'), ('Evconn', 'Evconn')], max_length=200, null=True),
        ),
    ]