# Generated by Django 5.1.6 on 2025-04-01 05:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0009_rename_contactform_contactformmodel'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactformmodel',
            name='created_at',
            field=models.DateField(auto_now_add=True),
        ),
    ]
