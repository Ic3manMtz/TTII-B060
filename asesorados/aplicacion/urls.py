from django.urls import include, path
from . import views

urlpatterns = [
    path('', views.form_asesorados,name='insertar'), # get and post para insertar
    path('<int:id>/', views.form_asesorados,name='actualizar'), # get and post para actualizar
    path('borrar/<int:id>/',views.borrar_asesorado,name='borrar'),
    path('listar/',views.lista_asesorados,name='listar') # get request para listar y mostrar 
]
