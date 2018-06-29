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

    <div class="col s12">
        <div class="input-field col s12 m6 l4">
            <input type="email"  id="correo">
            <label  for="email">Correo electronico: *</label>
        </div>
        <div class="input-field col s12 m6 l2">                                
            <input type="text"  id="celular" length="20">
            <label  for="celular">Celular: *</label>
        </div>            
        <div class="input-field col s12 m6 l2">
            <input type="text"  id="telefonofijo" length="20"> 
            <label for="telefonofijo">Telefono Fijo: </label>
        </div>            
        <div class="input-field col s12 m6 l2">
            <label for="Cargo"  class="active">Cargo:</label>            
            <select id="Cargo">
            </select>
        </div>            
        <div class="input-field col s12 m6 l2">
            <select id="turno">
            </select>
            {!!Form::label('turno','Turno:')!!}
        </div>
    </div>

    <div class="col s12">
        <div class="input-field col s12 m6 l12">
            {!!Form::label('Descuento','Porcentaje de Comision: *')!!}<br><br>
            <div id="descuento"></div>
        </div>
    </div>


    <div class="row">
        <div class="input-field col s12">
            <div class="row">
                <div class="input-field col s1">
                    <i class="mdi-action-history prefix"></i>
                </div>
                <div class="col s11">

                </div>
            </div>
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
