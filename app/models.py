from django.db import models
from django.contrib.auth.models import User

class Categoria(models.Model):
    titulo = models.CharField(max_length = 140)
    
    def __unicode__(self):
        return self.titulo


class Enlace(models.Model):
    titulo = models.CharField(max_length = 140)
    enlace = models.URLField()
    votos = models.IntegerField(default = 0)
    categoria = models.ForeignKey(Categoria)
    usuario = models.ForeignKey(User)
    timestamp = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return "%s -  %s" % (self.titulo,self.enlace)


class Usuario(models.Model):
    SEXO_CHOICES = (
   ('','---- Seleccione ---'),
    ('m','Masculino'),
    ('f','Femenino'),
)

    nombre = models.CharField(max_length = 20)
    apellidos = models.CharField(max_length = 45)
    fechanacimiento = models.DateField(('Fecha de Nacimiento'),auto_now_add=False)
    genero = models.CharField(max_length=1, choices=SEXO_CHOICES,default=SEXO_CHOICES)
    email  = models.EmailField(max_length=75)
    password = models.CharField(max_length = 45)
    activo = models.BooleanField(default=True)
   


    def __unicode__(self):
        return self.nombre


class Promotor(models.Model):
     usuario = models.ForeignKey(Usuario)

     def __unicode__(self):
        return str(self.usuario)
     
    
class Destino(models.Model):
    calle = models.CharField(max_length = 45)
    codigopostal = models.IntegerField(default=0)
    
    def __unicode__(self):
        return "%s" % (self.calle)

class TipoEvento(models.Model):
    nombretipoevento = models.CharField(('Tipo de Evento'),max_length = 45)
    detallesevento = models.CharField(('Detalles del Evento'),max_length = 45)

    def __unicode__(self):
        return self.nombretipoevento
   

class Evento(models.Model):
    titulo = models.CharField(max_length = 45)
    descripcipn = models.CharField(max_length = 45)
    fechaevento = models.DateField(auto_now_add=False)
    hora = models.TimeField(auto_now_add=False)
    tipoevento = models.ForeignKey(TipoEvento)
    costo = models.FloatField()
    destino = models.ForeignKey(Destino)
    activo =  models.BooleanField(default=False)

    def __unicode__(self):
        return self.titulo
   
class Cliente(models.Model):
    usuario = models.ForeignKey(Usuario)

    def __unicode__(self):
        return str(self.usuario)

class Calendario(models.Model):
    fecha = models.DateTimeField(auto_now_add=False)
    evento = models.ForeignKey(Evento)
    cliente = models.ForeignKey(Cliente)
  
    def __unicode__(self):
        return "%s" % (self.fecha)

class Origen(models.Model):
    calle = models.CharField(max_length = 45)

    def __unicode__(self):
        return self.calle


class Ruta(models.Model):
    logitud = models.FloatField()
    latitud = models.FloatField()
    destino = models.ForeignKey(Destino)
    origen  = models.ForeignKey(Origen)

    def __unicode__(self):
        return "%s" % (self.logitud)


class Administrador(models.Model):
    usuario = models.ForeignKey(Usuario)

    def __unicode__(self):
        return str(self.usuario)

 
class Preferencia(models.Model):
   identificador = models.IntegerField()

 #class ClientePreferencia(models.Model):
    # cliente = models.ForeignKey(Cliente)
     #Preferencia = models.ForeignKey(Preferencia)


    # def __unicode__(self):
        #return u'%s'% str(self.cliente) #

     
class Academia(models.Model):
  academica =  models.BooleanField(default=False)
  areaestudio = models.BooleanField(default=False)
  congresos = models.BooleanField(default=False)
  convenciones =models.BooleanField(default=False)
  seminarios= models.BooleanField(default=False)
  talleres = models.BooleanField(default=False)
  diplomados=  models.BooleanField(default=False)
  cursos = models.BooleanField(default=False)
  conferencias= models.BooleanField(default=False)
  expos= models.BooleanField(default=False)
  Preferencia = models.ForeignKey(Preferencia)

  def __unicode__(self):
        return u"%s Academia" % self.academica

class Entretenimiento(models.Model):
    entretenimiento =  models.BooleanField(default=False)
    conciertos =  models.BooleanField(default=False)
    electronica =  models.BooleanField(default=False)
    jazzblues =  models.BooleanField(default=False)
    trova =  models.BooleanField(default=False)
    rock =  models.BooleanField(default=False)
    alternativa =  models.BooleanField(default=False)
    gruperanortena =  models.BooleanField(default=False)
    infantil =  models.BooleanField(default=False)
    hiphop  =  models.BooleanField(default=False)
    ranchera =  models.BooleanField(default=False)
    pop =  models.BooleanField(default=False)
    metal =  models.BooleanField(default=False)
    reague =  models.BooleanField(default=False)
    reggeatton =  models.BooleanField(default=False)
    baladasboleros =  models.BooleanField(default=False)
    salsacumbia =  models.BooleanField(default=False)
    cristiana =  models.BooleanField(default=False)
    deportes =  models.BooleanField(default=False)
    futbol =  models.BooleanField(default=False)
    basquetball =  models.BooleanField(default=False)
    tenis =  models.BooleanField(default=False)
    beisball =  models.BooleanField(default=False)
    volleyball =  models.BooleanField(default=False)
    torneos =  models.BooleanField(default=False)
    maratones =  models.BooleanField(default=False)
    autosmotos =  models.BooleanField(default=False)
    futbolAmericano =  models.BooleanField(default=False)
    artesMarciales =  models.BooleanField(default=False)
    box  =  models.BooleanField(default=False)
    luchaLibre =  models.BooleanField(default=False)
    atletismo =  models.BooleanField(default=False)
    toros =  models.BooleanField(default=False)
    baresantros =  models.BooleanField(default=False)
    inaguracion =  models.BooleanField(default=False)
    promocion =  models.BooleanField(default=False)
    show =  models.BooleanField(default=False)
    fiestasTematicas =  models.BooleanField(default=False)
    bienvenida =  models.BooleanField(default=False)
    Preferencia = models.ForeignKey(Preferencia)

    def __unicode__(self):
        return u"%s Entretenimiento" % self.entretenimiento

        
class Cultural(models.Model):
   cultural =  models.BooleanField(default=False)
   balletdanza =  models.BooleanField(default=False)
   teatro  =  models.BooleanField(default=False)
   comedia  =  models.BooleanField(default=False)
   drama  =  models.BooleanField(default=False)
   infantilC  =  models.BooleanField(default=False)
   musical  =  models.BooleanField(default=False)
   otrosT  =  models.BooleanField(default=False)
   circos  =  models.BooleanField(default=False) 
   exposiciones  =  models.BooleanField(default=False)
   fotografia  =  models.BooleanField(default=False)
   escultura  =  models.BooleanField(default=False)
   pintura  =  models.BooleanField(default=False)
   libros  =  models.BooleanField(default=False)
   otrosE  =  models.BooleanField(default=False)
   cineArte  =  models.BooleanField(default=False)
   musica  =  models.BooleanField(default=False)
   clasica  =  models.BooleanField(default=False)
   instrumental  =  models.BooleanField(default=False)
   folklorepopular  =  models.BooleanField(default=False)
   turistico  =  models.BooleanField(default=False)
   ferias  =  models.BooleanField(default=False)
   carnavales  =  models.BooleanField(default=False)
   peregrinaciones  =  models.BooleanField(default=False)
   fiestasReligiosasIndigenas  =  models.BooleanField(default=False)
   otrosTuristica  =  models.BooleanField(default=False)
   Preferencia = models.ForeignKey(Preferencia)

   def __unicode__(self):
        return u"%s Cultural" % self.cultural


