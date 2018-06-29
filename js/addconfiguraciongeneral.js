var checket = 0;
$(document).ready(function () {
       // cargarasiento();
});

$(function () {
    $("#idcheckguardar").hide();
    $("#idcomboxconfiguracion").on('change', function () {
        $("#idcheckguardar").show();
        var modulo = $(this).val();
        // cargar(modulo);
        // cargarasiento();
    });
});
$("#asiento").on('change', function () {
    $("#modalAcceso").openModal({dismissible: false});
/*    
    if ($(this).is(':checked')) {
        // Hacer algo si el checkbox ha sido seleccionado
        checket = 1;
        swal({
                title: "Esta seguro que desea activar la generacion de asientos contables automáticos?",
                text: "Esto afectara a las transacciones de inventario, venta, compra, gastos, Ctas. x pagar y cobrar.",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si, activar!",
                cancelButtonText: "No, cancelar",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function (isConfirm) {
                if (isConfirm) {
                    ajaxStart('Verificando previa configuracion');
                    $.ajax({
                        url: '/verificar_configuracion_cuentas',
                        type: 'post',
                        dataType: 'json',
                        success: function (result) {
                            if (result.success == true) { // Falta configurar algunas cuentas
                                var mensaje = 'La configuracion de estas cuentas esta vacia: *';
                                $.each(result.message, function (i, value) {
                                    mensaje += i + '=> ' + value + '. *';
                                });
                                swal({
                                        title: "Advertencia",
                                        text: mensaje,
                                        type: "warning",
                                        showCancelButton: true,
                                        confirmButtonColor: "#DD6B55",
                                        confirmButtonText: "Activar de todos modos!",
                                        cancelButtonText: "No, cancelar",
                                        closeOnConfirm: false,
                                        closeOnCancel: true
                                    },
                                    function (isConfirm) {
                                        if (isConfirm) {
                                            $.ajax({
                                                url: '/activar_asientos_automaticos',
                                                type: 'post',
                                                data: { opcion: checket },
                                                success: function (result) {
                                                    if (result == true){
                                                        swal('Generacion de Asientos Contables Activados','','success');
                                                    }
                                                }
                                            });
                                        }else{
                                            //$('#asiento').filter(':checkbox').prop('checked',false);
                                            $('#asiento').prop('checked',false)
                                        }
                                    });
                            }
                            ajaxStop();
                        }
                    });
                }else{
                    $('#asiento').prop('checked',false)
                }
            });
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
        checket = 0;
        swal({
                title: "Esta seguro de desactivar los asientos automaticos?",
                text: 'Si ya tiene registros contables puede ocacionar inconcistencia en sus reportes.',
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si, Desactivar!",
                cancelButtonText: "No, cancelar",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/activar_asientos_automaticos',
                        type: 'post',
                        data: { opcion: checket },
                        success: function (result) {
                            if (result == true){
                                swal('Generacion de Asientos Contables Desactivados','','success');
                            }
                        }
                    });
                }else{
                    //$('#asiento').filter(':checkbox').prop('checked',true);
                    $('#asiento').prop('checked',false)
                }
            });
    }*/
});

function cargarasiento() {
    
    var route = "/mostrarcuentasconfiguracioncontable";
    $.get(route, function (res) {
        $(res).each(function (key, value) {

            var idasiento = value.id;
            if (idasiento == 24) {
                if (value.cantidad == 1) {
                    checket = 1;
                    document.getElementById('asiento').checked = true;
                } else {
                    checket = 0;
                    document.getElementById('asiento').checked = false;
                }

            }
        });
    });
}
function cargar(modulo) {

    document.getElementById('test1').checked = false;
    document.getElementById('test2').checked = false;
    document.getElementById('test3').checked = false;
    document.getElementById('test4').checked = false;
    document.getElementById('test5').checked = false;
    var route = "/obtenerModulo/" + modulo;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            var cantidad = value.cantidad;
            chek(cantidad);
        });
    });
}

function  chek(cantidad) {

    if (cantidad == "20") {
        document.getElementById('test1').checked = true;
        return;
    }
    if (cantidad == "40") {
        document.getElementById('test2').checked = true;
        return;
    }
    if (cantidad == "60") {
        document.getElementById('test3').checked = true;
        return;
    }
    if (cantidad == "80") {
        document.getElementById('test4').checked = true;
        return;
    }
    if (cantidad == "100") {
        document.getElementById('test5').checked = true;
    }

}


$("#idcheckguardarr").click(function () {

    var value;
    guardarCuentaAjusteinven(24,checket);

    var modulo = $("#idcomboxconfiguracion").val();

    var route = "obtenerModulo/" + modulo;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            var valcheck;
            if (document.getElementById('test1').checked) {

                valcheck = $("#test1").val();

            }
            if (document.getElementById('test2').checked) {

                valcheck = $("#test2").val();

            }
            if (document.getElementById('test3').checked) {

                valcheck = $("#test3").val();

            }
            if (document.getElementById('test4').checked) {

                valcheck = $("#test4").val();

            }
            if (document.getElementById('test5').checked) {

                valcheck = $("#test5").val();

            }
            if (valcheck == null) {
                return;
            }
            
            var route = "updateModulo/" + modulo;
            var token = $("#token").val();
            $.ajax({
                url: route,
                headers: {'X-CSRF-TOKEN': token},
                type: 'PUT',
                dataType: 'json',
                data: {
                    cantidad: valcheck
                },
                success: function () {
                    cargar(modulo);
                    
                    swal({title: "se modifico",
                        type: "success",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1000});
                },
                error: function () {
                    swal({title: "ERROR AL modificar",
                        type: "error",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1000});
                }

            });
            return;
        });
    });
});


function guardarCuentaAjusteinven(i, value)
{


    var route = "/updateconfdash/" + i + "/" + value;
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'PUT',
        dataType: 'json',
        data: {},
        success: function () {
            swal({title: "BIEN :)",
                text: "Cantidad actualizada exitosamente",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        },
        error: function () {
            swal({title: "ERROR :(",
                text: "Error al actualizar la cantidad",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });

}







