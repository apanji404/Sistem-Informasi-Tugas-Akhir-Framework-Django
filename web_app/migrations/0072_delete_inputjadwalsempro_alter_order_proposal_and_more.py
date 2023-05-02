# Generated by Django 4.1.2 on 2023-01-24 16:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0071_merge_20230124_2318'),
    ]

    operations = [
        migrations.DeleteModel(
            name='inputJadwalSempro',
        ),
        migrations.AlterField(
            model_name='order',
            name='proposal',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='web_app.proposal'),
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.BooleanField(default=False),
        ),
    ]
