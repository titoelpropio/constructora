@extends('Layouts.inicio')
@section('breadcumbs')
<div id="breadcrumbs-wrapper">
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Lista de Objetos</h5>
                <ol class="breadcrumbs">
                    <li><a href="/index">Dashboard</a></li>
                    <li class="active">Lista de Objetos</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection
@section('Contenido')
@include('Modal.modalobjeto')
<h3><strong>Listado de  Objeto</strong></h3>
<div class="row" style="padding-bottom: 20px;">
    <div class="col s12">
        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">NUEVO OBJETO</a>
    </div>
</div>
<table id="tablacategoria" class="centered display compact nowrap" cellspacing="0" width="100%">
    <thead>
    <th>Nombre</th>
    <th>Tipo Objeto</th>
    <th>Habilitado</th>
    <th>Modulo</th>
    <th>Visible en Menu</th>
    <th>Editar</th>
    <th>Eliminar</th>
</thead>
<tbody id="datos">
</tbody>
</table>
@stop

@section('scripts')
{!! Html::script('js/addobjeto.js') !!}
@endsection