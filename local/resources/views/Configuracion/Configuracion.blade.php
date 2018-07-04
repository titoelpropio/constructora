@extends('Layouts.inicio')
@section('breadcumbs')
<div id="breadcrumbs-wrapper">
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Listado de Configuracion</h5>
                <ol class="breadcrumbs">
                    <li><a href="/index">Dashboard</a></li>
                    <li class="active">listado de Configuracion</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection
@section('Contenido')
<div class="container">
    <h3><strong>Configuraciones</strong></h3>
    <!-- Modal Trigger -->
    <div class="row" style="padding-bottom: 20px;">
        <div class="col s12">
            <a  id="tema1" class="btn waves-effect waves-light gradient-45deg-purple-deep-orange" onclick="actualizar(1)">Tema 1 </a>
            <a id="tema2" class="btn waves-effect waves-light gradient-45deg-purple-deep-orange" onclick="actualizar(2)">Tema 2 </a>
            <a id="tema3" class="btn waves-effect waves-light gradient-45deg-purple-deep-orange" onclick="actualizar(3)" >Tema 3 </a>
        </div>
    </div>

   
</div>
<input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
<style type="text/css">
    #tema2{
        background: linear-gradient(45deg, #1a181b 0%, #ffffff 100%) !important;
    }
    #tema1{
        background: linear-gradient(45deg, #00AEFF  0%, #3369E6  100%) !important;

    }
    #tema3{
        background: linear-gradient(45deg, #37474f  0%, #37474f  100%) !important;
    }
</style>
@stop
@section('scripts')
{!! Html::script('js/configuracion.js') !!} 
@endsection