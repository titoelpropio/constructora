 


 function buscarcliente() {

   $("#razonsocial").val("");
var idventa=$('#nit').val();
   var route = "/buscarcliente/"+idventa;
$.get(route, function(res){

     	if(res==0){
  var nombre= $("#razonsocial").val("");
    	}
    $(res).each(function(key,value){

var dato=value.razonSocial;

 

  var nombre= $("#razonsocial").val(value.razonSocial);




    //$("#nit").val(value.NIT);
 
    
    });
  });
}
 
      $("#guardar").click(function(){

var nit=$('#nit').val();
var nombre= $("#razonsocial").val();



  var route = "/buscarcliente/"+nit;
 $.get(route, function(res){

          if(res==0){
 guardarcliente(nit,nombre);
      }else {
   
      }
 });

});

function guardarcliente($nit,$nombre){

 var route = "/agregarcliente/"+$nit+"/"+$nombre;

$.get(route, function(res){

         	if(res==0){
 
    	}else{
 
    	}
 });
 
}