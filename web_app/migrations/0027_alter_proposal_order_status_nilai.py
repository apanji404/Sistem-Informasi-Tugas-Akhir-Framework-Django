# Generated by Django 4.1.2 on 2022-12-04 08:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0026_alter_proposal_order_proposal_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proposal_order',
            name='status',
            field=models.CharField(blank=True, choices=[('Diterima', 'Diterima'), ('Ditolak', 'Ditolak'), ('Pending', 'Pending')], max_length=100, null=True),
        ),
        migrations.CreateModel(
            name='nilai',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nilai', models.IntegerField(null=True)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to='web_app.profil_mahasiswa')),
            ],
        ),
    ]
