$(document).ready(function(){
    // $('#btn_agregar').hide();      
    // $('#div_crear_1').hide();      
    // $('#div_crear_2').hide();     
    $('#loading').css('display','none');     
    BuscarCliente();


  });

function crear(){
  $("#div_crear_1").show();
  $("#div_crear_2").show();
}

var id_lote = [];
var nro_lote = [];
var nro_manzano = [];
var cont = 0;

//AGREGAR
function agregar(){
  $("#btn_agre").hide();  
  tabladatos = $('#body_busqueda');
  var fila = '<tr id="fila'+cont+'" align=center>\n\
  <td><input name="nro_lote[]" id="nro_lote'+cont+'" type="text" placeholder="Nro Lote" size="10" style="text-align: center;" onkeypress="return bloqueo_de_punto(event)"></td>\n\
  <td><input name="nro_manzano[]" id="nro_manzano'+cont+'" type="text" placeholder="Nro Manzano" size="10" style="text-align: center;" onkeypress="return bloqueo_de_punto(event)"></td>\n\
  <td><button type="button" class="btn-sm btn-info" title=Buscar onclick="Buscar_Lote(' + cont + ')"><i class="fa fa-search" aria-hidden="true"></i></button></td>\n\
  <td align=left><input name="id_lote[]" id="id_lote'+cont+'" type="hidden"> Nro. Lote: <font id="lote'+cont+'" size="4"> </font><br>\n\
  Nro. Manzano: <font id="manzano'+cont+'" size="4"> </font><br>  Precio: <font id="precio'+cont+'" size="4"> </font><br>  Superficie: <font id="superficie'+cont+'" size="4"> </font><br>\n\
  Proyecto: <font id="proyecto'+cont+'" size="4"> </font><br>  Estado: <font id="estado'+cont+'" size="4"> </font><br>   </td>\n\
  <td> <button type="button" id="btn_eli'+cont+'" class="btn-sm btn-danger" title=Eliminar onclick="Eliminar_lista(' + cont + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></button></td></tr>';            
  $('#body_busqueda').append(fila);
}
function Eliminar_lista(index){
  $('#fila' + index).remove();
  $("#btn_agre").show();   
  cont++;
}


function BuscarCliente(){
 EstadoCivil= $('#estadoCivil');
 ci=$("input[name=ci]").val();
 if (ci !="" || ci!="0") {
  $.get('../verificarCarnet/'+ci, function(res){
    if (res[0].contador == 0) {
      toastr.info("EL CLIENTE ES NUEVO");
      $("input[name=nombre]").val("");
      $("input[name=apellidos]").val("");
      $("input[name=fechaNacimiento]").val("");
      $("input[name=celular]").val("");
      $("input[name=celular_ref]").val("");
      $("input[name=lugarProcedencia]").val("");
      $("input[name=ocupacion]").val("");

      $("input[name=domicilio]").val("");
      $("input[name=nit]").val("");
      $("input[name=idCliente]").val('0');
      document.getElementById("m").checked = false;                      
      document.getElementById("f").checked = false;                    
    } else {
      $("input[name=idCliente]").val(res[0].id);
      $("input[name=ocupacion]").val(res[0].ocupacion);

      $("select[name=expedido]").val(res[0].expedido);
      $("input[name=nombre]").val(res[0].nombre);
      $("input[name=apellidos]").val(res[0].apellidos);
      $("input[name=fechaNacimiento]").val(res[0].fechaNacimiento);
      $("select[name=idPais]").val(res[0].idPais);
      $("input[name=celular]").val(res[0].celular);
      $("input[name=celular_ref]").val(res[0].celular_ref);
      $("input[name=lugarProcedencia]").val(res[0].lugarProcedencia);
      $("select[name=estadoCivil]").val(res[0].estadoCivil);
      $("input[name=domicilio]").val(res[0].domicilio);
      $("input[name=nit]").val(res[0].nit);
      if (res[0].genero == 'm') {
       document.getElementById("m").checked = true;                      
     } else {
       document.getElementById("f").checked = true;                
     }
     toastr.success("EXISTE ESE CLIENTE");      
   }
 });
}else{
 $("input[name=nombre]").val("");
 $("input[name=apellidos]").val("");
 $("input[name=fechaNacimiento]").val("");
 $("input[name=celular]").val("");
 $("input[name=celular_ref]").val("");
 $("input[name=lugarProcedencia]").val("");
 $("input[name=ocupacion]").val("");
 
 $("input[name=domicilio]").val("");
 $("input[name=nit]").val("");
 $("input[name=idCliente]").val('0');
 document.getElementById("m").checked = false;                      
 document.getElementById("f").checked = false;       
}
}



function Buscar_Lote(id){
  nro_lote = $("#nro_lote"+id).val();
  nro_manzano = $("#nro_manzano"+id).val();
  $('#loading').css('display','block');     

  if ($("#nro_lote"+id).val() == "" || $("#nro_manzano"+id).val() == "") {
   toastr.error('INTRODUSCA LOS DATOS CORRESPONDIENTES');    
 } else {
  $.get('Buscar_Lote/'+nro_lote+"/"+nro_manzano , function (response) { 
    if (response[0].contador == 0) {
      alert('NO EXISTE ESE TERRENO');                 
      $("#btn_agregar").hide();
      $("#lote"+id).text("");
      $("#manzano"+id).text("");
      $("#precio"+id).text("");
      $("#superficie"+id).text("");
      $("#proyecto"+id).text("");
      $("#estado"+id).text("");
      $("#btn_agre").hide();
    } else {
      if (response[0].estado == 0) {
        $("#id_lote"+id).val(response[0].id_lote);
        $("#lote"+id).text(response[0].nroLote);
        $("#manzano"+id).text(response[0].manzano);
        $("#precio"+id).text(response[0].precio);
        $("#superficie"+id).text(response[0].superficie +" Km²");
        $("#proyecto"+id).text(response[0].nombre);
        switch(response[0].estado) {
          case 0:
          $("#estado"+id).text("DISPONIBLE");  
          $("#btn_agregar").show(); 
          $("#btn_eli"+id).show();
          $("#btn_agre").show();                                                                           
          cont++;                                          
          break;
          case 1:
          $("#estado"+id).text("PRE-RESERVA");                                          
          $("#btn_agregar").hide();
          $("#btn_eli"+id).hide(); 
          $("#btn_agre").hide();                                                     
          break;
          case 2:
          $("#estado"+id).text("RESERVA");                                          
          $("#btn_agregar").hide();
          $("#btn_eli"+id).hide(); 
          $("#btn_agre").hide();                                                     
          break;       
          case 3:
          $("#estado"+id).text("COMPRADO");                                          
          $("#btn_agregar").hide();
          $("#btn_eli"+id).hide(); 
          $("#btn_agre").hide();                                                     
          break;                        
        }            
      } else {
       toastr.error("ESE LOTE NO ESTA DISPONIBLE");
       $("#btn_agregar").hide();
       $("#btn_agre").hide();                                                     
     }

   } 
   $('#loading').css('display','none');     

 });
}
}
function cargarBanco(radio){

  $('#loading').css('display','block');      
  banco=$('select[name=bancoC]');
  cuenta=$('select[name=cuentaC]');
  documento=$('input[name=nroDocumentoC]');
  montoEfectivo=$('input[name=montoEfectivo]');
  montobanco=$('input[name=montoBanco]');
  divBanco=$('#divBanco');
  divMontoMixto=$('#divMontoMixto');

  if ($(radio).val()=="b") {

    divBanco.css('display','block');
    divMontoMixto.css('display','none');
    montoEfectivo.empty();
    montobanco.empty();
    $('select[name=bancoC]').empty();
    $.get('../cargarBanco',function(res){
      banco.append('<option value=0> Seleccione un Banco') ;
      for (var i = 0; i < res.length; i++) {
        banco.append('<option value='+res[i].id+'>'+res[i].nombre) ;
      }
      $('#loading').css('display','none');      

    });
  }
  else{
    if ($(radio).val()=="be") {

      divBanco.css('display','block');
      divMontoMixto.css('display','block');

      $('select[name=bancoC]').empty();
      $.get('../cargarBanco',function(res){
        $('select[name=bancoC]').append('<option value=0> Seleccione un Banco') ;
        for (var i = 0; i < res.length; i++) {
         banco.append('<option value='+res[i].id+'>'+res[i].nombre) ;
       }
       $('#loading').css('display','none');      

     });
    }else{
      banco.empty();

      cuenta.empty();
      divBanco.css('display','none');
      divMontoMixto.css('display','none');
      montoEfectivo.empty();
      montobanco.empty();
      $('input[name=nroDocumentoC]').val("");
      $('input[name=montoBancoC]').val("");


      $('#loading').css('display','none');      

    }
  }
}

function cargarCuenta(select){
  $('#loading').css('display','block');      

  idBanco=$(select).val();
  $('select[name=cuentaC]').css('display','block');     

  $('select[name=cuentaC]').empty();
  $.get('../cargarCuenta/'+idBanco,function(res){
    for (var i = 0; i < res.length; i++) {
     $('select[name=cuentaC]').append('<option value='+res[i].id+'>'+res[i]. nroCuenta+"  -  "+res[i].moneda) ;
   }
   $('#loading').css('display','none');      

 });
  
}
function CargarTabla(radio){
  montoBanco=$('input[name=montoBanco]');
  montoEfectivo=$('input[name=montoEfectivo]');
  montoBanco.val("");
  montoEfectivo.val("");
  $('#pagoUsd').val("");
  $('#pagoBs').val("");
  if ($(radio).val()=='c') {
   $('#TablaContado').css('display','block');
   $('#TablaPlazo').css('display','none');


 }
 else{
  $('#TablaPlazo').css('display','block');
  $('#TablaContado').css('display','none');}


}

function CalcularPagos(select){
  pago=$('input[name=Pago]').val();
  PrecioLote=$('input[name=precio]').val();
  Superficie=$('input[name=superficie]').val();
  plazo=$(select).val();
  tipoCambio=$('input[name=TipoDeCambio]').val();


  if (pago=="") {

    PrecioTotal=PrecioLote*Superficie;
    cuota=PrecioTotal/plazo;
    cuotaBs=tipoCambio*cuota;
    $('input[name=cuotaMensual]').val((cuota).toFixed(2));
    $('input[name=cuotaMensualBs]').val((cuota*tipoCambio).toFixed(2));

  }
  else{
    PrecioTotal=PrecioLote*Superficie;
    PrecioTotalBs=PrecioTotal;
    PrecioTotalMenosCuota=PrecioTotalBs-pago;
    cuota=PrecioTotalMenosCuota/plazo;

    if (cuota % 1 == 0) {
     $('input[name=cuotaMensual]').val(cuota)  ;
     $('input[name=cuotaMensualBs]').val((cuota*tipoCambio).toFixed(2));

   }
   else{
     cuotaTotal=Math.trunc(cuota)+1;
     $('input[name=cuotaMensual]').val(cuotaTotal)  ;
     $('input[name=cuotaMensualBs]').val((cuota*tipoCambio).toFixed(2));

   }


 }

}
function verificarPlazo(input){
  plazo=$(input).val();
  DescuentoPlazo=$('input[name=DescuentoPlazo]');
  PrecioPlazo=$('input[name=PrecioPlazo]');
  PrecioPlazoBs=$('input[name=PrecioPlazoBs]');
  Precio=$('input[name=precio]').val();
  Superficie=$('input[name=superficie]').val();
  PrecioLote=Precio*Superficie;
  if (plazo=="" || plazo==0) {totalPagadoBs
    $('input[name=pagoInicial]').css('display','none');
    $('input[name=totalPagadoBs]').val("");

    $('select[name=SelectPagoInicial]').css('display','none');
    DescuentoPlazo.val("");
  }else{
    $('input[name=totalPagadoBs]').val("");

    $('select[name=SelectPagoInicial]').css('display','block');
    $('input[name=pagoInicial]').val("");
    $('input[name=cuotaMensual]').val("")  ;
    if (plazo<=12) {
      DescuentoPlazo.val('10');

      total=PrecioLote-(PrecioLote*10/100);
      PrecioPlazo.val(parseFloat(total).toFixed(2));
      PrecioPlazoBs.val(parseFloat(total*tipoDecambioVenta).toFixed(2));
      return;
    }else{
      if (plazo>12 && plazo<=24) {
       DescuentoPlazo.val('5');
       total=PrecioLote-(PrecioLote*5/100);
       PrecioPlazo.val(parseFloat(total).toFixed(2));
       PrecioPlazoBs.val(parseFloat(total*tipoDecambioVenta).toFixed(2));
       return;
     }   


   }

   DescuentoPlazo.val('0');
   PrecioPlazo.val(parseFloat(PrecioLote).toFixed(2));
   PrecioPlazoBs.val(parseFloat(PrecioLote*tipoDecambioVenta).toFixed(2));
 }
}
function PagoInicial(select){//este viene del select calculando el pago inicial
  $('input[name=sumarDecimal]').val("");
    // pagominimo=parseInt($('input[name=pago]').val());
CuotaMinima=$('input[name=CuotaMinima]').val();//porcentaje cuota minima
    // pago=$('input[name=pago]').val();
    PrecioLote=$('input[name=precio]').val();
    Superficie=$('input[name=superficie]').val();
    plazo=$('input[name=meses]').val();
    tipoCambio=$('input[name=TipoDeCambio]').val();
    PrecioPlazo=$('input[name=PrecioPlazo]').val();
    PrecioPlazoBs=$('input[name=PrecioPlazoBs]').val();
    pagoInicial=$('input[name=pagoInicial]');
    pagoInicialBs=$('input[name=pagoInicialBs]');
    totalPagado=$('input[name=totalPagado]');
    cuotaMensual=$('input[name=cuotaMensual]');
    cuotaMensualBs=$('input[name=cuotaMensualBs]');
    reserva=$('input[name=reserva]').val();
    totalPagadoBs=$('input[name=totalPagadoBs]');
    CuatoInicial=(PrecioPlazo*CuotaMinima/100).toFixed(2)-subTotalReservaDolar;

    CuatoInicialBs=(PrecioPlazoBs*CuotaMinima/100).toFixed(2)-subTotalReservaBs;

 // CuatoInicialBs=(CuatoInicial*tipoDecambioVenta)-subTotalReservaBs;
 PagoInicialReserva=CuatoInicial+parseFloat(subTotalReservaDolar);
 PagoInicialReservaBs=CuatoInicialBs+parseFloat(subTotalReservaBs);

 seleccion=$(select).val();
 if (seleccion=='0') {
  if ($('#tipoMonedaBoliviano').prop('checked')) {
    pagoInicial.css('display','none');
    pagoInicialBs.css('display','block');

  }else{
    pagoInicial.css('display','block');
    pagoInicialBs.css('display','none');

  }

  pagoInicial.attr('readonly',true);
  pagoInicialBs.attr('readonly',true);
  pagoInicial.val(CuatoInicial);
  pagoInicialBs.val(CuatoInicialBs.toFixed(2));
  totalPagado.val(PagoInicialReserva);
  totalPagadoBs.val((PagoInicialReserva*tipoCambio).toFixed(2));
  PrecioTotalMenosCuota=PrecioPlazo-PagoInicialReserva;
  PrecioTotalMenosCuotaBs=PrecioPlazoBs-PagoInicialReservaBs;
  cuota=PrecioTotalMenosCuota/plazo;
  cuotaBs=PrecioTotalMenosCuotaBs/plazo;
  if (cuota % 1 == 0) {
    cuotaMensual.val(cuota)  ;
   $('input[name=sumarDecimal]').val('0');

  }
  else{

   cuotaTotal=Math.trunc(cuota)+1;
   cuotaMensual.val(cuotaTotal)  ;
   sumarDecimal(cuota,cuotaTotal,'DOLAR');
 }
 if (cuotaBs % 1 == 0) {
  cuotaMensualBs.val(cuotaBs.toFixed(2));
   $('input[name=sumarDecimalBs]').val('0');

}else{

 cuotaTotalBs=Math.trunc(cuotaBs)+1;
 sumarDecimal(cuotaBs,cuotaTotalBs,'BOLIVIANO');
 cuotaMensualBs.val(cuotaTotalBs)  ;
}

$('input[name=totalPagado]').val(PagoInicialReserva);

}
else{
  if ($('#tipoMonedaBoliviano').prop('checked')) {
    $('input[name=totalPagadoBs]').attr('readonly',false);
    totalPagado.val("");

    $('input[name=cuotaMensual]').val("");
  }else{
    $('input[name=totalPagado]').attr('readonly',false);
    totalPagadoBs.val("");

    $('input[name=cuotaMensual]').val("");
  }
}
}




function VerificarPagoInicial(input,moneda){//este se encarga e verificar que el pago sea mayor al minimo
     // pagominimo=parseInt($('input[name=pago]').val());// si la moneda 0 es bolivano, si 1 es dolar
     if (moneda==1) {

CuotaMinima=$('input[name=CuotaMinima]').val();//porcentaje cuota minima

    // pago=$('input[name=pago]').val();
    pagoIni=$('input[name=pagoInicial]');
    plazo=$('input[name=meses]').val();
PrecioPlazo=$('input[name=PrecioPlazo]').val();//precio del lote a plazo
pagoInicial=$('input[name=totalPagado]').val();//este seria el total a pagar 
cuotaMensual=$('input[name=cuotaMensual]').val();//cuotas mensuales
reserva=$('input[name=reserva]').val();//reserva si tiene
CuatoInicial=(PrecioPlazo*CuotaMinima/100).toFixed(0)-subTotalReservaDolar;
PagoInicialReserva=parseFloat(pagoInicial)+parseFloat(subTotalReservaDolar);


$('input[name=sumarDecimal]').val("");

pago=parseFloat($(input).val()).toFixed(2);

if (parseFloat(pagoInicial)<CuatoInicial) {//este verifica que el pago sea mayor al minimo
  toastr.error('El pago tiene que ser mayor al minimo');
  $('input[name=cuotaMensual]').val("")  ;

  $(input).val("");
}
else{
  pagoIni.css('display','block');
  pagoIni.val(PagoInicialReserva);
  toastr.success('Pago Permitido');



  PrecioTotalMenosCuota=PrecioPlazo-PagoInicialReserva;

  cuota=PrecioTotalMenosCuota/plazo;

  if (cuota % 1 == 0) {
   $('input[name=cuotaMensual]').val(cuota)  ;
   $('input[name=sumarDecimal]').val('0');
 }
 else{
   cuotaTotal=Math.trunc(cuota)+1;
   sumarDecimal(cuota,cuotaTotal,'DOLAR');
   $('input[name=cuotaMensual]').val(cuotaTotal)  ;
 }

}
}else{
      CuotaMinima=$('input[name=CuotaMinima]').val();//porcentaje cuota minima

    // pago=$('input[name=pago]').val();
    pagoIni=$('input[name=pagoInicialBs]');
    plazo=$('input[name=meses]').val();
PrecioPlazo=$('input[name=PrecioPlazoBs]').val();//precio del lote a plazo
pagoInicial=$('input[name=totalPagadoBs]').val();//este seria el total a pagar 
cuotaMensual=$('input[name=cuotaMensualBs]').val();//cuotas mensuales
reserva=$('input[name=reserva]').val();//reserva si tiene
CuatoInicial=(PrecioPlazo*CuotaMinima/100).toFixed(0)-subTotalReservaBs;
PagoInicialReserva=parseFloat(pagoInicial)+parseFloat(subTotalReservaBs);


$('input[name=sumarDecimal]').val("");

pago=parseFloat($(input).val()).toFixed(2);

if (parseFloat(pagoInicial)<CuatoInicial) {//este verifica que el pago sea mayor al minimo
  toastr.error('El pago tiene que ser mayor al minimo');
  $('input[name=cuotaMensualBs]').val("")  ;

  $(input).val("");
}
else{
  pagoIni.css('display','block');
  pagoIni.val(PagoInicialReserva);
  toastr.success('Pago Permitido');



  PrecioTotalMenosCuota=PrecioPlazo-PagoInicialReserva;

  cuota=PrecioTotalMenosCuota/plazo;

  if (cuota % 1 == 0) {
   $('input[name=cuotaMensualBs]').val(cuota)  ;
   $('input[name=sumarDecimalBs]').val('0');

 }
 else{
   cuotaTotal=Math.trunc(cuota)+1;
   sumarDecimal(cuota,cuotaTotal,'BOLIVIANO');
   $('input[name=cuotaMensualBs]').val(cuotaTotal)  ;
 }
}
}
}
function sumarDecimal(numero,entero,moneda){
  meses=$('input[name=meses]').val();
  total=numero-entero;

  totalpormeses=total*meses;
  totalpositivo=(totalpormeses*-1).toFixed(2);

  if (moneda=="DOLAR") {

    $('input[name=sumarDecimal]').val(totalpositivo);
  }else{
    $('input[name=sumarDecimalBs]').val(totalpositivo);
  }


}

function CambioMoneda(){//genera el codigo de la cuenta para ponerlo en en imput codigo del modal
  var moneda = $("input[name=moneda]").val(); 
  var usuario = $("input[name=usuario]").val();
  var password = $("input[name=password]").val();    
  if(moneda == ""){
    toastr.error("INTRODUSCA LOS DATOS CORRECTAMENTE");            
  }else{

    $('#loading').css('display','block');           

    $.ajax({
     url:'../AutorizarCambioMoneda',
     type: 'GET',
     dataType: 'json',
     data: {usuario:usuario, password: password, moneda:moneda},
     success: function(message){
      if (message.mensaje == 1) {

        $("input[name=dolar]").val(""); 
        $("input[name=boliviano]").val(""); 
        $("input[name=TipoDeCambioCompra]").val(moneda); 
        $('#ModalMoneda').modal('hide');
        toastr.success("TIENE PERMISO");                        
        $('#loading').css('display','none');         
      } else {
        toastr.error("NO TIENE PERMISO");                        
        $('#loading').css('display','none');         
      }
            //toastr.success(message.mensaje);  //asi se optiene cuando se envia algo en ajax           
          },error: function(){
            toastr.error("ERROR");            
            $('#loading').css('display','none');         
          },
        });
  }
}
function cambiarDolar(input){
  dolar=$(input).val();
  boliviano=$('input[name=TipoDeCambioCompra]').val();
  cambioBoliviano=(boliviano*dolar).toFixed(2);
  $('#cambiarDolar').text(cambioBoliviano+" Bs.");
}


function CompletarPago(input,opcion){//esta funcion completa el pago inicial entre el monto del banco con el monto en efectivo 
  tipoPago=$('#tipoPagop');
  pagoInicial=$('input[name=pagoInicial]').val();
  montoBanco=$('input[name=montoBanco]');
  montoEfectivo=$('input[name=montoEfectivo]');
  PrecioContado=$('input[name=PrecioContado]');
  if (tipoPago.prop('checked')) {
   if (pagoInicial!="" ) {

    if (opcion===1) {
      total=pagoInicial-montoBanco.val();
      montoEfectivo.val(total);

    }  
    else{
     total=pagoInicial-montoEfectivo.val();
     montoBanco.val(total);
   }
 }     
 else{
  toastr.error('COLOQUE EL PAGO INICIAL PRIMERAMENTE');
  montoEfectivo.val("");
  montoBanco.val("");
}
}
else{
  if (opcion===1) {
    total=PrecioContado.val()-montoBanco.val();
    montoEfectivo.val(total);

  }  
  else{
   total=PrecioContado.val()-montoEfectivo.val();
   montoBanco.val(total);
 }
}


}

function convertirMoneda(input){
  if ($(input).val()=="BOLIVIANO") {
  //tipo de pago contado
  $('input[name=PrecioLoteBolivano]').attr('type','text');
  $('input[name=PrecioLote]').attr('type','hidden');
  $('input[name=PrecioContadoBolivano]').attr('type','text');
  $('input[name=PrecioContado]').attr('type','hidden');
  $('input[name=PCMR]').attr('type','hidden');
  $('input[name=PCMRBs]').attr('type','text');
  $('input[name=reserva]').attr('type','hidden');
  $('input[name=reservaBolivano]').attr('type','text');
  $('input[name=pagoInicial]').css('display','none');
  $('input[name=pagoInicialBs]').css('display','block');

  $('#tdPrecioLoteTipoPlazo').text($('input[name=PrecioLoteBolivano]').val());
  $('#tdReserva').text($('input[name=reservaBolivano]').val());
  $('#pagoBs').attr("readonly",false);
  $('#pagoUsd').attr("readonly",true);
  $('input[name=totalPagadoBs]').attr('type','text');
  $('input[name=totalPagado]').attr('type','hidden');
  $('input[name=cuotaMensual]').attr('type','hidden');
  $('input[name=cuotaMensualBs]').attr('type','number');
  $('input[name=PrecioPlazo]').attr('type','hidden');
  $('input[name=PrecioPlazoBs]').attr('type','text');

}else{

  //tipo de pago contado
  $('input[name=PrecioLoteBolivano]').attr('type','hidden');
  $('input[name=PrecioLote]').attr('type','text');
  $('input[name=PrecioContadoBolivano]').attr('type','hidden');
  $('input[name=PrecioContado]').attr('type','text');
  $('input[name=PCMR]').attr('type','text');
  $('input[name=PCMRBs]').attr('type','hidden');
  $('input[name=reserva]').attr('type','text');
  $('input[name=reservaBolivano]').attr('type','hidden');
  $('#tdReserva').text($('input[name=reserva]').val());
  $('#pagoBs').attr("readonly",true);
  $('#pagoUsd').attr("readonly",false);
  $('#tdPrecioLoteTipoPlazo').text($('input[name=PrecioLote]').val());
  $('input[name=totalPagadoBs]').attr('type','hidden');
  $('input[name=totalPagado]').attr('type','text');
  $('input[name=pagoInicial]').css('display','block');
  $('input[name=pagoInicialBs]').css('display','none');
  $('input[name=cuotaMensual]').attr('type','number');
  $('input[name=cuotaMensualBs]').attr('type','hidden');
  $('input[name=PrecioPlazo]').attr('type','text');
  $('input[name=PrecioPlazoBs]').attr('type','hidden');
}
}

function pagoBolivanoDolar(input,tipo){//si tipo =0 entonces boliviano, si es =1 dolar
  if (tipo==0) {

    if ($('#tipoPagoc').prop('checked')) {


      valor=$(input).val();
      valorDolar=(valor/tipoDecambioVenta).toFixed(2);
      $('#pagoUsd').val(valorDolar);
      totalPagarContadoBs=$('input[name=PCMRBs]').val();
      totalPagarContadoUsd=$('input[name=PCMR]').val();
      cambioBs=(valor-totalPagarContadoBs).toFixed(2);
      cambioDolar=(valorDolar-totalPagarContadoUsd).toFixed(2);
      $('#spanCambioBs').text(cambioBs);
      $('#spanCambioDolar').text(cambioDolar);
    }else{
      totalPagadoBs=$('input[name=pagoInicialBs]').val();
      totalPagadoUsd=$('input[name=pagoInicial]').val();
      valor=$(input).val();
      valorDolar=(valor/tipoDecambioVenta).toFixed(2);
      $('#pagoUsd').val(valorDolar);
      totalPagarPlazoBs=totalPagadoBs;
      totalPagarPlazoUsd=totalPagadoUsd;
      cambioBs=(valor-totalPagarPlazoBs).toFixed(2);
      cambioDolar=(valorDolar-totalPagarPlazoUsd).toFixed(2);
      $('#spanCambioBs').text(cambioBs);
      $('#spanCambioDolar').text(cambioDolar);
    }
  }else{
   if ($('#tipoPagoc').prop('checked')) {
    valorDolar=$(input).val();
    valor=(valorDolar*tipoDecambioVenta).toFixed(2);
    $('#pagoBs').val(valor);
    totalPagarContadoBs=$('input[name=PCMRBs]').val();
    totalPagarContadoUsd=$('input[name=PCMR]').val();
    cambioBs=(valor-totalPagarContadoBs).toFixed(2);
    cambioDolar=(valorDolar-totalPagarContadoUsd).toFixed(2);
    $('#spanCambioBs').text(cambioBs);
    $('#spanCambioDolar').text(cambioDolar);
  }else{
    totalPagadoBs=$('input[name=pagoInicialBs]').val();
    totalPagadoUsd=$('input[name=pagoInicial]').val();
    valor=$(input).val();
    valorBs=(valor*tipoDecambioVenta).toFixed(2);
    $('#pagoBs').val(valorBs);
    totalPagarPlazoBs=totalPagadoBs;
    totalPagarPlazoUsd=totalPagadoUsd;
    cambioBs=(valorBs-totalPagarPlazoBs).toFixed(2);
    cambioDolar=(valor-totalPagarPlazoUsd).toFixed(2);
    $('#spanCambioBs').text(cambioBs);
    $('#spanCambioDolar').text(cambioDolar);
  }
}
$('input[name=inputCambioUsd]').val($('#spanCambioDolar').text());
$('input[name=inputCambioBs]').val($('#spanCambioBs').text());
}

function validarVenta(){
  ci=$('#ci').val();
  glosa=$('#glosa').val();
  lugarProcedencia=$('input[name=lugarProcedencia]').val();
  nombre=$('input[name=nombre]').val();
  apellidos=$('input[name=apellidos]').val();
  ocupacion=$('input[name=ocupacion]').val();
  domicilio=$('input[name=domicilio]').val();
  celular=$('input[name=celular]').val();
  celular_ref=$('input[name=celular_ref]').val();
  nit=$('input[name=nit]').val();
  fechaNacimiento=$('input[name=fechaNacimiento]').val();
  cambioDolar=parseFloat($('#spanCambioDolar').text());
  var error="";
  if ($('#pagoUsd').val()=="")
  {
   error+="COLOQUE ALGUN VALOR EN EL CAMPO PAGO. \n";

  }
  if (cambioDolar<0)
  {
   error+="EL PAGO TIENE QUE SER MAYOR AL TOTAL A PAGAR \n";

  }
  if (validar('entero',ci) || ci=="0" || ci=="") {
   error+="EL CAMPO CI NO TIENE QUE ESTAR VACIO, NI TAMPOCO TENER CARACTERES DE TIPO LETRA \n";
 }
 if (validar('texto',nombre) || nombre=="") {
   error+="EL CAMPO NOMBRE NO TIENE QUE ESTAR VACIO, NI TAMPOCO TENER CARACTERES DE TIPO NUMERO \n";
 }
 if (validar('texto',apellidos) || nombre=="") {
   error+="EL CAMPO APELLIDOS NO TIENE QUE ESTAR VACIO, NI TAMPOCO TENER CARACTERES DE TIPO NUMERO \n";
 }
 if (validar('texto',ocupacion) || ocupacion=="") {
   error+="EL CAMPO OCUPACION NO TIENE QUE ESTAR VACIO, NI TAMPOCO TENER CARACTERES DE TIPO NUMERO. \n";
 }
 if (validar('entero',celular_ref) && celular_ref!="") {
   error+="EL CAMPO CELULAR REF. NO TIENE QUE TENER CARACTERES TIPO LETRA. \n";
 }
 if (validar('entero',nit) && nit!="") {
   error+="EL CAMPO NIT REF. NO TIENE QUE TENER CARACTERES TIPO LETRA. \n";
 }
 if (domicilio=="") {
   error+="EL CAMPO DOMICILIO NO TIENE QUE ESTAR VACIO. \n";
 }
 if (glosa=="") {
   error+="EL CAMPO DETALLE DE TRANSACCIÓN NO TIENE QUE ESTAR VACIO. \n";

 }
 if (validar('entero',celular) || ci=="") {}
  if (error!="") {
    alert(error);
  }else{
    return true;
  }
  return false;
}