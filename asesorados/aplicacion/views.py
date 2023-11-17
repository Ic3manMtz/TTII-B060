from django.shortcuts import render,redirect
from .forms import AsesoradosForm
from .models import Usuario
# Create your views here.

def lista_asesorados(request):
    context = {'lista_asesorados':Usuario.objects.all()}
    return render(request, "aplicacion/asesor_lista.html",context)

def form_asesorados(request,id=0):
    if request.method == "GET":
        if id==0:
            form = AsesoradosForm()
        else:
            usuario =  Usuario.objects.get(pk=id)
            form = AsesoradosForm(instance=usuario)
        return render(request, "aplicacion/asesor_form.html",{'form':form})
    else:
        if id==0:
            form = AsesoradosForm(request.POST)
        else:
            usuario =  Usuario.objects.get(pk=id)
            form = AsesoradosForm(request.POST,instance=usuario)
        if form.is_valid():
            form.save()
        return redirect('/asesor/listar')


def borrar_asesorado(request,id):
    usuario =  Usuario.objects.get(pk=id)
    usuario.delete()
    return redirect('/asesor/listar')
