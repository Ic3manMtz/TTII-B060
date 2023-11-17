# Generated by Django 4.2.7 on 2023-11-17 00:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacion', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Estatus',
            fields=[
                ('idEstatus', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estatus', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Certificados',
            fields=[
                ('idCertificados', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('documentos', models.CharField(max_length=100)),
                ('idAsesor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.usuario')),
            ],
        ),
    ]