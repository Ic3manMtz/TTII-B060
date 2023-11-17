from django.db import models

# Create your models here.
class Alimento(models.Model):
    idalimento = models.AutoField(db_column='idAlimento', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)
    proteinas = models.FloatField(blank=True, null=True)
    carbohidratos = models.FloatField(blank=True, null=True)
    kcal = models.IntegerField(blank=True, null=True)
    grasas = models.FloatField(blank=True, null=True)
    unidadmedida = models.CharField(db_column='unidadMedida', max_length=50, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'Alimento'


class Asesoradosporasesor(models.Model):
    idusuarioasesor = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='idUsuarioAsesor')  # Field name made lowercase.
    idusuarioasesorado = models.IntegerField(db_column='idUsuarioAsesorado', primary_key=True)  # Field name made lowercase.
    estatus = models.ForeignKey('Estatus', models.DO_NOTHING, db_column='estatus', blank=True, null=True)
    fechainicio = models.DateField(db_column='fechaInicio', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'AsesoradosPorAsesor'


class Certificados(models.Model):
    idcertificado = models.AutoField(db_column='idCertificado', primary_key=True)  # Field name made lowercase.
    idasesor = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='idAsesor')  # Field name made lowercase.
    documento = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Certificados'


class Contienealimento(models.Model):
    idplatillo = models.ForeignKey('Contieneplatillo', models.DO_NOTHING, db_column='idPlatillo')  # Field name made lowercase.
    idalimento = models.ForeignKey(Alimento, models.DO_NOTHING, db_column='idAlimento')  # Field name made lowercase.
    cantidad = models.IntegerField()
    porcion = models.FloatField()

    class Meta:
        managed = False
        db_table = 'ContieneAlimento'


class Contieneejercicios(models.Model):
    idrutina = models.ForeignKey('Rutinas', models.DO_NOTHING, db_column='idRutina')  # Field name made lowercase.
    idejercicio = models.ForeignKey('Ejercicio', models.DO_NOTHING, db_column='idEjercicio')  # Field name made lowercase.
    series = models.IntegerField(blank=True, null=True)
    repeticiones = models.IntegerField(blank=True, null=True)
    tiempo = models.IntegerField(blank=True, null=True)
    descanso = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ContieneEjercicios'


class Contieneplatillo(models.Model):
    idplatillo = models.AutoField(db_column='idPlatillo', primary_key=True)  # Field name made lowercase.
    idplanalimenticio = models.ForeignKey('Planalimenticio', models.DO_NOTHING, db_column='idPlanAlimenticio')  # Field name made lowercase.
    tiempo = models.ForeignKey('Tiempocomida', models.DO_NOTHING, db_column='tiempo')
    dia = models.DateField(blank=True, null=True)
    checado = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ContienePlatillo'


class Contienerutinas(models.Model):
    idplanfisico = models.ForeignKey('Planfisico', models.DO_NOTHING, db_column='idPlanFisico')  # Field name made lowercase.
    idrutina = models.ForeignKey('Rutinas', models.DO_NOTHING, db_column='idRutina')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ContieneRutinas'


class Datoscorporales(models.Model):
    iddatoscorporales = models.AutoField(db_column='idDatosCorporales', primary_key=True)  # Field name made lowercase.
    idusuarioasesorado = models.ForeignKey('Registrardatos', models.DO_NOTHING, db_column='idUsuarioAsesorado', to_field='idUsuarioAsesorado')  # Field name made lowercase.
    peso = models.FloatField(blank=True, null=True)
    talla = models.FloatField(blank=True, null=True)
    imc = models.FloatField(blank=True, null=True)
    circunferenciacintura = models.IntegerField(db_column='circunferenciaCintura', blank=True, null=True)  # Field name made lowercase.
    circunferecnciacadera = models.IntegerField(db_column='circunferecnciaCadera', blank=True, null=True)  # Field name made lowercase.
    icc = models.IntegerField(blank=True, null=True)
    grasa = models.IntegerField(blank=True, null=True)
    musculoesqueletico = models.IntegerField(db_column='musculoEsqueletico', blank=True, null=True)  # Field name made lowercase.
    grasavisceral = models.IntegerField(db_column='grasaVisceral', blank=True, null=True)  # Field name made lowercase.
    fechamedicion = models.DateField(db_column='fechaMedicion', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DatosCorporales'


class Ejercicio(models.Model):
    idejercicio = models.AutoField(db_column='idEjercicio', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)
    activacionmuscular = models.CharField(db_column='activacionMuscular', max_length=50, blank=True, null=True)  # Field name made lowercase.
    tipo = models.ForeignKey('Tipoejercicio', models.DO_NOTHING, db_column='tipo', blank=True, null=True)

    def __str__(self):
        return self.nombre
    class Meta:
        managed = False
        db_table = 'Ejercicio'


class Estatus(models.Model):
    idestatus = models.AutoField(db_column='idEstatus', primary_key=True)  # Field name made lowercase.
    estatus = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.estatus
    
    class Meta:
        managed = False
        db_table = 'Estatus'


class Invitacionenviada(models.Model):
    idinvitacion = models.AutoField(db_column='idInvitacion', primary_key=True)  # Field name made lowercase.
    idusuarioasesor = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='idUsuarioAsesor')  # Field name made lowercase.
    idusuarioasesorado = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='idUsuarioAsesorado', related_name='invitacionenviada_idusuarioasesorado_set')  # Field name made lowercase.
    estatus = models.ForeignKey(Estatus, models.DO_NOTHING, db_column='estatus')
    fechaenvio = models.DateField(db_column='fechaEnvio', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'InvitacionEnviada'


class Objetivoscorporales(models.Model):
    iddatoscorporales = models.ForeignKey(Datoscorporales, models.DO_NOTHING, db_column='idDatosCorporales')  # Field name made lowercase.
    pesoobjetivo = models.FloatField(db_column='pesoObjetivo', blank=True, null=True)  # Field name made lowercase.
    iccobjetivo = models.FloatField(db_column='iccObjetivo', blank=True, null=True)  # Field name made lowercase.
    imcobjetivo = models.FloatField(db_column='imcObjetivo', blank=True, null=True)  # Field name made lowercase.
    grasaobjetivo = models.IntegerField(db_column='grasaObjetivo', blank=True, null=True)  # Field name made lowercase.
    musculoobjetivo = models.IntegerField(db_column='musculoObjetivo', blank=True, null=True)  # Field name made lowercase.
    grasavisceralobjetivo = models.IntegerField(db_column='grasaVisceralObjetivo', blank=True, null=True)  # Field name made lowercase.
    fechalimite = models.DateField(db_column='fechaLimite', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ObjetivosCorporales'


class Planalimenticio(models.Model):
    idplanalimenticio = models.AutoField(db_column='idPlanAlimenticio', primary_key=True)  # Field name made lowercase.
    fechainicio = models.DateField(db_column='fechaInicio')  # Field name made lowercase.
    fechatermino = models.DateField(db_column='fechaTermino')  # Field name made lowercase.
    estatus = models.ForeignKey(Estatus, models.DO_NOTHING, db_column='estatus')

    class Meta:
        managed = False
        db_table = 'PlanAlimenticio'


class Planfisico(models.Model):
    idplanfisico = models.AutoField(db_column='idPlanFisico', primary_key=True)  # Field name made lowercase.
    fechainicio = models.DateField(db_column='fechaInicio')  # Field name made lowercase.
    fechatermino = models.DateField(db_column='fechaTermino')  # Field name made lowercase.
    estatus = models.ForeignKey(Estatus, models.DO_NOTHING, db_column='estatus')

    class Meta:
        managed = False
        db_table = 'PlanFisico'


class Registrardatos(models.Model):
    idregistro = models.AutoField(db_column='idRegistro', primary_key=True)  # Field name made lowercase.
    idusuarioasesor = models.IntegerField(db_column='idUsuarioAsesor')  # Field name made lowercase.
    idUsuarioAsesorado = models.OneToOneField(Asesoradosporasesor, models.DO_NOTHING, db_column='idUsuarioAsesorado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'RegistrarDatos'

class Rol(models.Model):
    idrol = models.AutoField(db_column='idRol', primary_key=True)  # Field name made lowercase.
    rol = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.rol

    class Meta:
        managed = False
        db_table = 'Rol'


class Rutinas(models.Model):
    idrutina = models.AutoField(db_column='idRutina', primary_key=True)  # Field name made lowercase.
    fechainicio = models.DateField(db_column='fechaInicio')  # Field name made lowercase.
    fechatermino = models.DateField(db_column='fechaTermino')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Rutinas'


class Tiempocomida(models.Model):
    idtiempocomida = models.AutoField(db_column='idTiempoComida', primary_key=True)  # Field name made lowercase.
    tiempo = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.tiempo
    
    class Meta:
        managed = False
        db_table = 'TiempoComida'


class Tieneplanes(models.Model):
    idusuarioasesorado = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='idUsuarioAsesorado')  # Field name made lowercase.
    idplanalimenticio = models.ForeignKey(Planalimenticio, models.DO_NOTHING, db_column='idPlanAlimenticio', blank=True, null=True)  # Field name made lowercase.
    idplanfisico = models.ForeignKey(Planfisico, models.DO_NOTHING, db_column='idPlanFisico', blank=True, null=True)  # Field name made lowercase.
    idreporte = models.IntegerField(db_column='idReporte', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TienePlanes'


class Tipoejercicio(models.Model):
    idtipoejercicio = models.AutoField(db_column='idTipoEjercicio', primary_key=True)  # Field name made lowercase.
    tipo = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.tipo
    
    class Meta:
        managed = False
        db_table = 'TipoEjercicio'


class Usuario(models.Model):
    idusuario = models.AutoField(db_column='idUsuario', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)
    primerapellido = models.CharField(db_column='primerApellido', max_length=50)  # Field name made lowercase.
    segundoapellido = models.CharField(db_column='segundoApellido', max_length=50)  # Field name made lowercase.
    fechanacimiento = models.DateField(db_column='fechaNacimiento')  # Field name made lowercase.
    correoelectronico = models.CharField(db_column='correoElectronico', max_length=50)  # Field name made lowercase.
    password = models.CharField(max_length=100)
    rol = models.ForeignKey(Rol, models.DO_NOTHING, db_column='rol')

    class Meta:
        managed = False
        db_table = 'Usuario'


class Valida(models.Model):
    idadministrador = models.OneToOneField(Usuario, models.DO_NOTHING, db_column='idAdministrador', primary_key=True)  # Field name made lowercase. The composite primary key (idAdministrador, idAsesor) found, that is not supported. The first column is selected.
    idasesor = models.ForeignKey(Usuario, models.DO_NOTHING, db_column='idAsesor', related_name='valida_idasesor_set')  # Field name made lowercase.
    certificado = models.ForeignKey(Certificados, models.DO_NOTHING, db_column='certificado', blank=True, null=True)
    estatus = models.ForeignKey(Estatus, models.DO_NOTHING, db_column='estatus', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Valida'
        unique_together = (('idadministrador', 'idasesor'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'