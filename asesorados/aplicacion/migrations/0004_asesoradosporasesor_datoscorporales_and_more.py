# Generated by Django 4.2.7 on 2023-11-17 01:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacion', '0003_prueba_rename_idcertificados_certificados_id_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='AsesoradosPorAsesor',
            fields=[
                ('idUsuarioAsesorado', models.IntegerField(primary_key=True, serialize=False)),
                ('idUsuarioAsesor', models.IntegerField()),
                ('fechaInicio', models.DateField()),
                ('estatus', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.estatus')),
            ],
        ),
        migrations.CreateModel(
            name='DatosCorporales',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('peso', models.FloatField()),
                ('talla', models.FloatField()),
                ('imc', models.FloatField()),
                ('circunferenciaCintura', models.IntegerField()),
                ('circunferenciaCadera', models.IntegerField()),
                ('icc', models.IntegerField()),
                ('grasa', models.IntegerField()),
                ('musculoEsqueletico', models.IntegerField()),
                ('grasaVisceral', models.IntegerField()),
                ('fechaMedicion', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='InvitacionEnviada',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fechaEnvio', models.DateField()),
                ('estatus', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='invitaciones_enviadas_con_estatus', to='aplicacion.usuario')),
                ('idUsuarioAsesor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='invitaciones_enviadas_como_asesor', to='aplicacion.usuario')),
                ('idUsuarioAsesorado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='invitaciones_enviadas_como_asesorado', to='aplicacion.usuario')),
            ],
        ),
        migrations.CreateModel(
            name='RegistrarDatos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('idUsuairoAsesorado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.asesoradosporasesor')),
                ('idUsuarioAsesor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.usuario')),
            ],
        ),
        migrations.CreateModel(
            name='Valida',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('idAdministrador', models.IntegerField()),
                ('idAsesor', models.IntegerField()),
                ('certificado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='valida_con_certificado', to='aplicacion.certificados')),
                ('estatus', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='valida_con_estatus', to='aplicacion.certificados')),
            ],
            options={
                'unique_together': {('idAdministrador', 'idAsesor')},
            },
        ),
        migrations.AddField(
            model_name='datoscorporales',
            name='idUsuarioAsesorado',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aplicacion.registrardatos'),
        ),
    ]
