# Generated by Django 4.2.7 on 2023-11-17 00:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('idRol', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rol', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('idUsuario', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('primerApellido', models.CharField(max_length=50)),
                ('segundoApellido', models.CharField(max_length=50)),
                ('fechaNacimiento', models.DateField()),
                ('correoElectronico', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('rol', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.rol')),
            ],
        ),
    ]
