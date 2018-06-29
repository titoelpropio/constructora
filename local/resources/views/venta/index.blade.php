@extends('layouts.inicio')
@section('contenido')
@include('alerts.errors')
@include('alerts.success')
@include('alerts.cargando')

<div class="row">   
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <font size="6">LOTES DISPONIBLES</font>
    </div>  
  </div>

  {!!Form::open(['class'=>'form-group','route'=>'Venta.index', 'method'=>'GET'])!!}

  <!-- ,'onsubmit'=>'javascript: return validar()' -->

  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="col-sm-3">
     <label for="">Urbanizacion</label>
     <select class="form-control" onchange="BuscarFase(this)" >
      <option>Seleccione una Urbanizacion</option>
      <?php 

      foreach ($Proyecto as $key => $value) {
        echo "<option value='$value->id'>".$value->nombre;
      }
      ?>
    </select>
  </div>
  <div class="col-sm-2">
   <label for="">Fase</label>
   <select id="selectFase" class="form-control" onchange="BuscarManzano(this)" >

   </select>
 </div>
 <div class="col-sm-2">
  <center><label for="">NÚMERO DE MANZANO</label></center>
  <select class="form-control" name="nro_manzano" id="nro_manzano" onchange="BuscarLote(this)"" ></select>

</div>
<div class="col-sm-2">
  <center><label for="">NÚMERO DE LOTE</label></center>
  <select class="form-control" name="nroLote" id="nro_lote" onchange="Buscar_Lote(this)" type="onsubmit"></select>

</div>


</div>


        <!-- <button id="btnbuscarlote" class="btn btn-primary"  onclick="Pintar()" ><i class="fa fa-search" aria-hidden="true"></i>
        </button> -->


        {!!Form::close()!!}


        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-condensed table-hover">
              <thead>
                <th><center>Nro Lote</center></th>
                <th><center>Superficie (m<sup>2</sup>)</center></th>
                <th><center>Manzano</center></th>
                <th><center>Categoria</center></th>
                <th><center>Precio al Contado</center></th>
                <th><center>Precio a Plazo</center></th>
                <th><CENTER>Operación</CENTER></th>
                <tbody id="tbodyLotes">
                @foreach ($Lote as $Lot)
                <TR>    
                  <td><center>{{$Lot->nroLote}}</center></td>
                  <td><center>{{$Lot->superficie.' '}}m<sup>2</sup></center></td>

                  <td><center>{{$Lot->manzano}}</center></td>
                  <td><center>{{$Lot->categoria}}</center></td>
                  <td><center>{{($Lot->precio*$Lot->superficie)-((($Lot->precio*$Lot->superficie)*$Lot->descuento)/100).' '}}$us</center></td>
                  <td><center>{{$Lot->precio*$Lot->superficie.' '}}$us</center></td>

                  <td><center>
                    <a href="{!!URL::to('VentaLote')!!}<?php echo "/".$Lot->id ?>" class="btn btn-success">Vender</a>
                  </center></td>
                </TR>
                @endforeach 
                </tbody>
              </table>

            </div>
          </div>
        </div>

        <script type="text/javascript">
          $(document).ready(function(){
            $('#loading').css('display','none');
          });

proyecto="";
          function BuscarFase(select){
            proyecto=$(select).val();
            $('#selectFase').empty();
            $('#loading').css('display','block');    
              $('#selectFase').append('<option>Seleccione una fase');    
            $.get('BuscarFase/'+proyecto, function(res){

              for (var i = 0; i < res.length; i++) {
                $('#selectFase').append('<option>'+res[i].fase);    
              }
              $('#loading').css('display','none');      
            });
          }
  fase="";
          function BuscarManzano(select){
            $('#loading').css('display','block');      

            fase=$(select).val();
            $('#nro_manzano').empty();
            $('#nro_lote').empty();
            $.get('BuscarManzano/'+fase+'/'+proyecto,function(res){
              $('#nro_manzano').append('<option value=0>Nro MANZANO');
              for (var i = 0; i < res.length; i++) {
                $('#nro_manzano').append('<option value='+res[i].manzano+'>'+res[i].manzano);
              }
              $('#loading').css('display','none');      
            });
          }
          function Buscar_Lote(select){
            $('#tbodyLotes').empty();
            $('#loading').css('display','block');      
            idLote = $(select).val();
            $.get('BuscarLoteId/'+idLote+'/'+proyecto , function (res) { 
              for (var i = 0; i < res.length; i++) {
                $('#tbodyLotes').append('<tr>'+
                  '<td>'+res[i].nro_lote+
                  '<td>'+res[i].superficie+' m<sup>2</sup>'+
                  '<td>'+res[i].manzano+
                  '<td>'+res[i].categoria+
                  '<td>'+res[i].precio+
                  '<td>'+res[i].descuento+
                  '<td> <center><a href="VentaLote/'+idLote+'" class="btn btn-success">Vender</a>\n\
                  </center>'
                  );
              }

              $('#loading').css('display','none');      
            });
          }


          function BuscarLote(select){
            $('#loading').css('display','block');      

            manzano=$(select).val();
            $('#nro_lote').empty();
            $.get('BuscarLoteReserva/'+manzano+'/'+proyecto,function(res){
              $('#nro_lote').append('<option value=0>Nro LOTE');
              for (var i = 0; i < res.length; i++) {
                $('#nro_lote').append('<option value='+res[i].id+'>'+res[i].nroLote);    
              }
              $('#loading').css('display','none');      
            });
          }

        </script>
        @endsection




