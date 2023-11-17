from django import forms
from .models import Usuario

class AsesoradosForm(forms.ModelForm):
    fechanacimiento = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date'}),
    )

    class Meta:
        model = Usuario
        fields = '__all__'
        labels = {
            'nombre':'Nombre',
            'segundoapellido':'Segundo Apellido',
            'fechanacimiento':'Fecha de nacimiento',
            'correoelectronico':'Email',
            'password':'Contraseña'
        }

    def __init__(self, *args, **kwargs):
        super(AsesoradosForm,self).__init__( *args, **kwargs)
        self.fields['rol'].empty_label = "Selecciona"
