@extends('Layouts.inicio')
@section('breadcumbs')
    <div id="breadcrumbs-wrapper">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <h5 class="breadcrumbs-title">Gestionar Usuarios</h5>
                    <ol class="breadcrumbs">
                        <li><a href="/index">Dashboard</a></li>
                        <li><a href="/Empleados">Gestionar Empleados</a></li>
                        <li class="active">Gestionar Usuario</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('Contenido')
    <input type="hidden" value="{{ $id_empleado }}" id="idempleado">
    <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">

    <form class="row">
        <div class="col s12">
            <h4> Agregar Usuario a: <b>{{ $empleado[0]->nombre }}</b></h4>
            <div class="input-field col s12 m6 l12">
                <img style="margin: auto;" class="circle responsive-img valign profile-image materialboxed" width="200" height="200" href="" src="../images/avatar.jpg" id="vistaPrevia2">
                <div class="file-field input-field">
                    <div class="btn">
                        <span>Foto</span>
                        <input type="file" id="seleccionarImagen2">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text" id="nombreimg2" value=" ">
                    </div>
                </div>                 
            </div>
            <div class="input-field col s12 m6 l3">
                <label for="usuario">Usuario:</label>
                <input id="usuario" type="text" placeholder="">
            </div>
            <div class="input-field col s12 m6 l3">
                <label for="password">Contraseña:</label>
                <input id="password" type="password" name="password" placeholder="">
            </div>            
            <div class="col s12 m6 l3"><br>
                <input type="checkbox" id="show"/>
                <label for="show">Ver Contraseña</label> 
            </div>

            <div class="input-field col s12 m6 l3">
                <label class="active">Perfil :</label>
                <select id="perfil" name="Perfil">
                    <option value="">Seleccione un perfil</option>
                    @foreach($perfil as $row)
                    <option value="{{ $row->id }}">{{ $row->nombre }}</option>
                    @endforeach
                </select> 
            </div>
        </div>

 

        <div class="row" hidden="">
            <div class="input-field col s12 m12 l6">
                <i class="mdi-editor-insert-invitation prefix"></i>
                <label for="fechainicio">Fecha de Inicio:</label>
                <input type="date" id="fechainicio" class="datepicker" placeholder=""/>
            </div>
            <div class="input-field col s12 m12 l6">
                <i class="mdi-editor-insert-invitation prefix"></i>
                <label class="fechafin">Fecha de Fin:</label>
                <input type="date" id="fechafin" class="datepicker" placeholder=""/>
            </div>
        </div>

    </form>

  
    <div class="row"> <br>
        <div class="col s2">
            <a class="waves-effect waves-light btn" href="../Empleados">Volver</a>
        </div>
        <div class="col s2">
            <a class="waves-effect waves-light btn" id="actualizar">Actualizar</a>
        </div>
        <div class="col s2">
            <a class="waves-effect waves-light btn" id="guardar">Guardar</a>
        </div>
    </div>


@stop
@section('scripts')
    {!! Html::script('js/addusuario.js') !!}
@endsection