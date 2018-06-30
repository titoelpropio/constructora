@extends('Layouts.inicio')
@section('breadcumbs')
<div id="breadcrumbs-wrapper">
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Agregar Empleado</h5>
                <ol class="breadcrumbs">
                    <li><a href="/index">Dashboard</a></li>
                    <li><a href="/Empleados">Gestionar Empleados</a></li>
                    <li class="active">Formulario Empleado</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection
@section('Contenido')
<input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
<div class="col s6">
    <h3><strong>Formulario de  Empleado</strong></h3>
    <div class="divider"></div>
</div>
<form class="row">
    <div class="col s12">
        <div class="input-field col s12 m6 l4">
            <input id="nombre" type="text"  length="100">
            <label for="nombre">Nombre: *</label>
        </div>
          <div class="input-field col s12 m6 l4">
            <input id="apellido" type="text"  length="100">
            <label for="input">Apellido: *</label>
        </div>
        <div class="input-field col s12 m6 l3">
            <input type="text"  id="Docidentidad" length="20">
            <label for="Docidentidad">Documento de identidad: *</label>
        </div>            

        <div class="input-field col s12 m6 l3">
            <label for="fechanacimiento" class="active">Fecha de nacimiento: *</label> 
            <input type="date"  id="fechanacimiento">
        </div>
        <div class="input-field col s12 m6 l2">
            <label for="genero" class="active">Genero:</label>
            <select id="genero">
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                <option value="Otro">Otro</option>
            </select>
        </div>
    </div>


</form>
    
<div class="row">
    <div class="input-field col s12" id="Guardaryvolveresconder" >
        <a class="btn" href="/Empleados" style="background: black"> VOLVER </a>         
        <a class="btn" id="guardar">GUARDAR</a>
    </div>
</div>
<div class="row" id="ingredienteycomposicionmostrar" style='display:none;'>
</div>

@stop
@section('scripts')
{!! Html::script('js/addempleado.js') !!}
@endsection
