# Generated by Django 4.1.2 on 2023-01-24 16:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web_app', '0073_delete_bebanpengujian'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='status',
        ),
    ]
