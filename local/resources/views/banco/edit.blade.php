@extends('layouts.inicio')
@section('contenido')
<div class="col-md-12">
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">SISTEMA INMOBILIARIO</h3>
            <div class="box-tools pull-right">

            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">


	<h3>ACTUALIZAR BANCO</h3>
<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">		
    @include('alerts.request')

	{!!Form::model($banco,['route'=>['Banco.update',$banco->id],'method'=>'PUT'])!!}

	
	@include('banco.forms.mod')
	<div class="row">
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">		

	{!!Form::submit('Actualizar',['class'=>'btn btn-primary'])!!}
	{!!Form::close()!!}
	</div>
  
	</div>
</div>
</div>


           </div>
        </div>
      </div>
  </div><!-- /.row -->
</div><!-- /.box-body -->
@endsection