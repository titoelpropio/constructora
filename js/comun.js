$(document).ready(function () {
   /* $('#salir_cerrar').click(function () {
        window.location.href = '/logout';
    });*/


    $('#salir_cerrar').click(function () {
        window.location.href = '/logout';


        //$("#modalCierreCaja").modal('open'); //ESTO ABRIA EL MODAL PARA SELECCIONAR A LO EMPLEADOSS


        /*var puede_abrir_caja = $('#puede_abrir_caja').val();
        if (puede_abrir_caja == 1){
            swal({
                    title: "Esta seguro que desea salir del sistema?",
                    text: '<select id="btnCancelar" ><option>1111</option></select>',
                    //text: "Su usuario tiene habilitado el cierre de caja, su caja sera cerrada.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Si, salir y cerrar caja",
                    cancelButtonText: "No, cancelar",
                    closeOnConfirm: false,
                    closeOnCancel: true,
                    html:true,
                },
                function (isConfirm) {
                    if (isConfirm) {
                        window.open('/logout');
                        window.location.href = '/logout';
                    } 
                    //else {//ESTO YA ESTABA BLOQUEADO NO SIRVE
           //  swal("Cancelado", "Accion cancelada.", "error");
            // }
            });
        }else{
            window.location.href = '/logout';
        }*/
    });


    $('#valor_factura').click(function () {
        if ($(this).is(':checked')) {
            var monto_factura = parseFloat($('#monto_factura').val());
            var credito_fiscal = monto_factura * 0.13;
            $('#credito_fiscal').val(credito_fiscal.toFixed(2));
        } else {
            $('#credito_fiscal').val('0.00');
        }
    });

    $("input[type=text]"). focus(function(){
        this.select();
    });

    $("input[type=number]"). focus(function(){
        this.select();
    });

    $("#cuenta_contable").on('input', function () {
        var val = this.value;
        if ($('#listado_cuentas_contables').find('option').filter(function () {
                return this.value.toUpperCase() === val.toUpperCase();
            }).length) {
            var data = $("#listado_cuentas_contables option[value='" + $('#cuenta_contable').val() + "']").attr('data-id');
        }
        $('#cuenta_id').val(data);
    });
});


var userCierreCaja=[];

function agregarCierreCaja(id) {
    if (document.getElementById("check"+id).checked == true) { //si esta tikeado e agrega a un array
        userCierreCaja.push(id);  //agregar a un array un elemento          
        //console.log(userCierreCaja);
    } else {
        pos = userCierreCaja.indexOf(id); //econtrar posicion de un array
        userCierreCaja.splice(pos, 1); //Eliminar elemento de un array dada una pasicion
       // console.log(userCierreCaja);
    }
}

$('#Cerrar_Caja').click(function () {
    var puede_abrir_caja = $('#puede_abrir_caja').val();
    if (puede_abrir_caja == 1){
        var formData = '&idUsuarioCC='+userCierreCaja + '&cantidadCC='+userCierreCaja.length;
        $.ajax({
            url: "/logout",
            type: "GET",
            data: formData,
            dataType: 'json',

            success: function (mensaje) {
                window.open('/imprimirrecibocierre/'+mensaje.idEgreso);
                window.location.href = '/logout';
            },
            error: function () {
                swal({
                    title: "ERROR ",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000
                });
            }
        });
    }else{
        window.location.href = '/logout';
    }
});


// Funcion generica para el registro de formularios
function registro_abm(frm, data, table) {
    ajaxStart('Guardando el registro, por favor espere');
    $.ajax({
        url: $(frm).attr('action'),
        type: $(frm).attr('method'),
        data: data,
        dataType: 'json',
        success: function (respuesta) {
            if (respuesta.success == true) {
                swal('Registro Guardado', 'Los datos ingresados se guardaron correctamente', 'success');
                frm[0].reset();
                if (table != null) {
                    table.DataTable().ajax.reload();
                }
            } else {
                $('.error').remove();
                if (respuesta.message != null) {
                    // $.each(respuesta.messages, function (key, value) {
                    //     // Usá la versión 2.x de jquery
                    //     var element = $('#' + key);
                    //     element.closest('input .form-control').find('.error').remove();
                    //     element.after(value);
                    // });
                    swal('Error', respuesta.message, 'error');
                } else {
                    swal('Error', 'Error al registrar los datos.', 'error');
                }
            }
            ajaxStop();
        },
        error: function (result) {
            swal('Error', 'Surgio un problema al guardar el registro', 'error');
            console.log(result);
            ajaxStop();
        }
    });
}


// Obtiene el id de la tabla cargado con el datatable y usando el redirect de jquery
// evitando que se muestre el id en la url
function edit_registrer(seleccionado, route) {
    $.redirect(route, { id: data['id'] }, 'POST', '_self');
}


function delete_registrer(seleccionado, route, tabla) {
    var table = $(seleccionado).closest('table').DataTable();
    var current_row = $(seleccionado).parents('tr');
    if (current_row.hasClass('child')) {
        current_row = current_row.prev();
    }
    var data = table.row(current_row).data();
    var id  = data['id'];
    swal({
            title: "Esta seguro que desea eliminar este registro?",
            text: "El estado del registro cambiara",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Si, eliminar registro!",
            cancelButtonText: "No, cancelar",
            closeOnConfirm: false,
            closeOnCancel: true
        },
        function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    url: route,
                    type: 'post',
                    data: 'id='+id,
                    dataType: 'json',
                    success: function (respuesta) {
                        if (respuesta == true) {
                            swal("Eliminado!", "El registro ha sido eliminado.", "success");
                            table.ajax.reload();
                        } else {
                            swal("Error", "Problemas al eliminar", "error");
                        }
                    }
                });
            } /*else {
             swal("Cancelado", "Accion cancelada.", "error");
             }*/
        });
}


function calculadora_bimoneda(tipo_cambio,bimoneda, moneda_id, monto) {
    var totales = new Array();
    totales['bolivianos'] = 0;
    totales['dolares']= 0;

    if (bimoneda == 1) {
        if (moneda_id == 1) {    //Bolivianos
            totales['bolivianos']  = monto;
            totales['dolares']     = monto / tipo_cambio;
        }
        if (moneda_id == 2) {
            totales['dolares']     = monto;
            totales['bolivianos']  = monto * tipo_cambio;
        }
    } else {
        if (moneda_id == 1) {    //Bolivianos
            totales['bolivianos'] = monto;
        }
        if (moneda_id == 2) {
            totales['dolares'] = monto;
        }
    }
    return totales;
}

function NumCheck(e, field) {
    key = e.keyCode ? e.keyCode : e.which
    // backspace
    if (key == 8)
        return true
    // 0-9
    if (key > 47 && key < 58) {
        if (field.value == "")
            return true
        regexp = /.[0-9]{4}$/
        return !(regexp.test(field.value))
    }
    // .
    if (key == 46) {
        if (field.value == "")
            return false
        regexp = /^[0-9]+$/
        return regexp.test(field.value)
    }
    // other key
    return false

}

function ajaxStart(text)
{
    if(jQuery('body').find('#resultLoading').attr('id') != 'resultLoading'){
        jQuery('body').append('<div id="resultLoading" style="display:none"><div><i class="fa fa-cog fa-spin fa-4x fa-fw"></i><div>' + text + '</div></div><div class="bg"></div></div>');
    }

    jQuery('#resultLoading').css({
        'width':'100%',
        'height':'100%',
        'position':'fixed',
        'z-index':'10000000',
        'top':'0',
        'left':'0',
        'right':'0',
        'bottom':'0',
        'margin':'auto'
    });

    jQuery('#resultLoading .bg').css({
        'background':'#000000',
        'opacity':'0.7',
        'width':'100%',
        'height':'100%',
        'position':'absolute',
        'top':'0'
    });

    jQuery('#resultLoading>div:first').css({
        'width': '250px',
        'height':'75px',
        'text-align': 'center',
        'position': 'fixed',
        'top':'0',
        'left':'0',
        'right':'0',
        'bottom':'0',
        'margin':'auto',
        'font-size':'16px',
        'z-index':'10',
        'color':'#ffffff'

    });

    jQuery('#resultLoading .bg').height('100%');
    jQuery('#resultLoading').fadeIn(300);
    jQuery('body').css('cursor', 'wait');
}

function ajaxStop()
{
    jQuery('#resultLoading .bg').height('100%');
    jQuery('#resultLoading').fadeOut(300);
    jQuery('body').css('cursor', 'default');
}
