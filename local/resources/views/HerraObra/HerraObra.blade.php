@extends('Layouts.inicio')
@section('breadcumbs')
<div id="breadcrumbs-wrapper">
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Listado de MaterialObra</h5>
                <ol class="breadcrumbs">
                    <li><a href="/index">Dashboard</a></li>
                    <li class="active">listado de herrapo Obra</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection
@section('Contenido')
@include('Modal.modalHerraObra')
<div class="container">
    <h3><strong>Listado de Material Obra</strong></h3>
    <!-- Modal Trigger -->
    <div class="row" style="padding-bottom: 20px;">
        <div class="col s12">
            <button class="waves-effect waves-light btn modal-trigger" data-target="modal1">NUEVO MaterialObra</button>
        </div>
    </div>

    <table id="lista_MaterialObra" class="display compact nowrapcentered" cellspacing="0" width="100%">
        <thead>
        <th>id</th>
        <th>Obra</th>
        <th>Material</th>
        <th>Cantidad</th>
        <th>Precio</th>
        <th>Editar</th>
        <th>Eliminar</th>
        </thead>
        <tbody id="datos">
        </tbody>
    </table>
</div>
<input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
@stop
@section('scripts')
{!! Html::script('js/addherraobra.js') !!} 
@endsection