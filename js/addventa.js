var iddelpuntoventa;
var iddelempleado;
var idprodu = 0;
var idventas = 0;
var idproductos = 0;
var totalfactura = 0;
var totalConDescuento = 0;
var idCliente = 3;
var descuentoTotal;
var bolivianos1;
var descuent;
var tipodeventa;
var bandera;
var idMoneda;
var idListaPrecioVenta;
var cargarfac;
$(document).ready(function () {
    $('#btnradiodesplegar').click();
$('#modal2').modal({dismissible: false});
$('#modal3').modal({dismissible: false});
$('#modal4').modal({dismissible: false});
$('#modal5').modal({dismissible: false});
$('.modal').modal({dismissible: false});
    var multiLista = $("#multiLista").val();
    if (multiLista == 1) {
        idListaPrecioVenta = $("#idListaPrecioVenta").val();
        $("#idListaPrecio").val(idListaPrecioVenta);
        $('#idListaPrecio option:selected').val(idListaPrecioVenta);
        $("#idListaPrecio").material_select();
    }

    //MIGUEL NUEVO LINEA 31 Y 34
    var idmoned = $("#idMoneda").val();
    if (idmoned == 1) {
        $("#letraMoneda").text("Bs.");
        $("#money5").text("Bs.s");
    } else {
        $("#letraMoneda").text("Sus.");
        $("#money5").text("Sus.");
    }

    tipodeventa = "Contado";
    $('#codigoInterno').keypress(function (e) {
        if (e.which == 13) {
            buscarproductoinput();
        }
    });
    $('#nombreproducto').keypress(function (e) {
        if (e.which == 13) {
            buscarproductoinput();
        }
    });
    $('#codigoBarra').keypress(function (e) {
        if (e.which == 13) {
            codigobarraagregardetalle();
        }
    });
    $("#porcentajepago").ionRangeSlider({
        grid: true,
        min: 0,
        max: 100,
        from: 0,
        grid_num: 10,
        onFinish: function (data) {
            calcularpagoinicial(data.from);
        }
    });
    iddelpuntoventa = $('#iddelpuntoventa').val();
    iddelempleado = $('#iddelempleado').val();
    Cargartabla();
    cargardescuento();
    // cargarMoneda();
    // cargaralmacendesucursal();
//    bandera = 0;
    $(function () {

        $("#cliNombre").on('input', function () {
            cargarfac = true;
            var val = this.value;
            if ($('#clienteslist').find('option').filter(function () {
                    return this.value.toUpperCase() === val.toUpperCase();
                }).length) {
                var abc = $("#clienteslist option[value='" + $('#cliNombre').val() + "']").attr('data-id');
                var multiLista = $("#multiLista").val();
                if (multiLista == 0) {
                } else {
                    $('#idListaPrecio')
                        .find('option')
                        .remove()
                        .end();
                    ;
                    $('#idListaPrecio').material_select();

                    var route = "/listaPrecioCliente/" + abc;
                    var bandera = true;
                    var entroForeach = false;

                    $.get(route, function (res) {
                        $(res).each(function (key, value) {
                            cargarfac = false;
                            entroForeach = true;
                            if (bandera == true) {
                                bandera = false;
                                $("#nombreListaPrecio").text("LISTA DE PRECIO DEL CLIENTE");
                                $('#idListaPrecio').append('<option value=' + value.idListaPrecio + ' >' + value.nombreLista + '</option>');
                                $('#idListaPrecio').material_select();
                                if (value.idmoneda == 1) {
                                    $("#letraMoneda").text("Bs.");
                                } else {
                                    $("#letraMoneda").text("Sus.");
                                }
                                //==================================================
                                var idventa = $('#venta').val();
                                var route = "/idmonedaListaPrecio/";

                                var token = $("#token").val();
                                $.ajax({
                                    url: route,
                                    headers: {'X-CSRF-TOKEN': token},
                                    type: 'GET',
                                    dataType: 'json',
                                    data: {
                                        idListaPrecio: value.idListaPrecio,
                                        idventa: idventa
                                    },
                                    success: function (data) {
                                        var mens = data.mensaje;
                                        if (mens == "mismo") {
                                            // swal({
                                            //     title: "ES LA MISLA LISTA DE PRECIO!",
                                            //     type: "warning",
                                            //     showConfirmButton: false,
                                            //     closeOnConfirm: false,
                                            //     timer: 1000
                                            // });
                                            // return;
                                        }
                                        $(data).each(function (key, value) {
                                            var idmoneda = value.idmoneda;
                                            if (idmoneda == 1) {
                                                $("#letraMoneda").text("Bs.");
                                            } else {
                                                $("#letraMoneda").text("Sus.");
                                            }
                                        });
                                        Cargartabla();
                                        swal({
                                            title: "ACTUALIZADO CORRECTAMENTE",
                                            type: "success",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 1000
                                        });

                                    },
                                    error: function () {
                                        swal({
                                            title: "ERROR AL ACTUALIZAR",
                                            type: "error",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 1000
                                        });
                                    }
                                });
                                //==================================================


                            } else {
                                $('#idListaPrecio').append('<option value=' + value.idListaPrecio + ' >' + value.nombreLista + '</option>');
                                $('#idListaPrecio').material_select();

                            }

                        });

                        if (entroForeach == false) {//No entro al foreach xq esta vacio, asi que listo el primero de la lista de la configuracio seleccionado y despues los demas
                            //AQUI DEBO DE COLOCAR LA LISTA DE PRECIO CON LA QUE ESTA SELECCIONADO!
                            var bandera2 = true;
                            //////////////////////////////////////////////////
                            var route = "/listarprecioConfiguracion/";
                            $.get(route, function (res) {
                                $(res).each(function (key, value) {
                                    cargarfac = false;
                                    if (bandera2 == true) {
                                        bandera2 = false;
                                        $("#nombreListaPrecio").text("SELECCIONE UNA LISTA DE PRECIO DE LA CONFIGURACION");
                                        //=======================================================
                                        $('#idListaPrecio').append('<option value=' + value.idLista + ' >' + value.nombre + '</option>');
                                        $('#idListaPrecio').material_select();
                                        if (value.idMoneda == 1) {
                                            $("#letraMoneda").text("Bs.");
                                        } else {
                                            $("#letraMoneda").text("Sus.");
                                        }
                                        //==================================================
                                        var idventa = $('#venta').val();
                                        var route = "/idmonedaListaPrecio/";

                                        var token = $("#token").val();
                                        $.ajax({
                                            url: route,
                                            headers: {'X-CSRF-TOKEN': token},
                                            type: 'GET',
                                            dataType: 'json',
                                            data: {
                                                idListaPrecio: value.idLista,
                                                idventa: idventa
                                            },
                                            success: function (data) {
                                                var mens = data.mensaje;
                                                if (mens == "mismo") {
                                                    // swal({
                                                    //     title: "ES LA MISLA LISTA DE PRECIO!",
                                                    //     type: "warning",
                                                    //     showConfirmButton: false,
                                                    //     closeOnConfirm: false,
                                                    //     timer: 1000
                                                    // });
                                                    // return;
                                                }
                                                $(data).each(function (key, value) {
                                                    var idmoneda = value.idmoneda;
                                                    if (idmoneda == 1) {
                                                        $("#letraMoneda").text("Bs.");
                                                    } else {
                                                        $("#letraMoneda").text("Sus.");
                                                    }
                                                });
                                                Cargartabla();
                                                swal({
                                                    title: "ACTUALIZADO CORRECTAMENTE",
                                                    type: "success",
                                                    showConfirmButton: false,
                                                    closeOnConfirm: false,
                                                    timer: 1000
                                                });

                                            },
                                            error: function () {
                                                swal({
                                                    title: "ERROR AL ACTUALIZAR",
                                                    type: "error",
                                                    showConfirmButton: false,
                                                    closeOnConfirm: false,
                                                    timer: 1000
                                                });
                                            }
                                        });
                                        //=======================================================


                                    } else {
                                        $('#idListaPrecio').append('<option value=' + value.idLista + ' >' + value.nombre + '</option>');
                                        $('#idListaPrecio').material_select();
                                    }

                                });

                            });
                            //////////////////////////////////////////////////////


                        }


                    });


                }


                inputcargar(abc);
                $("#idCliente").val(abc);
                var route = "/nitrazoncliente/" + abc;
                $.get(route, function (res) {
                    $(res).each(function (key, value) {
                        $("#cliNombre2").val(value.nombre);
                        $("#nit").val(value.nit);
                        $("#razonsocial").val(value.razonSocial);
                    });
                });
            }


        });


        $("#cliNombre2").on('input', function () {

            cargarfac = true;
            var val = this.value;
            if ($('#clienteslist2').find('option').filter(function () {
                    return this.value.toUpperCase() === val.toUpperCase();
                }).length) {
                var abc = $("#clienteslist2 option[value='" + $('#cliNombre2').val() + "']").attr('data-id');
                inputcargar(abc);
                $("#idCliente").val(abc);
                var route = "/nitrazoncliente/" + abc;
                $.get(route, function (res) {
                    $(res).each(function (key, value) {

                        $("#nit").val(value.nit);
                        $("#razonsocial").val(value.razonSocial);


                    });
                });

            }
        });
    });
});
$(".group1").click(function (evento) {
    var val = $(this).val();
    if (val == "contado") {
        $("#pagoEfectivo").attr("style", "display :block;");
        $("#pagoCredito").attr("style", "display:none;");
        $("#pagoTarjeta").attr("style", "display:none;");
        $("#pagoDeposito").attr("style", "display:none;");
        $("#pagoCheque").attr("style", "display:none;");
    } else if (val == "credito") {
        $("#pagoEfectivo").attr("style", "display:none;");
        $("#pagoCredito").attr("style", "display :block;");
        $("#pagoTarjeta").attr("style", "display:none;");
        $("#pagoDeposito").attr("style", "display:none;");
        $("#pagoCheque").attr("style", "display:none;");
    } else if (val == "tarjeta") {
        $("#pagoEfectivo").attr("style", "display:none;");
        $("#pagoCredito").attr("style", "display:none;");
        $("#pagoTarjeta").attr("style", "display:block;");
        $("#pagoDeposito").attr("style", "display:none;");
        $("#pagoCheque").attr("style", "display:none;");
    } else if (val == "deposito") {
        $("#pagoEfectivo").attr("style", "display:none;");
        $("#pagoCredito").attr("style", "display:none;");
        $("#pagoTarjeta").attr("style", "display:none;");
        $("#pagoDeposito").attr("style", "display:block;");
        $("#pagoCheque").attr("style", "display:none;");
    } else {
        $("#pagoEfectivo").attr("style", "display:none;");
        $("#pagoCredito").attr("style", "display:none;");
        $("#pagoTarjeta").attr("style", "display:none;");
        $("#pagoDeposito").attr("style", "display:none;");
        $("#pagoCheque").attr("style", "display:block;");
    }
});
$(".des").click(function (evento) {
    //MIGUEL NUEVO LINEA 367
    cargarfactura2();
    calcular_Banco_Bs();
    calcular_Banco_Sus();
    var val = $(this).val();
    if (val == "1") {
        $("#descuentoPor").attr("style", "display :block;");
        $("#descuentoImpor").attr("style", "display:none;");

    } else if (val == "2") {
        $("#descuentoPor").attr("style", "display:none;");
        $("#descuentoImpor").attr("style", "display :block;");
    }
});
$(".efec").click(function (evento) {
    var bs = document.getElementById('bs').checked;
    var sus = document.getElementById('sus').checked;
    if (bs === true) {
        $("#pago").val("");
        $("#cambio").val("0");
    } else if (sus === true) {
        $("#cambio").val("0");
        $("#pago").val("");
    }
});
$(".group2").click(function (evento) {
    var val = $(this).val();
    if (val == "noenvio") {
        $("#pagoEnvio").attr("style", "display :block;");
    } else {
        $("#pagoEnvio").attr("style", "display:none;");
    }
});

$(".grupoFF").click(function (evento) {
    var val = $(this).val();
    if (val == "contado") {
        $("#fomasPagos").attr("style", "display :block;");
        $("#pagoCredito").attr("style", "display:none;");
    }

    if (val == "tarjeta") {

        $("#fomasPagos").attr("style", "display:none;");
        $("#pagoCredito").attr("style", "display:block;");

    }
});

$("#almacen").change(function () {
    var idalamcennew = $(this).val();
    var idventa = $('#venta').val();
    var route = "/actualizaralmacenventa/" + idventa + "/" + idalamcennew;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $("#almacen").val(idalamcennew);
            $('#resultadoprodcuto').empty();
            $('#datos').empty();
            $("#total").text("0");
        });
    });
});
$("select#tipoventa").change(function () {
    var tipo = $(this).val();
    tipodeventa = tipo;
    $('#resultadoprodcuto').empty();
});

//function cambioCliente() {
//
//    var idventa = $('#venta').val();
//
//    var route = "/limpiarDetalle";
//    var token = $("#token").val();
//    $.ajax({
//        url: route,
//        headers: {'X-CSRF-TOKEN': token},
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            idventa: idventa
//        },
//        success: function (data) {
//            Materialize.toast('Lipiado!!', 1000, 'rounded');
//            Cargartabla();
//        },
//        error: function () {
//            Materialize.toast('Error al Limpiar!!', 2000, 'rounded');
//        }
//    });
//
//}


$('#idListaPrecio').on('change', function () {

    var selectVal = $("#idListaPrecio option:selected").val();
    var idventa = $('#venta').val();
    var route = "/idmonedaListaPrecio/";
    $('#resultadoprodcuto').empty();
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'GET',
        dataType: 'json',
        data: {
            idListaPrecio: selectVal,
            idventa: idventa
        },
        success: function (data) {
            var mens = data.mensaje;
            if (mens == "mismo") {
                // swal({title: "ES LA MISLA LISTA DE PRECIO",
                //     type: "warning",
                //     showConfirmButton: false,
                //     closeOnConfirm: false,
                //     timer: 1000});
                // return;
            }
            $(data).each(function (key, value) {
                var idmoneda = value.idmoneda;
                if (idmoneda == 1) {
                    $("#idMoneda").val(1);
                    $("#letraMoneda").text("Bs.");
                } else {
                    $("#idMoneda").val(2);
                    $("#letraMoneda").text("Sus.");
                }
            });
            Cargartabla();
            swal({title: "ACTUALIZADO CORRECTAMENTE",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});

        },
        error: function () {
            swal({title: "ERROR AL ACTUALIZAR",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });

});

function calcularpagoinicial(por) {
    var idmoneda = $("#idMoneda").val();
    if (idmoneda == 1) {
        var totalfactura = parseFloat($("#saldoCreditoBs").text()).toFixed(2);
    } else {
        var totalfactura = parseFloat($("#saldoCreditoSus").text()).toFixed(2);
    }
//    var totalfactura = parseFloat($("#totalacobrarcondescuentoenlaventa").text()).toFixed(2);
    por = parseFloat(por).toFixed(2);
    var porcentaje = (totalfactura * por) / 100;
    porcentaje = porcentaje.toFixed(2);
    var saldo = totalfactura - porcentaje;
    saldo = saldo.toFixed(2)
    $("#aCuenta").val(porcentaje);
    $("#saldo").val(saldo);
}

function calcularporcentaje() {
    calcular_totalCredito();
    var acuenta = $("#aCuenta").val();
    acuenta = parseFloat(acuenta).toFixed(2);
    var totalfactura = parseFloat($("#saldoCredito").text()).toFixed(2);
    var porcentaje = (acuenta * 100) / totalfactura;
    porcentaje = parseInt(porcentaje);
    var slider = $("#porcentajepago").data("ionRangeSlider");
    // slider.update({
    //     min: 0,
    //     max: 100,
    //     from: porcentaje
    // });
}

/*
 * Metodo para cargar los clientes en el data list al momento de seleccionar el
 *  campo de texto para realizar la busqueda
 * @returns {undefined}
 */
function cargarcliente() {
    $('#clienteslist')
        .find('option')
        .remove()
        .end();
    var route = "/listarcliente/";
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $('#clienteslist').append('<option data-id=' + value.id + ' value="' + value.nombre + '"> NIT:' + value.NIT);
        });
    });
}


function calcular_BsCOMBO() {
    var importeAPagar = $('#totalacobrarcondescuentoenlaventa').text();
    var idmoneda = $('#idMoneda').val();
    $("#aCuenta").val(0);

    var tipoCambio = $('#TCV').text();
    var efectivoBs = $('#calculoEfectivoBs').val();
    var efectivoSus = $('#calculoEfectivoSus').val();
    var dBancoBs = $('#dBancoBs').val();
    var dBancoSus = $('#dBancoSus').val();
    var chequeBs = $('#chequeBs').val();
    var chequeSus = $('#chequeSus').val();
    var tDebitoBs = $('#tDebitoBs').val();
    var tDebitoSus = $('#tDebitoSus').val();
    var tCreditoBs = $('#tCreditoBs').val();
    var tCreditoSus = $('#tCreditoSus').val();



    if (isNaN(efectivoBs) || efectivoBs == 0 || typeof efectivoBs == "undefined") {
        efectivoBs = 0;
    }

    if (isNaN(efectivoSus) || efectivoSus == 0 || typeof efectivoSus == "undefined") {
        efectivoSus = 0;
    }

    if (isNaN(dBancoBs) || dBancoBs == 0 || typeof dBancoBs == "undefined") {
        dBancoBs = 0;
    }

    if (isNaN(dBancoSus) || dBancoSus == 0 || typeof dBancoSus == "undefined") {
        dBancoSus = 0;
    }

    if (isNaN(chequeBs) || chequeBs == 0 || typeof chequeBs == "undefined") {
        chequeBs = 0;
    }

    if (isNaN(chequeSus) || chequeSus == 0 || typeof chequeSus == "undefined") {
        chequeSus = 0;
    }

    if (isNaN(tDebitoBs) || tDebitoBs == 0 || typeof tDebitoBs == "undefined") {
        tDebitoBs = 0;
    }

    if (isNaN(tDebitoSus) || tDebitoSus == 0 || typeof tDebitoSus == "undefined") {
        tDebitoSus = 0;
    }

    if (isNaN(tCreditoBs) || tCreditoBs == 0 || typeof tCreditoBs == "undefined") {
        tCreditoBs = 0;
    }

    if (isNaN(tCreditoSus) || tCreditoSus == 0 || typeof tCreditoSus == "undefined") {
        tCreditoSus = 0;
    }


    if (idmoneda == 1) { //Bs


        efectivoSus = parseFloat(efectivoSus) * tipoCambio;
        dBancoSus = parseFloat(dBancoSus) * tipoCambio;
        chequeSus = parseFloat(chequeSus) * tipoCambio;
        tDebitoSus = parseFloat(tDebitoSus) * tipoCambio;
        tCreditoSus = parseFloat(tCreditoSus) * tipoCambio;

        dBancoBs = parseFloat(dBancoBs);
        chequeBs = parseFloat(chequeBs);
        tDebitoBs = parseFloat(tDebitoBs);
        tCreditoBs = parseFloat(tCreditoBs);


        var importe_total = 0;
        var saldoCredito = parseFloat(importeAPagar);
        importe_total = parseFloat(saldoCredito) - efectivoBs - efectivoSus - dBancoSus - chequeSus - tDebitoSus - tCreditoSus - dBancoBs - chequeBs - tDebitoBs - tCreditoBs;


        if (isNaN(importe_total)) {
            $('#saldoCredito').text(importe_total);
        }

        if (importe_total == 0 || importe_total == 0.00) {

            $('#saldoCreditoBs').text("0");
            $('#saldoCreditoSus').text("0");

            $("#cambioBs").text("0");
            $("#cambioSus").text("0");
            $("#efectivoBs").val(efectivoBs);

            $("#saldo").val(0); //DEL CREDITO!!

//            $("#calculoEfectivoSus").attr('disabled', 'disabled');



            //            $("#efectivoBs").attr('disabled', 'disabled');
//            $("#efectivoSus").attr('disabled', 'disabled');
            $("#dBancoBs").attr('disabled', 'disabled');
            $("#dBancoSus").attr('disabled', 'disabled');
            $("#chequeBs").attr('disabled', 'disabled');
            $("#chequeSus").attr('disabled', 'disabled');
            $("#tDebitoBs").attr('disabled', 'disabled');
            $("#tDebitoSus").attr('disabled', 'disabled');
            $("#tCreditoBs").attr('disabled', 'disabled');
            $("#tCreditoSus").attr('disabled', 'disabled');

//            $("#efectivoBs").attr("style", "color :black;");
//            $("#efectivoSus").attr("style", "color :black;");
            $("#dBancoBs").attr("style", "color :black;");
            $("#dBancoSus").attr("style", "color :black;");
            $("#chequeBs").attr("style", "color :black;");
            $("#chequeSus").attr("style", "color :black;");
            $("#tDebitoBs").attr("style", "color :black;");
            $("#tDebitoSus").attr("style", "color :black;");
            $("#tCreditoBs").attr("style", "color :black;");
            $("#tCreditoSus").attr("style", "color :black;");


        } else {
            if (importe_total < 0) {
                var cambio = importe_total * (-1);
                var saldoEfectivo = parseFloat(efectivoBs) - parseFloat(cambio);
                $("#cambioBs").text(cambio.toFixed(2));
                var convertirdeBsASusCambio = cambio / tipoCambio;
                $("#cambioSus").text(convertirdeBsASusCambio.toFixed(2));


                $('#saldoCreditoBs').text("0");
                $('#saldoCreditoSus').text("0");
                $("#efectivoBs").val(parseFloat(saldoEfectivo).toFixed(2));
                if ($("#calculoEfectivoBs").val() == "" || $("#calculoEfectivoBs").val() == 0) {
                    $("#efectivoBs").val(0);
                }


                $("#saldo").val(0);     //DEL CREDITO!!

//                $("#calculoEfectivoSus").attr('disabled', 'disabled');

//                $("#efectivoBs").attr('disabled', 'disabled');
                $("#efectivoSus").attr('disabled', 'disabled');


                //                    $("#efectivoBs").attr('disabled', 'disabled');
//                    $("#efectivoSus").attr('disabled', 'disabled');
                $("#dBancoBs").attr('disabled', 'disabled');
                $("#dBancoSus").attr('disabled', 'disabled');
                $("#chequeBs").attr('disabled', 'disabled');
                $("#chequeSus").attr('disabled', 'disabled');
                $("#tDebitoBs").attr('disabled', 'disabled');
                $("#tDebitoSus").attr('disabled', 'disabled');
                $("#tCreditoBs").attr('disabled', 'disabled');
                $("#tCreditoSus").attr('disabled', 'disabled');

//                    $("#efectivoBs").attr("style", "color :black;");
//                    $("#efectivoSus").attr("style", "color :black;");
                $("#dBancoBs").attr("style", "color :black;");
                $("#dBancoSus").attr("style", "color :black;");
                $("#chequeBs").attr("style", "color :black;");
                $("#chequeSus").attr("style", "color :black;");
                $("#tDebitoBs").attr("style", "color :black;");
                $("#tDebitoSus").attr("style", "color :black;");
                $("#tCreditoBs").attr("style", "color :black;");
                $("#tCreditoSus").attr("style", "color :black;");


            } else {

                $("#saldoCreditoBs").text(importe_total.toFixed(2));
                var convertirSaldoCreditoBsASus = importe_total / tipoCambio;
                $("#saldoCreditoSus").text(convertirSaldoCreditoBsASus.toFixed(2));

                $("#cambioBs").text("0");
                $("#cambioSus").text("0");

                $("#efectivoBs").val(parseFloat(efectivoBs).toFixed(2));

                $("#saldo").val(parseFloat(importe_total).toFixed(2)); //DEL CREIDTO!!


//                $("#calculoEfectivoSus").removeAttr('disabled');


//                    $("#efectivoBs").removeAttr('disabled');
//                    $("#efectivoSus").removeAttr('disabled');
                $("#dBancoBs").removeAttr('disabled');
                $("#dBancoSus").removeAttr('disabled');
                $("#chequeBs").removeAttr('disabled');
                $("#chequeSus").removeAttr('disabled');
                $("#tDebitoBs").removeAttr('disabled');
                $("#tDebitoSus").removeAttr('disabled');
                $("#tCreditoBs").removeAttr('disabled');
                $("#tCreditoSus").removeAttr('disabled');

//                    $("#efectivoBs").removeAttr("style");
//                    $("#efectivoSus").removeAttr("style");
                $("#dBancoBs").removeAttr("style");
                $("#dBancoSus").removeAttr("style");
                $("#chequeBs").removeAttr("style");
                $("#chequeSus").removeAttr("style");
                $("#tDebitoBs").removeAttr("style");
                $("#tDebitoSus").removeAttr("style");
                $("#tCreditoBs").removeAttr("style");
                $("#tCreditoSus").removeAttr("style");


            }
        }

    } else {

        efectivoBs = parseFloat(efectivoBs) / tipoCambio;
        dBancoBs = parseFloat(dBancoBs) / tipoCambio;
        chequeBs = parseFloat(chequeBs) / tipoCambio;
        tDebitoBs = parseFloat(tDebitoBs) / tipoCambio;
        tCreditoBs = parseFloat(tCreditoBs) / tipoCambio;

        efectivoSus = parseFloat(efectivoSus);
        dBancoSus = parseFloat(dBancoSus);
        chequeSus = parseFloat(chequeSus);
        tDebitoSus = parseFloat(tDebitoSus);
        tCreditoSus = parseFloat(tCreditoSus);


        var importe_total = 0;
//        var conversion = parseFloat(efectivoBs);
//        var tipoCV = parseFloat(tipoCambio);
//        var entradavalor = efectivoBs / tipoCambio;
        var saldoCredito = parseFloat(importeAPagar);

        importe_total = parseFloat(saldoCredito) - efectivoBs - efectivoSus - dBancoSus - chequeSus - tDebitoSus - tCreditoSus - dBancoBs - chequeBs - tDebitoBs - tCreditoBs;


        if (importe_total == 0 || importe_total == 0.00) {
            $('#saldoCreditoBs').text("0");
            $('#saldoCreditoSus').text("0");


            $("#cambioBs").text(0);
            $("#cambioSus").text(0);
            var convertirBs_SaldoEfectivo = efectivoBs * tipoCambio;

            $("#efectivoBs").val(convertirBs_SaldoEfectivo.toFixed(2));

            $("#saldo").val(0); //DEL CREDITO!!


//            $("#calculoEfectivoSus").attr('disabled', 'disabled');



            //            $("#efectivoBs").attr('disabled', 'disabled');
//            $("#efectivoSus").attr('disabled', 'disabled');
            $("#dBancoBs").attr('disabled', 'disabled');
            $("#dBancoSus").attr('disabled', 'disabled');
            $("#chequeBs").attr('disabled', 'disabled');
            $("#chequeSus").attr('disabled', 'disabled');
            $("#tDebitoBs").attr('disabled', 'disabled');
            $("#tDebitoSus").attr('disabled', 'disabled');
            $("#tCreditoBs").attr('disabled', 'disabled');
            $("#tCreditoSus").attr('disabled', 'disabled');

//            $("#efectivoBs").attr("style", "color :black;");
//            $("#efectivoSus").attr("style", "color :black;");
            $("#dBancoBs").attr("style", "color :black;");
            $("#dBancoSus").attr("style", "color :black;");
            $("#chequeBs").attr("style", "color :black;");
            $("#chequeSus").attr("style", "color :black;");
            $("#tDebitoBs").attr("style", "color :black;");
            $("#tDebitoSus").attr("style", "color :black;");
            $("#tCreditoBs").attr("style", "color :black;");
            $("#tCreditoSus").attr("style", "color :black;");


        } else {
            if (isNaN(importe_total)) {
                $('#saldoCreditoBs').text(importeAPagar);
            } else {
                if (importe_total < 0) {
                    var cambio = importe_total * (-1);
                    $("#cambioSus").text(cambio.toFixed(2));
                    var convertirCambioSusABs = cambio * tipoCambio;
                    $("#cambioBs").text(convertirCambioSusABs.toFixed(2));


                    $('#saldoCreditoBs').text("0");
                    $('#saldoCreditoSus').text("0");

                    var convertircambioBs = cambio * tipoCambio;
                    var convertirBs_SaldoEfectivo = efectivoBs * tipoCambio;
                    var saldoEfectivo = parseFloat(convertirBs_SaldoEfectivo) - parseFloat(convertircambioBs);
                    $("#efectivoBs").val(saldoEfectivo.toFixed(2));
                    if ($("#calculoEfectivoBs").val() == "" || $("#calculoEfectivoBs").val() == 0) {
                        $("#efectivoBs").val(0);
                    }

                    $("#saldo").val(0);    //DEL CREDITO!!

//                    $("#calculoEfectivoSus").attr('disabled', 'disabled');


//                    $("#efectivoBs").attr('disabled', 'disabled');
//                    $("#efectivoSus").attr('disabled', 'disabled');
                    $("#dBancoBs").attr('disabled', 'disabled');
                    $("#dBancoSus").attr('disabled', 'disabled');
                    $("#chequeBs").attr('disabled', 'disabled');
                    $("#chequeSus").attr('disabled', 'disabled');
                    $("#tDebitoBs").attr('disabled', 'disabled');
                    $("#tDebitoSus").attr('disabled', 'disabled');
                    $("#tCreditoBs").attr('disabled', 'disabled');
                    $("#tCreditoSus").attr('disabled', 'disabled');

                    $("#efectivoBs").attr("style", "color :black;");
                    $("#efectivoSus").attr("style", "color :black;");
                    $("#dBancoBs").attr("style", "color :black;");
                    $("#dBancoSus").attr("style", "color :black;");
                    $("#chequeBs").attr("style", "color :black;");
                    $("#chequeSus").attr("style", "color :black;");
                    $("#tDebitoBs").attr("style", "color :black;");
                    $("#tDebitoSus").attr("style", "color :black;");
                    $("#tCreditoBs").attr("style", "color :black;");
                    $("#tCreditoSus").attr("style", "color :black;");

                } else {

                    $("#cambioBs").text(0);
                    $("#cambioSus").text(0);

                    $("#saldoCreditoSus").text(importe_total.toFixed(2));
                    var convertirTotalSusABs = importe_total * tipoCambio;
                    $("#saldoCreditoBs").text(convertirTotalSusABs.toFixed(2));

                    var convertirBs_SaldoEfectivo = efectivoBs * tipoCambio;
                    $("#efectivoBs").val(convertirBs_SaldoEfectivo.toFixed(2));

                    $("#saldo").val(parseFloat(importe_total).toFixed(2)); //DEL CREDITO!!


//                    $("#calculoEfectivoSus").removeAttr('disabled');



//                    $("#efectivoBs").removeAttr('disabled');
//                    $("#efectivoSus").removeAttr('disabled');
                    $("#dBancoBs").removeAttr('disabled');
                    $("#dBancoSus").removeAttr('disabled');
                    $("#chequeBs").removeAttr('disabled');
                    $("#chequeSus").removeAttr('disabled');
                    $("#tDebitoBs").removeAttr('disabled');
                    $("#tDebitoSus").removeAttr('disabled');
                    $("#tCreditoBs").removeAttr('disabled');
                    $("#tCreditoSus").removeAttr('disabled');

//                    $("#efectivoBs").removeAttr("style");
//                    $("#efectivoSus").removeAttr("style");
                    $("#dBancoBs").removeAttr("style");
                    $("#dBancoSus").removeAttr("style");
                    $("#chequeBs").removeAttr("style");
                    $("#chequeSus").removeAttr("style");
                    $("#tDebitoBs").removeAttr("style");
                    $("#tDebitoSus").removeAttr("style");
                    $("#tCreditoBs").removeAttr("style");
                    $("#tCreditoSus").removeAttr("style");

                }
            }
        }
    }
}

function calcular_SusCOMBO() {

    var importeAPagar = $('#totalacobrarcondescuentoenlaventa').text();

    var idmoneda;
    idmoneda = $('#idMoneda').val();
    $("#aCuenta").val(0);
    var tipoCambio = $('#TCV').text();
    var efectivoBs = $('#calculoEfectivoBs').val();
    var efectivoSus = $('#calculoEfectivoSus').val();
    var dBancoBs = $('#dBancoBs').val();
    var dBancoSus = $('#dBancoSus').val();
    var chequeBs = $('#chequeBs').val();
    var chequeSus = $('#chequeSus').val();
    var tDebitoBs = $('#tDebitoBs').val();
    var tDebitoSus = $('#tDebitoSus').val();
    var tCreditoBs = $('#tCreditoBs').val();
    var tCreditoSus = $('#tCreditoSus').val();


    if (isNaN(efectivoBs) || efectivoBs == 0 || typeof efectivoBs == "undefined") {
        efectivoBs = 0;
    }

    if (isNaN(efectivoSus) || efectivoSus == 0 || typeof efectivoSus == "undefined") {
        efectivoSus = 0;
    }

    if (isNaN(dBancoBs) || dBancoBs == 0 || typeof dBancoBs == "undefined") {
        dBancoBs = 0;
    }

    if (isNaN(dBancoSus) || dBancoSus == 0 || typeof dBancoSus == "undefined") {
        dBancoSus = 0;
    }

    if (isNaN(chequeBs) || chequeBs == 0 || typeof chequeBs == "undefined") {
        chequeBs = 0;
    }

    if (isNaN(chequeSus) || chequeSus == 0 || typeof chequeSus == "undefined") {
        chequeSus = 0;
    }

    if (isNaN(tDebitoBs) || tDebitoBs == 0 || typeof tDebitoBs == "undefined") {
        tDebitoBs = 0;
    }

    if (isNaN(tDebitoSus) || tDebitoSus == 0 || typeof tDebitoSus == "undefined") {
        tDebitoSus = 0;
    }

    if (isNaN(tCreditoBs) || tCreditoBs == 0 || typeof tCreditoBs == "undefined") {
        tCreditoBs = 0;
    }

    if (isNaN(tCreditoSus) || tCreditoSus == 0 || typeof tCreditoSus == "undefined") {
        tCreditoSus = 0;
    }

    if (idmoneda == 1) { //Bs

        efectivoSus = parseFloat(efectivoSus) * tipoCambio;
        dBancoSus = parseFloat(dBancoSus) * tipoCambio;
        chequeSus = parseFloat(chequeSus) * tipoCambio;
        tDebitoSus = parseFloat(tDebitoSus) * tipoCambio;
        tCreditoSus = parseFloat(tCreditoSus) * tipoCambio;

        efectivoBs = parseFloat(efectivoBs);
        dBancoBs = parseFloat(dBancoBs);
        chequeBs = parseFloat(chequeBs);
        tDebitoBs = parseFloat(tDebitoBs);
        tCreditoBs = parseFloat(tCreditoBs);

        var importe_total = 0;
        var saldoCredito = parseFloat(importeAPagar);


        importe_total = parseFloat(saldoCredito) - efectivoBs - efectivoSus - dBancoSus - chequeSus - tDebitoSus - tCreditoSus - dBancoBs - chequeBs - tDebitoBs - tCreditoBs;


        if (importe_total.toFixed(2) == 0 || importe_total.toFixed(2) == 0.00) {
            $('#saldoCreditoBs').text("0");
            $('#saldoCreditoSus').text("0");

            $("#cambioBs").text(0);
            $("#cambioSus").text(0);

            var convertirBsASus = efectivoSus / tipoCambio;
            $("#efectivoSus").val(convertirBsASus.toFixed(2));

            $("#saldo").val(0);

//            $("#calculoEfectivoBs").attr('disabled', 'disabled');

//            $("#efectivoBs").attr('disabled', 'disabled');
//            $("#efectivoSus").attr('disabled', 'disabled');
            $("#dBancoBs").attr('disabled', 'disabled');
            $("#dBancoSus").attr('disabled', 'disabled');
            $("#chequeBs").attr('disabled', 'disabled');
            $("#chequeSus").attr('disabled', 'disabled');
            $("#tDebitoBs").attr('disabled', 'disabled');
            $("#tDebitoSus").attr('disabled', 'disabled');
            $("#tCreditoBs").attr('disabled', 'disabled');
            $("#tCreditoSus").attr('disabled', 'disabled');

//            $("#efectivoBs").attr("style", "color :black;");
//            $("#efectivoSus").attr("style", "color :black;");
            $("#dBancoBs").attr("style", "color :black;");
            $("#dBancoSus").attr("style", "color :black;");
            $("#chequeBs").attr("style", "color :black;");
            $("#chequeSus").attr("style", "color :black;");
            $("#tDebitoBs").attr("style", "color :black;");
            $("#tDebitoSus").attr("style", "color :black;");
            $("#tCreditoBs").attr("style", "color :black;");
            $("#tCreditoSus").attr("style", "color :black;");

        } else {
            if (isNaN(importe_total)) {
                $('#saldoCredito').text(importeAPagar);
            } else {
                if (importe_total < 0) {
                    var cambio = importe_total * (-1);
                    var convertirCambioSusABs = cambio / tipoCambio;
                    $("#cambioSus").text(convertirCambioSusABs.toFixed(2));
                    $("#cambioBs").text(cambio.toFixed(2));

                    $('#saldoCreditoBs').text("0");
                    $('#saldoCreditoSus').text("0");

                    var saldoEfectivo = parseFloat(efectivoSus) - parseFloat(cambio);
                    var convertirSus_SaldoEfectivo = saldoEfectivo / tipoCambio;
                    $("#efectivoSus").val(convertirSus_SaldoEfectivo.toFixed(2));
                    if ($('#calculoEfectivoSus').val() == "" || $('#calculoEfectivoSus').val() == 0) {
                        $("#efectivoSus").val(0);
                    }
                    $("#saldo").val(0);

//                    $("#calculoEfectivoBs").attr('disabled', 'disabled');

//                    $("#efectivoBs").attr('disabled', 'disabled');
//                    $("#efectivoSus").attr('disabled', 'disabled');
                    $("#dBancoBs").attr('disabled', 'disabled');
                    $("#dBancoSus").attr('disabled', 'disabled');
                    $("#chequeBs").attr('disabled', 'disabled');
                    $("#chequeSus").attr('disabled', 'disabled');
                    $("#tDebitoBs").attr('disabled', 'disabled');
                    $("#tDebitoSus").attr('disabled', 'disabled');
                    $("#tCreditoBs").attr('disabled', 'disabled');
                    $("#tCreditoSus").attr('disabled', 'disabled');

//                    $("#efectivoBs").attr("style", "color :black;");
//                    $("#efectivoSus").attr("style", "color :black;");
                    $("#dBancoBs").attr("style", "color :black;");
                    $("#dBancoSus").attr("style", "color :black;");
                    $("#chequeBs").attr("style", "color :black;");
                    $("#chequeSus").attr("style", "color :black;");
                    $("#tDebitoBs").attr("style", "color :black;");
                    $("#tDebitoSus").attr("style", "color :black;");
                    $("#tCreditoBs").attr("style", "color :black;");
                    $("#tCreditoSus").attr("style", "color :black;");

                } else {

                    $("#saldoCreditoBs").text(importe_total.toFixed(2));
                    var convertirSaldoCreditoSusABs = importe_total / tipoCambio;
                    $("#saldoCreditoSus").text(convertirSaldoCreditoSusABs.toFixed(2));

                    $("#cambioBs").text("0");
                    $("#cambioSus").text("0");

                    var convertirSus_SaldoEfectivo = efectivoSus / tipoCambio;
                    $("#efectivoSus").val(parseFloat(convertirSus_SaldoEfectivo).toFixed(2));

                    $("#saldo").val(parseFloat(importe_total).toFixed(2));

                    if (importe_total.toFixed(2) == 0.01) {
                        $("#saldoCreditoBs").text(0);
                        $("#saldo").val(0);
                    }

//                    $("#calculoEfectivoBs").removeAttr('disabled');
//                    $("#efectivoBs").removeAttr('disabled');
//                    $("#efectivoSus").removeAttr('disabled');
                    $("#dBancoBs").removeAttr('disabled');
                    $("#dBancoSus").removeAttr('disabled');
                    $("#chequeBs").removeAttr('disabled');
                    $("#chequeSus").removeAttr('disabled');
                    $("#tDebitoBs").removeAttr('disabled');
                    $("#tDebitoSus").removeAttr('disabled');
                    $("#tCreditoBs").removeAttr('disabled');
                    $("#tCreditoSus").removeAttr('disabled');

//                    $("#efectivoBs").removeAttr("style");
//                    $("#efectivoSus").removeAttr("style");
                    $("#dBancoBs").removeAttr("style");
                    $("#dBancoSus").removeAttr("style");
                    $("#chequeBs").removeAttr("style");
                    $("#chequeSus").removeAttr("style");
                    $("#tDebitoBs").removeAttr("style");
                    $("#tDebitoSus").removeAttr("style");
                    $("#tCreditoBs").removeAttr("style");
                    $("#tCreditoSus").removeAttr("style");

                }
            }
        }


    } else {

        efectivoBs = parseFloat(efectivoBs) / tipoCambio;
        dBancoBs = parseFloat(dBancoBs) / tipoCambio;
        chequeBs = parseFloat(chequeBs) / tipoCambio;
        tDebitoBs = parseFloat(tDebitoBs) / tipoCambio;
        tCreditoBs = parseFloat(tCreditoBs) / tipoCambio;

        efectivoSus = parseFloat(efectivoSus);
        dBancoSus = parseFloat(dBancoSus);
        chequeSus = parseFloat(chequeSus);
        tDebitoSus = parseFloat(tDebitoSus);
        tCreditoSus = parseFloat(tCreditoSus);

        var importe_total = 0;
        var saldoCredito = parseFloat(importeAPagar);

        importe_total = parseFloat(saldoCredito) - efectivoSus - efectivoBs - dBancoBs - chequeBs - tDebitoBs - tCreditoBs - dBancoSus - chequeSus - tDebitoSus - tCreditoSus;


        if (importe_total == 0 || importe_total == 0.00) {
            $('#saldoCreditoBs').text("0");
            $('#saldoCreditoSus').text("0");

            $("#cambioBs").text(0);
            $("#cambioSus").text(0);

            $("#efectivoSus").val(efectivoSus.toFixed(2));

            $("#saldo").val(0);

//            $("#calculoEfectivoBs").attr('disabled', 'disabled');
//            $("#efectivoBs").attr('disabled', 'disabled');
//            $("#efectivoSus").attr('disabled', 'disabled');
            $("#dBancoBs").attr('disabled', 'disabled');
            $("#dBancoSus").attr('disabled', 'disabled');
            $("#chequeBs").attr('disabled', 'disabled');
            $("#chequeSus").attr('disabled', 'disabled');
            $("#tDebitoBs").attr('disabled', 'disabled');
            $("#tDebitoSus").attr('disabled', 'disabled');
            $("#tCreditoBs").attr('disabled', 'disabled');
            $("#tCreditoSus").attr('disabled', 'disabled');

//            $("#efectivoBs").attr("style", "color :black;");
//            $("#efectivoSus").attr("style", "color :black;");
            $("#dBancoBs").attr("style", "color :black;");
            $("#dBancoSus").attr("style", "color :black;");
            $("#chequeBs").attr("style", "color :black;");
            $("#chequeSus").attr("style", "color :black;");
            $("#tDebitoBs").attr("style", "color :black;");
            $("#tDebitoSus").attr("style", "color :black;");
            $("#tCreditoBs").attr("style", "color :black;");
            $("#tCreditoSus").attr("style", "color :black;");

        } else {
            if (isNaN(importe_total)) {
                $('#saldoCredito').text(importeAPagar);
            } else {
                if (importe_total < 0) {
                    var cambio = importe_total * (-1);
                    $("#cambioSus").text(cambio.toFixed(2));
                    var convertirCambioSusABs = cambio * tipoCambio;
                    $("#cambioBs").text(convertirCambioSusABs.toFixed(2));

                    $('#saldoCreditoBs').text("0");
                    $('#saldoCreditoSus').text("0");

                    var saldoEfectivo = parseFloat(efectivoSus) - parseFloat(cambio);
                    $("#efectivoSus").val(saldoEfectivo.toFixed(2));
                    if ($("#calculoEfectivoSus").val() == "" || $("#calculoEfectivoSus").val() == 0) {
                        $("#efectivoSus").val(0);
                    }

                    $("#saldo").val(0);

//                    $("#calculoEfectivoBs").attr('disabled', 'disabled');
//                    $("#efectivoBs").attr('disabled', 'disabled');
//                    $("#efectivoSus").attr('disabled', 'disabled');
                    $("#dBancoBs").attr('disabled', 'disabled');
                    $("#dBancoSus").attr('disabled', 'disabled');
                    $("#chequeBs").attr('disabled', 'disabled');
                    $("#chequeSus").attr('disabled', 'disabled');
                    $("#tDebitoBs").attr('disabled', 'disabled');
                    $("#tDebitoSus").attr('disabled', 'disabled');
                    $("#tCreditoBs").attr('disabled', 'disabled');
                    $("#tCreditoSus").attr('disabled', 'disabled');

                    $("#efectivoBs").attr("style", "color :black;");
                    $("#efectivoSus").attr("style", "color :black;");
                    $("#dBancoBs").attr("style", "color :black;");
                    $("#dBancoSus").attr("style", "color :black;");
                    $("#chequeBs").attr("style", "color :black;");
                    $("#chequeSus").attr("style", "color :black;");
                    $("#tDebitoBs").attr("style", "color :black;");
                    $("#tDebitoSus").attr("style", "color :black;");
                    $("#tCreditoBs").attr("style", "color :black;");
                    $("#tCreditoSus").attr("style", "color :black;");

                } else {

                    $("#saldoCreditoSus").text(importe_total.toFixed(2));
                    var convertirTotalSusABs = importe_total * tipoCambio;
                    $("#saldoCreditoBs").text(convertirTotalSusABs.toFixed(2));

                    $("#cambioBs").text(0);
                    $("#cambioSus").text(0);

                    $("#efectivoSus").val(efectivoSus.toFixed(2));

                    $("#saldo").val(parseFloat(importe_total).toFixed(2));

                    if (importe_total.toFixed(2) == 0.01) {
                        $("#saldo").val(0);
                        $("#saldoCreditoBs").text(0);
                    }


//                    $("#calculoEfectivoBs").removeAttr('disabled');
//                    $("#efectivoBs").removeAttr('disabled');
//                    $("#efectivoSus").removeAttr('disabled');
                    $("#dBancoBs").removeAttr('disabled');
                    $("#dBancoSus").removeAttr('disabled');
                    $("#chequeBs").removeAttr('disabled');
                    $("#chequeSus").removeAttr('disabled');
                    $("#tDebitoBs").removeAttr('disabled');
                    $("#tDebitoSus").removeAttr('disabled');
                    $("#tCreditoBs").removeAttr('disabled');
                    $("#tCreditoSus").removeAttr('disabled');

//                    $("#efectivoBs").removeAttr("style");
//                    $("#efectivoSus").removeAttr("style");
                    $("#dBancoBs").removeAttr("style");
                    $("#dBancoSus").removeAttr("style");
                    $("#chequeBs").removeAttr("style");
                    $("#chequeSus").removeAttr("style");
                    $("#tDebitoBs").removeAttr("style");
                    $("#tDebitoSus").removeAttr("style");
                    $("#tCreditoBs").removeAttr("style");
                    $("#tCreditoSus").removeAttr("style");

                }
            }
        }

    }
}

//==========================================================================================================================

/*
 * Metodo para calcular el cambio cuando se paga en efectivo
 * @returns {undefined}
 */


function calcular_total() {
    var descuentoPorcentaje = document.getElementById('descuentoP').checked;
    var bs = document.getElementById('bs').checked;
    if (descuentoPorcentaje == true) {
        var importe_total = 0;
        var entradavalor = parseFloat($('#pago').val());
        var numero = parseFloat(totalConDescuento);
        if (bs === true) {
            importe_total = parseFloat(entradavalor) - numero;
        } else {
            importe_total = (parseFloat(entradavalor) * bolivianos1) - numero;
        }
        if (importe_total < 0) {
            $('#cambio').val("0");
        } else {
            if (isNaN(importe_total)) {
                $("#cambio").val(0);
            } else {
                importe_total = importe_total.toFixed(2);
                $("#cambio").val(importe_total);
            }
        }
    } else {
        var importe_total = 0;
        var entradavalor = parseFloat($('#pago').val());
        var numero = parseFloat($("#totalcondescuento").val());
        if (bs === true) {
            importe_total = parseFloat(entradavalor) - numero;
        } else {
            importe_total = (parseFloat(entradavalor) * bolivianos1) - numero;
        }
        if (importe_total < 0) {
            $('#cambio').val("0");
        } else {
            if (isNaN(importe_total)) {
                $("#cambio").val(0);
            } else {
                importe_total = importe_total.toFixed(2);
                $("#cambio").val(importe_total);
            }
        }
    }
}

/*
 * Metodo para calcular el saldo del monto a pagar cuando la venta es realizada
 * a credito y se hace un pago inicial
 * @returns {undefined}
 */
function calcular_totalCredito() {

    var importe_total = 0;
    var entradavalor = parseFloat($('#aCuenta').val());
//    var saldo = $("#totalacobrarcondescuentoenlaventa").text();
    var idmoneda = $("#idMoneda").val();

    if (idmoneda == 1) {
        var saldo = $("#saldoCreditoBs").text();
    } else {
        var saldo = $("#saldoCreditoSus").text();
    }


//    if( saldo == 0){
//        var saldo = $("#totalacobrarcondescuentoenlaventa").text();
//    }

    var numero = parseFloat(saldo);
    importe_total = numero - entradavalor;


    if (importe_total < 0) {
        $('#saldo').val("0");
    } else {
        $("#saldo").val(importe_total.toFixed(2));
    }
}

/*
 * Agregar un producto mediante el Codigo de Barra
 * @returns {undefined}
 */
function codigobarraagregardetalle() {
    var idventa = $('#venta').val();
    var codigoBarra = $("#codigoBarra").val();
    $("#codigoInterno").val("");
    $("#nombreproducto").val("");
    var idalmacen = $("#almacen").val();
    var sucursal = $("#idsucursal").val();
    var idCliente = $("#idCliente").val();
    if (idCliente == "") {
        idCliente = "0";
    }
    $("#codigoBarra").val("");
    if (!codigoBarra || !codigoBarra.trim().length) {
        return false;
    } else {
        tipoventa = 'Contado';
        var route = "/buscarbarcode/" + codigoBarra + "/" + idalmacen + "/" + tipoventa + "/" + sucursal + "/" + idCliente + "/" + idventa;
        //@todo este codigo se descomenta si se maneja los codigo barras unicos
        // $.get(route, function (res) {
        //
        //     var f = false;
        //     $(res).each(function (key, value) {
        //         $("#codigoBarra").val("");
        //         f = true;
        //         idListaPrecio = value.idlistaprecio;
        //
        //         agregaraldetallecodigobarra(value.id, value.stock, idCliente);
        //     });
        //     if (f) {
        //     } else {
        //         swal({title: "Producto NO Encontrado",
        //             type: "warning",
        //             showConfirmButton: false,
        //             closeOnConfirm: false,
        //             timer: 1000});
        //     }
        // });
        // @todo esto es para cargar los productos
        $.get(route, function (res) {
            $('#resultadoprodcuto').empty();
            $(res).each(function (key, value) {
                var Stock;
//                idListaPrecio = value.idlistaprecio;
                if (value.stock == null) {
                    Stock = 0;
                } else {
                    Stock = value.stock;
                }
                $('#resultadoprodcuto').append("<tr>" +
                    "<td><img src='" + value.imagen + "' alt='img-prod' width='64px' height='64px' class='circle responsive-img valign profile-image materialboxed' /></td>" +
                    "<td>" + value.codigoDeBarra + "</td>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.descripcion + "</td>" +
                    "<td>" + value.modelo + "</td>" +
                    "<td>" + value.marca + "</td>" +
                    "<td><label id='stockP" + value.id + "' style='font-size: 15px; color: black;'>" + Stock + "</label></td>" +
                    "<td><input type='text' name='' value='" + value.precioVenta + "' id='precioP" + value.id + "' min='0' onkeypress='return NumCheck(event,this)' ></td>" +
                    "<td><input type='text' name='' value ='1' id='" + value.id + "' onkeypress='return isNumberKey(this);' ></td>" +
                    "<td><button class='btn btn-floating waves-efect'  OnClick='agregar(" + value.id + ");'><i class='mdi-av-playlist-add' ></i></button></td>" +
                    "</tr>");
            });
            $('.materialboxed').materialbox();
        });
        obtenerIdMoneda();
        return false;
    }
}

/*
 * Metodo para buscar un cliente enviando como parametro el NIT del cliente
 * @returns {undefined}
 */
function buscarcliente() {
    $("#razonsocial").val("");
    var idventa = parseInt($('#nit').val()) + "";
    var route = "/buscarcliente/" + idventa;
    // $.get(route, function (res) {
    //     if (res == 0) {
    //         $("#razonsocial").val("");
    //     }
    //     $(res).each(function (key, value) {
    //         value.razonSocial;
    //         $("#razonsocial").val(value.razonSocial);
    //         idCliente = value.id;
    //     });
    // });
}
/*
 *
 * @param {type} $nit -> NIT del cliente
 * @param {type} $nombre -> Nombre del cliente
 * @returns {undefined}
 */
function guardarcliente($nit, $nombre) {
    var route = "/agregarcliente/" + $nit + "/" + $nombre;
    $.get(route, function (res) {
        if (res == 0) {
            buscarcliente();
            return false;
        }
    });
}

/*
 * Metodo para guardar un nuevo cliente en la base de datos del sistema
 */
$("#nuevocliente").click(function () {
    var nombre = $("#nombre").val();
    var direccion = $("#direccion").val();
    var telefonoFijo = $("#telefonoFijo").val();
    var correo = $("#correo").val();
    var celular = $("#celular").val();
    var razonSocial = $("#razonSocial").val( );
    var preferencias = $("#preferencias").val();
    var idCiudad = $("#ciudad").val();
    var NIT = parseInt($("#NIT").val()) + "";
    if (!nombre || !nombre.trim().length) {
        return Materialize.toast('Nombre es Obligatorio', 1000, 'rounded');
    }
    if (!razonSocial || !razonSocial.trim().length) {
        return Materialize.toast('Razon Social Vacia', 1000, 'rounded');
    }
    if (!NIT || !NIT.trim().length) {
        return Materialize.toast('NIT vacio', 1000, 'rounded');
    }
    if (!correo || !correo.trim().length) {
    } else {
        if (!valEmail(correo)) {
            return Materialize.toast('Inserte una direccion de correo correcta', 2000, 'rounded');
        }
    }
    var idcuentacobrar = $("#cuentacon").val();
    var tipocliente = $("#tipocliente").val( );
    //var descuentos = $("#descuento").val();
    var route = "/Cliente";
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'POST',
        dataType: 'json',
        data: {
            nombre: nombre,
            direccion: direccion,
            telefonoFijo: telefonoFijo,
            correo: correo,
            celular: celular,
            razonSocial: razonSocial,
            NIT: NIT,
            Preferencias: preferencias,
            idCiudad: idCiudad,
            idcuenta: idcuentacobrar,
            idTipoCliente: tipocliente,
            idDescuento: 0
        },
        success: function (data) {
            $("#modal2").modal('close');
            Materialize.toast('Cliente creado exitosamente', 1000, 'rounded');
            $("#nombre").val("");
            $("#direccion").val("");
            $("#telefonoFijo").val("");
            $("#correo").val("");
            $("#celular").val("");
            $("#razonSocial").val("");
            $("#NIT").val("");
            cargarcliente();
            $(data).each(function (key, value) {
                $("#cliNombre").val(value.nombre);
                $("#idCliente").val(value.id);
                $("#cliNombre2").val(value.nombre);
                var route = "/nitrazoncliente/" + value.id;
                $.get(route, function (res) {
                    $(res).each(function (key, value) {
                        $("#nit").val(value.nit);
                        $("#razonsocial").val(value.razonSocial);
                    });
                });
            });
        },
        error: function () {
            Materialize.toast('Error al Guardar el Cliente', 2000, 'rounded');
        }
    });
});

/*
 * Buscar Producto mediante el input de nombre y codigo Interno
 * @returns {Boolean}
 */
function buscarproductoinput() {
    alert('aa');
    var idventa = $('#venta').val();
    var codigoInterno = $("#codigoInterno").val();
    var nombre = $("#nombreproducto").val();
    var tabladatos = $('#resultadoprodcuto');
    var idalmacen = $("#almacen").val();
    var sucursal = $("#idsucursal").val();
    var idCliente = $("#idCliente").val();
    if (idCliente == "") {
        idCliente = "0";
    }
    tabladatos.empty();
    if (!nombre || !nombre.trim().length) {
    } else {
        var route = "/buscarnombreproducto/" + nombre + "/" + idalmacen + "/" + tipodeventa + "/" + sucursal + "/" + idCliente + "/" + idventa;
        $('#resultadoprodcuto').empty();
        $.get(route, function (res) {
            $('#resultadoprodcuto').empty();
            $(res).each(function (key, value) {
                var Stock;
//                idListaPrecio = value.idlistaprecio;
                if (value.stock == null) {
                    Stock = 0;
                } else {
                    Stock = value.stock;
                }
                $('#resultadoprodcuto').append("<tr>" +
                    "<td><img src='" + value.imagen + "' alt='img-prod' width='64px' height='64px' class='circle responsive-img valign profile-image materialboxed' /></td>" +
                    "<td>" + value.codigoDeBarra + "</td>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.descripcion + "</td>" +
                    //"<td>" + value.modelo + "</td>" +
                    "<td>" + value.marca + "</td>" +
                    "<td><label id='stockP" + value.id + "' style='font-size: 15px; color: black;'>" + Stock + "</label></td>" +
                    "<td width=7%><input type='text' name='' value='" + value.precioVenta + "' id='precioP" + value.id + "' min='0' onkeypress='return NumCheck(event,this)' ></td>" +
                    "<td width=4%><input style='text-align:center;' type='text' name='' value ='1' id='" + value.id + "' onkeypress='return isNumberKey(this);' ></td>" +
                    "<td><button class='btn btn-floating waves-efect'  OnClick='agregar(" + value.id + ");'><i class='material-icons'>add</i></button></td>" +
                    "</tr>");
            });
            $('.materialboxed').materialbox();
        });
        obtenerIdMoneda();
        return false;
    }
    if (!codigoInterno || !codigoInterno.trim().length) {
    } else {
        var route = "/buscarcodintero/" + codigoInterno + "/" + idalmacen + "/" + tipodeventa + "/" + sucursal + "/" + idCliente + "/" + idventa;

        $.get(route, function (res) {
            $('#resultadoprodcuto').empty();
            $(res).each(function (key, value) {
//                idListaPrecio = value.idlistaprecio;
                var Stock;
                if (value.stock == null) {
                    Stock = 0;
                } else {
                    Stock = value.stock;
                }
                $('#resultadoprodcuto').append("<tr>" +
                    "<td><img src='" + value.imagen + "' alt='img-prod' width='64px' height='64px' class='circle responsive-img valign profile-image materialboxed' /></td>" +
                    "<td>" + value.codigoDeBarra + "</td>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.descripcion + "</td>" +
                    //"<td>" + value.modelo + "</td>" +
                    "<td>" + value.marca + "</td>" +
                    "<td><label id='stockP" + value.id + "' style='font-size: 15px; color: black;'>" + Stock + "</label></td>" +
                    "<td><input type='text' name='' value='" + value.precioVenta + "' id='precioP" + value.id + "' min='0' onkeypress='return NumCheck(event,this)'></td>" +
                    "<td><input type='text' name='' value ='1' id='" + value.id + "' onkeypress='return isNumberKey(this);'></td>" +
                    "<td><button class='btn btn-floating waves-efect'  OnClick='agregar(" + value.id + ");'><i class='mdi-av-playlist-add' ></i></button></td>" +
                    "</tr>");
            });
            $('.materialboxed').materialbox();
        });
        obtenerIdMoneda();
        return false;
    }
}

/*
 * Metodo para agregar un producto al detalle de la venta
 * @param {type} $btn -> BOTON con el ID del producto a vender
 * @returns {undefined}
 */
function agregar(btn) {

    idprodu = parseInt(btn);
    document.getElementById('idproducto').value = btn;
    agregardetalleventa();
}
/*
 * Metodo para cargar la tabla con el detalle de la venta
 * @returns {undefined}
 */
function Cargartabla() {

    var tabladatos = $('#datos');
    var idventa = $('#venta').val();
    var route = "/detalleventas/" + idventa;
    $('#datos').empty();
    $.get(route, function (res) {
        $('#datos').empty();
        $(res).each(function (key, value) {
            if (value.tipo == "combo" || value.tipo == "comida") {
                tabladatos.append("<tr>" +
                    "<td>" +
                    "<img src='" + value.imagen + "' alt='img-prod' width='64px' height='64px' class='circle responsive-img valign profile-image materialboxed' />" +
                    "</td>" +
                    "<td>" + value.codigoInterno + "</td>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.descripcion + "</td>" +
                    "<td>" + value.marca + "</td>" +
                    //"<td>" + value.modelo + "</td>" +
                    "<td>" + value.cantidad + "</td>" +
                    "<td>" + value.precioVenta + "</td>" +
                    "<td>" + value.subtotal + "</td>" +
                    "<td>" + value.porcentajedescuento + "%</td>" +
                    "<td>" + value.importedescuento + "</td>" +
                    "<td>" + value.totalneto + "</td>" +
                    "<td>" +
                    "<a class='btn dropdown-button' href='#!' data-activates='descu" + value.id + "'>Descuentos<i class='mdi-navigation-arrow-drop-down right'></i></a>" +
                    "<ul id='descu" + value.id + "' class ='dropdown-content'></ul>" +
                    "</td>" +
                    "<td>" +
                    "<a class='btn btn-floating waves-efect' title='EDITAR' href='#' onclick='openmodal(" + value.id + ")'>" +
                    "<i class='mdi-editor-mode-edit'></i>" +
                    "</a>" +
                    "</td>" +
                    "<td>" +
                    "<button class='btn btn-floating waves-efect' OnClick='Eliminar(" + value.id + " );'>" +
                    "<i class='material-icons'>delete</i>" +
                    "</button>" +
                    "</td>" +
                    "<td>" +
                    "<button class='btn btn-floating waves-efect' value=" + value.id + " OnClick='productosVendidos(" + value.id + ");'>" +
                    "<i class='mdi-action-info activator'></i>" +
                    "</button>" +
                    "</td>" +
                    "</tr>"
                );
            } else {
                tabladatos.append("<tr>" +
                    "<td>" +
                    "<img src='" + value.imagen + "' alt='img-prod' width='64px' height='64px' class='circle responsive-img valign profile-image materialboxed' />" +
                    "</td>" +
                    "<td>" + value.codigoInterno + "</td>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.descripcion + "</td>" +
                    "<td>" + value.marca + "</td>" +
                    //"<td>" + value.modelo + "</td>" +
                    "<td>" + value.cantidad + "</td>" +
                    "<td>" + value.precioVenta + "</td>" +
                    "<td>" + value.subtotal + "</td>" +
                    "<td>" + value.porcentajedescuento + "%</td>" +
                    "<td>" + value.importedescuento + "</td>" +
                    "<td>" + value.totalneto + "</td>" +
                    "<td>" +
                    "<a class='btn dropdown-button' href='#!' data-activates='descu" + value.id + "'>Descuentos<i class='mdi-navigation-arrow-drop-down right'></i></a>" +
                    "<ul id='descu" + value.id + "' class ='dropdown-content'></ul>" +
                    "</td>" +
                    "<td>" +
                    "<a class='btn btn-floating waves-efect' title='EDITAR' href='#' onclick='openmodal(" + value.id + ")'>" +
                    "<i class='mdi-editor-mode-edit'></i>" +
                    "</a>" +
                    "</td>" +
                    "<td>" +
                    "<button class='btn btn-floating waves-efect' OnClick='Eliminar(" + value.id + " );'>" +
                    "<i class='material-icons'>delete</i>" +
                    "</button>" +
                    "</td>" +
                    "</tr>"
                );
            }
            cardardescuentoproducto(value.id);
            document.getElementById('total').innerHTML = value.total;
            totalfactura = value.total;
            idproductos = value.idProducto;
            idventas = value.idVenta;
            $('.materialboxed').materialbox();
//            if (cargarfac == false) {
//                cargarFactura1();
//            }
        });


    });
}

function openmodal(btn) {
    var idVenta = $("#venta").val();
    if (idVenta == "") {
        $('#generadordeventa').show();
        return swal({title: "Adverencia!",
            text: "No se puede editar el detalle de una venta cobrada o anulada",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    var estado;
    var route = "/Validarventaantigua/" + idVenta;
    $.get(route, function (res) {
        estado = res;
        if (estado == 2) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "No se puede editar el detalle de una venta anulada",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        if (estado == 1 || estado == 5) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "No se puede editar el detalle de una venta cobrada",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }

        Mostrar(btn);
        $("#modal4").modal('open');
    });
}

function Mostrar(btn) {
    var route = "/Detalleventa/" + btn;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $("#iddetalleventa").val(value.id);
            $('#nombreprod').text(value.nombre);
            $('#descripcionprod').text(value.descripcion);
            jQuery('#imgprod').attr('src', value.imagen);
            $("#precioprod").text(value.precio);
            $("#cantidadproducto").val(value.cantidad);
            $("#subtotalpord").text(value.total);
        });
    });
}

function cambiarcanidad() {
    var route = "/actualizarcantidad";
    var token = $("#token").val();
    var idAlmacen = $("#almacen").val();
    var id = $("#iddetalleventa").val();
    var cantidad = $("#cantidadproducto").val();
    if (cantidad == "" || cantidad == "0") {
        swal({title: "Adverencia!",
            text: "Inserte la cantidad",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
        return false;
    }
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'PUT',
        dataType: 'json',
        data: {
            id: id,
            idAlmacen: idAlmacen,
            cantidad: cantidad
        },
        success: function ($route) {
            $($route).each(function (key, value) {
                if (value.mensaje == "Cantidad Actualizada Exitosamente") {
                    swal({title: "Bien!",
                        text: value.mensaje,
                        type: "success",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1000});
                    return $("#modal4").modal('close');
                } else {
                    swal({title: "Adverencia!",
                        text: value.mensaje,
                        type: "warning",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 2500});
                    return $("#modal4").modal('close');
                }
            });
            Cargartabla();
        }, error: function () {
            swal({title: "Error Al Actualizar",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });
}

function cardardescuentoproducto(id) {
    var lista = $('#descu' + id);
    var route = "/listardescuentos/";
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            lista.append("<li>" +
                "<a href='#!' onclick='asignarDescuento(" +
                id + "," + value.id +
                ");'>" + value.descuento +
                "%<span class='badge'>"
                + value.nombre +
                "</span></a>" +
                "</li>");
        });
        $(".dropdown-button").dropdown();
    });
}

function asignarDescuento(id, idesc) {
    var idventa = $('#venta').val();
    if (idventa == '') {
        $('#generadordeventa').show();
        return swal({title: "Adverencia!",
            text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    var route = "/Detalleventa/" + id + "";
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'PUT',
        dataType: 'json',
        data: {
            iddescuento: idesc
        },
        success: function () {
            swal({title: "Bien!",
                text: "Descuento asignado correctamente",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1500});
            Cargartabla();
        }, error: function () {
            return swal({title: "Error",
                text: "Error al asignar descuento",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1500});
        }
    });
}
/*
 * Agregar un producto mediante el lector de codigo de barra
 * @param {type} $idpro -> ID del producto a vender
 * @param {type} $stockPro -> Stock actual del producto
 * @returns {Boolean}
 */
function agregaraldetallecodigobarra(idpro, stockPro, idCliente) {
    $('#resultadoprodcuto').empty();
    var idventa = $('#venta').val();
    if (idventa == '') {
        $('#generadordeventa').show();
        return swal({title: "Adverencia!",
            text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    var estado;
    var route = "/Validarventaantigua/" + idventa;
    $.get(route, function (res) {
        estado = res;
        if (estado == 2) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "No se puede agregar productos a una venta Anulada",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        if (estado == 1 || estado == 5) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "Este Venta ya fue cobrada, Porfavor realize una nueva",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        var idAlmacen = $("#almacen").val();
        var route = "/Detalleventa";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {
                idVenta: idventa,
                idAlmacen: idAlmacen,
                idProducto: idpro,
                cantidad: 1,
                precioventa: "null",
                tipoVenta: tipodeventa,
                idCliente: idCliente
            },
            success: function ($route) {
                $($route).each(function (key, value) {
                    if (value.mensaje == "Producto Agregado con Exito a la Venta") {
                        Cargartabla();
                        swal({title: "Bien!",
                            text: value.mensaje,
                            type: "success",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                    } else {
                        swal({title: "Adverencia!",
                            text: value.mensaje,
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000});
                    }
                });
            },
            error: function () {
                swal({title: "Error!",
                    text: "Error al Agregar el Producto",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });

    });
}
/*
 * Metodo para agregar un producto al detalle de la venta mediante el  boton
 * @returns {Boolean}
 */
function agregardetalleventa() {

    var idProductoCom = $('#idproducto').val();
    var idventa = $('#venta').val();
    var precioventa = $('#precioP' + idProductoCom).val();
    var idProducto = idProductoCom;
    var cantidad = $('#' + idProducto).val();
    var idCliente = $("#idCliente").val();
    if (idCliente == "") {
        idCliente = "0";
    }
    if (idventa == '') {
        $('#generadordeventa').show();
        return swal({title: "Adverencia!",
            text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    var estado;
    var route = "/Validarventaantigua/" + idventa;
    $.get(route, function (res) {
        estado = res;
        if (estado == 2) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "No se puede agregar productos a una venta Anulada",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        if (estado == 1 || estado == 5) {
            $('#generadordeventa').show();
            return swal({title: "Adverencia!",
                text: "Este Venta ya fue cobrada, Porfavor realize una nueva",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        var idAlmacen = $("#almacen").val();
        var route = "/Detalleventa";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {
                idVenta: idventa,
                idProducto: idProducto,
                cantidad: cantidad,
                precioventa: precioventa,
                tipoVenta: tipodeventa,
                idAlmacen: idAlmacen,
                idCliente: idCliente},
            success: function ($route) {
                $($route).each(function (key, value) {
                    if (value.mensaje == "Producto Agregado con Exito a la Venta") {
                        Cargartabla();
                        obtenerIdMoneda();
                        $('#resultadoprodcuto').empty();
                        $("#nombreproducto").val("");
                        $("#codigoInterno").val("");
                        $("#codigoBarra").val("");
                        swal({title: "Bien!",
                            text: value.mensaje,
                            type: "success",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                    } else {
                        swal({title: "Adverencia!",
                            text: value.mensaje,
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000});
                    }
                });
            },
            error: function () {
                swal({title: "Error!",
                    text: "Error al Agregar el Producto",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });
    });
}
/*
 * Metodo para generar una nueva venta al presionar un boton
 */
$("#generarventa").click(function () {
    var idpunto = iddelpuntoventa;
    var route = "/GenerarVenta/" + idpunto;
    var iddelaventa = 0;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            iddelaventa = parseInt(value.id);
            window.location.href = "/Ventas/" + iddelaventa;
        });
    });
});
/**
 * Metodo no utilizado
 * @returns {undefined}
 */

function obtenerIdMoneda() {
    var idventa = $('#venta').val();

    var route = "/obtenerMoneda/" + idventa;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
//            document.getElementById('idMoneda').innerHTML = value.idMoneda;
//            $("#idMoneda").val(value.idMoneda);

        });
    });
}

function cargarFactura1() {

    var total = $("#total").text();
    if (total == '0' || total == '0.00') {
        return swal({title: "Adverencia!",
//            text: "Venta Sin Detalle. Agregue Productos Para Poder Cobrar",
            text: "No se puede cobrar una venta sin importe!",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 2000});
    }

    var idventa = $('#venta').val();
    var route = "/DetalleVentaPrecios/" + idventa;
    $.get(route, function (res) {
        $(res).each(function (key, value) {

            var estado = value.mensaje;
            if (estado == 1) {    //Procede a abrir el modal de cobranza


                //=====================================================================================
                var idventa = $('#venta').val();

                var route = "/obtenerMoneda/" + idventa;
                $.get(route, function (res) {
                    $(res).each(function (key, value) {

                        $("#idMoneda").val(value.idMoneda);
                        var money = value.idMoneda;

                        if (money == 1) {//Bolivianos
                            totalConDescuento = $("#total").text();
                            document.getElementById('totalfijo').innerHTML = total;
                            $("#datosfactura tr").remove();
                            var valor = LITERAL(total);
                            var tabladatos = $('#datosfactura');
                            $("#totalacobrarcondescuentoenlaventa").text(total);
                            $("#saldoCredito").text(total);
                            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                            var porcentaje = total * 0.3;
                            porcentaje = porcentaje.toFixed(2);
                            var saldo = total - porcentaje;
                            $("#aCuenta").val(porcentaje);
                            $("#saldo").val(saldo.toFixed(2));
                            var slider = $("#porcentajepago").data("ionRangeSlider");
                            // slider.update({
                            //     min: 0,
                            //     max: 100,
                            //     from: 30
                            // });
                            $("#descuentos").val(1);
                            $("#descuentos option:selected").val(1);
                            $('#descuentos').material_select();


                        } else {

                            totalConDescuento = $("#total").text();
                            document.getElementById('totalfijo').innerHTML = total;
                            $("#datosfactura tr").remove();

                            var tipoCV = parseFloat($("#TCV").text());
                            var totalConversion = parseFloat(total);
                            var totaltotal = totalConversion * tipoCV;
                            var redondeo = totaltotal.toFixed(2);
                            var valorConversion = LITERAL(redondeo);
                            $("#totalventaliteralSus").text(valorConversion);


                            var valor = LITERALDOLAR(total);
                            var tabladatos = $('#datosfactura');
                            $("#totalacobrarcondescuentoenlaventa").text(total);
                            $("#saldoCredito").text(total);
                            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                            var porcentaje = total * 0.3;
                            porcentaje = porcentaje.toFixed(2);
                            var saldo = total - porcentaje;
                            $("#aCuenta").val(porcentaje);
                            $("#saldo").val(saldo.toFixed(2));
                            var slider = $("#porcentajepago").data("ionRangeSlider");
                            // slider.update({
                            //     min: 0,
                            //     max: 100,
                            //     from: 30
                            // });
                            $("#descuentos").val(1);
                            $("#descuentos option:selected").val(1);
                            $('#descuentos').material_select();
                        }



                    });
                });
                //=====================================================================================




            } else {  //No puede abrir el modal de cobranza por que hay producto en 0.

                //=====================================================================================

                swal({
                        title: "Uno o varios productos de la venta no tiene precio.",
                        text: "Desea continuar de todos modos?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Si, cobrar!",
                        cancelButtonText: "No, cancelar!",
                        closeOnConfirm: true,
                        closeOnCancel: true},
                    function (isConfirm) {

                        if (isConfirm) {
                            //========================================
                            var idventa = $('#venta').val();

                            var route = "/obtenerMoneda/" + idventa;
                            $.get(route, function (res) {
                                $(res).each(function (key, value) {

                                    $("#idMoneda").val(value.idMoneda);
                                    var money = value.idMoneda;

                                    if (money == 1) {//Bolivianos
                                        totalConDescuento = $("#total").text();
                                        document.getElementById('totalfijo').innerHTML = total;
                                        $("#datosfactura tr").remove();
                                        var valor = LITERAL(total);
                                        var tabladatos = $('#datosfactura');
                                        $("#totalacobrarcondescuentoenlaventa").text(total);
                                        $("#saldoCredito").text(total);
                                        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                                        var porcentaje = total * 0.3;
                                        porcentaje = porcentaje.toFixed(2);
                                        var saldo = total - porcentaje;
                                        $("#aCuenta").val(porcentaje);
                                        $("#saldo").val(saldo.toFixed(2));
                                        var slider = $("#porcentajepago").data("ionRangeSlider");
                                        // slider.update({
                                        //     min: 0,
                                        //     max: 100,
                                        //     from: 30
                                        // });
                                        $("#descuentos").val(1);
                                        $("#descuentos option:selected").val(1);
                                        $('#descuentos').material_select();


                                    } else {

                                        totalConDescuento = $("#total").text();
                                        document.getElementById('totalfijo').innerHTML = total;
                                        $("#datosfactura tr").remove();

                                        var tipoCV = parseFloat($("#TCV").text());
                                        var totalConversion = parseFloat(total);
                                        var totaltotal = totalConversion * tipoCV;
                                        var redondeo = totaltotal.toFixed(2);
                                        var valorConversion = LITERAL(redondeo);
                                        $("#totalventaliteralSus").text(valorConversion);


                                        var valor = LITERALDOLAR(total);
                                        var tabladatos = $('#datosfactura');
                                        $("#totalacobrarcondescuentoenlaventa").text(total);
                                        $("#saldoCredito").text(total);
                                        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                                        var porcentaje = total * 0.3;
                                        porcentaje = porcentaje.toFixed(2);
                                        var saldo = total - porcentaje;
                                        $("#aCuenta").val(porcentaje);
                                        $("#saldo").val(saldo.toFixed(2));
                                        var slider = $("#porcentajepago").data("ionRangeSlider");
                                        // slider.update({
                                        //     min: 0,
                                        //     max: 100,
                                        //     from: 30
                                        // });
                                        $("#descuentos").val(1);
                                        $("#descuentos option:selected").val(1);
                                        $('#descuentos').material_select();
                                    }



                                });
                            });
                            //========================================


                        }
                    }

                );



                //=====================================================================================

            }

        });
    });




}

function cargarfactura2() {

    $("#mostrarimporte").text("0 %");
    var total = $("#total").text();
    $("#mostrardescuento").text(0);
    totalConDescuento = $("#total").text();
    $('#totalcondescuento').val(0);
    document.getElementById('totalfijo').innerHTML = total;
    $("#datosfactura tr").remove();
    var valor = LITERAL(total);
    var tabladatos = $('#datosfactura');
    $("#totalacobrarcondescuentoenlaventa").text(total);
    tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");

    var porcentaje = total * 0.3;
    porcentaje = porcentaje.toFixed(2);
    var saldo = total - porcentaje;
    $("#aCuenta").val(porcentaje);
    $("#saldo").val(saldo.toFixed(2));
    $("#mostrardescuento").text(0);
    $("#descuentos").val(1);
    $("#descuentos option:selected").val(1);
    $('#descuentos').material_select();

    $('#calculoEfectivoBs').val(0);
    $('#calculoEfectivoSus').val(0);
    $('#efectivoBs').val("0.00");
    $('#efectivoSus').val("0.00");
    $('#dBancoBs').val("");
    $('#dBancoSus').val("");
    $('#chequeBs').val("");
    $('#chequeSus').val("");
    $('#tDebitoBs').val("");
    $('#tDebitoSus').val("");
    $('#tCreditoBs').val("");
    $('#tCreditoSus').val("");


    var idmoned = $("#idMoneda").val();

    if (idmoned == 1) {//Bolivianos
        $("#money1").text("Bs.");
        $("#money2").text("Bs.");
        $("#money3").text("Bs.");
        $("#money4").text("Bs.");
        $("#money5").text("Bs.");
        $("#money6").text("Bs.");
        $("#money7").text("Bs.");
        totalConDescuento = $("#total").text();
        document.getElementById('totalfijo').innerHTML = total;
        $("#datosfactura tr").remove();
        var valor = LITERAL(total);
        var tabladatos = $('#datosfactura');
        $("#totalacobrarcondescuentoenlaventa").text(total);
        $("#saldoCredito").text(total);
        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
        var porcentaje = total * 0.3;
        porcentaje = porcentaje.toFixed(2);
        var saldo = total - porcentaje;
        $("#aCuenta").val(0);
        $("#saldo").val(total);


//        calcular_Bs();
//        calcular_Sus();
//        calcular_Banco_Bs();
//        calcular_Banco_Sus();
//        calcular_Cheque_Bs();
//        calcular_Cheque_Sus();
//        calcular_tCredito_Bs();
//        calcular_tCredito_Sus();
//        calcular_tDebito_Bs();
//        calcular_tDebito_Sus();

    } else {
        $("#money1").text("Sus.");
        $("#money2").text("Sus.");
        $("#money3").text("Sus.");
        $("#money4").text("Sus.");
        $("#money5").text("Sus.");
        $("#money6").text("Sus.");
        $("#money7").text("Sus.");
        totalConDescuento = $("#total").text();
        document.getElementById('totalfijo').innerHTML = total;
        $("#datosfactura tr").remove();

        var tipoCV = parseFloat($("#TCV").text());
        var totalConversion = parseFloat(total);
        var totaltotal = totalConversion * tipoCV;
        var redondeo = totaltotal.toFixed(2);
        var valorConversion = LITERAL(redondeo);
        $("#totalventaliteralSus").text(valorConversion);


        var valor = LITERALDOLAR(total);
        var tabladatos = $('#datosfactura');
        $("#totalacobrarcondescuentoenlaventa").text(total);
        $("#saldoCredito").text(total);
        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
        var porcentaje = total * 0.3;
        porcentaje = porcentaje.toFixed(2);
        var saldo = total - porcentaje;
        $("#aCuenta").val(0);
        $("#saldo").val(total);
        var slider = $("#porcentajepago").data("ionRangeSlider");
        // slider.update({
        //     min: 0,
        //     max: 100,
        //     from: 0
        // });
        $("#descuentos").val(1);
        $("#descuentos option:selected").val(1);
        $('#descuentos').material_select();

//        calcular_Bs();
//        calcular_Sus();
//        calcular_Banco_Bs();
//        calcular_Banco_Sus();
//        calcular_Cheque_Bs();
//        calcular_Cheque_Sus();
//        calcular_tCredito_Bs();
//        calcular_tCredito_Sus();
//        calcular_tDebito_Bs();
//        calcular_tDebito_Sus();
    }



}

//MIGUEL NUEVO TODA LA FUNCION
function ReiniciarCalcularPrecioFinal() {
    var total = $("#total").text();

    $("#mostrardescuento").text(0);
    $("#descuentos").val(1);
    $("#descuentos option:selected").val(1);
    $('#descuentos').material_select();
    $('#calculoEfectivoBs').val(0);
    $('#calculoEfectivoSus').val(0);

    $('#efectivoBs').val("0.00");
    $('#efectivoSus').val("0.00");
    $('#dBancoBs').val("");
    $('#dBancoSus').val("");
    $('#chequeBs').val("");
    $('#chequeSus').val("");
    $('#tDebitoBs').val("");
    $('#tDebitoSus').val("");
    $('#tCreditoBs').val("");
    $('#tCreditoSus').val("");
    var idmoned = $("#idMoneda").val();

    if (idmoned == 1) {//Bolivianos
        $("#money1").text("Bs.");
        $("#money2").text("Bs.");
        $("#money3").text("Bs.");
        $("#money4").text("Bs.");
        $("#money5").text("Bs.");
        $("#money6").text("Bs.");
        $("#money7").text("Bs.");
        totalConDescuento = $("#total").text();
        document.getElementById('totalfijo').innerHTML = total;
        $("#datosfactura tr").remove();
        var valor = LITERAL(total);
        var tabladatos = $('#datosfactura');
        $("#totalacobrarcondescuentoenlaventa").text(total);
        $("#saldoCredito").text(total);
        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
        var porcentaje = total * 0.3;
        porcentaje = porcentaje.toFixed(2);
        var saldo = total - porcentaje;
        $("#aCuenta").val(0);
        $("#saldo").val(total);

        calcular_Bs();
        calcular_Sus();
        calcular_Banco_Bs();
        calcular_Banco_Sus();
        calcular_Cheque_Bs();
        calcular_Cheque_Sus();
        calcular_tCredito_Bs();
        calcular_tCredito_Sus();
        calcular_tDebito_Bs();
        calcular_tDebito_Sus();

    } else {
        $("#money1").text("Sus.");
        $("#money2").text("Sus.");
        $("#money3").text("Sus.");
        $("#money4").text("Sus.");
        $("#money5").text("Sus.");
        $("#money6").text("Sus.");
        $("#money7").text("Sus.");
        totalConDescuento = $("#total").text();
        document.getElementById('totalfijo').innerHTML = total;
        $("#datosfactura tr").remove();

        var tipoCV = parseFloat($("#TCV").text());
        var totalConversion = parseFloat(total);
        var totaltotal = totalConversion * tipoCV;
        var redondeo = totaltotal.toFixed(2);
        var valorConversion = LITERAL(redondeo);
        $("#totalventaliteralSus").text(valorConversion);


        var valor = LITERALDOLAR(total);
        var tabladatos = $('#datosfactura');
        $("#totalacobrarcondescuentoenlaventa").text(total);
        $("#saldoCredito").text(total);
        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
        var porcentaje = total * 0.3;
        porcentaje = porcentaje.toFixed(2);
        var saldo = total - porcentaje;
        $("#aCuenta").val(0);
        $("#saldo").val(total);

        calcular_Bs();
        calcular_Sus();
        calcular_Banco_Bs();
        calcular_Banco_Sus();
        calcular_Cheque_Bs();
        calcular_Cheque_Sus();
        calcular_tCredito_Bs();
        calcular_tCredito_Sus();
        calcular_tDebito_Bs();
        calcular_tDebito_Sus();
    }



}

function cargarfactura() {

    $("#guardarfactura").show();

    $("#mostrarimporte").text("0 %");
    var total = $("#total").text();
    $("#mostrardescuento").text(0);
    totalConDescuento = $("#total").text();
    $('#totalcondescuento').val(0);
    document.getElementById('totalfijo').innerHTML = total;
    $("#datosfactura tr").remove();
    var valor = LITERAL(total);
    var tabladatos = $('#datosfactura');
    $("#totalacobrarcondescuentoenlaventa").text(total);
    tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");


    var porcentaje = total * 0.3;
    porcentaje = porcentaje.toFixed(2);
    var saldo = total - porcentaje;
    $("#aCuenta").val(porcentaje);
    $("#saldo").val(saldo.toFixed(2));
    $("#mostrardescuento").text(0);
    $("#descuentos").val(1);
    $("#descuentos option:selected").val(1);
    $('#descuentos').material_select();
    $('#calculoEfectivoBs').val(0);
    $('#calculoEfectivoSus').val(0);

    $('#efectivoBs').val("");
    $('#efectivoSus').val("");
    $('#dBancoBs').val("");
    $('#dBancoSus').val("");
    $('#chequeBs').val("");
    $('#chequeSus').val("");
    $('#tDebitoBs').val("");
    $('#tDebitoSus').val("");
    $('#tCreditoBs').val("");
    $('#tCreditoSus').val("");


    var total = $("#total").text();
    if (total == '0' || total == '0.00') {
        return swal({title: "Adverencia!",
//            text: "Venta Sin Detalle. Agregue Productos Para Poder Cobrar",
            text: "No se puede cobrar una venta sin importe!",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 2000});
    }

    var idventa = $('#venta').val();
    var route = "/DetalleVentaPrecios/" + idventa;
    $.get(route, function (res) {
        $(res).each(function (key, value) {

            var estado = value.mensaje;
            if (estado == 1) {    //Procede a abrir el modal de cobranza


                //=====================================================================================
                var idventa = $('#venta').val();

                var route = "/obtenerMoneda/" + idventa;
                $.get(route, function (res) {
                    $(res).each(function (key, value) {

                        $("#idMoneda").val(value.idMoneda);
                        var money = value.idMoneda;

                        if (money == 1) {//Bolivianos
                            $("#money1").text("Bs.");
                            $("#money2").text("Bs.");
                            $("#money3").text("Bs.");
                            $("#money4").text("Bs.");
                            $("#money5").text("Bs.");
                            $("#money6").text("Bs.");
                            $("#money7").text("Bs.");
                            totalConDescuento = $("#total").text();
                            document.getElementById('totalfijo').innerHTML = total;
                            $("#datosfactura tr").remove();
                            var valor = LITERAL(total);
                            var tabladatos = $('#datosfactura');
                            $("#totalacobrarcondescuentoenlaventa").text(total);
                            $("#saldoCredito").text(total);
                            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                            var porcentaje = total * 0.3;
                            porcentaje = porcentaje.toFixed(2);
                            var saldo = total - porcentaje;
                            $("#aCuenta").val(0);
                            $("#saldo").val(total);

                            var slider = $("#porcentajepago").data("ionRangeSlider");
                            // slider.update({
                            //     min: 0,
                            //     max: 100,
                            //     from: 0
                            // });
                            $("#descuentos").val(1);
                            $("#descuentos option:selected").val(1);
                            $('#descuentos').material_select();
                            $("#modal1").modal('open');
                            calcular_Efectivo_Bs();
                            calcular_Efectivo_Sus();
                            calcular_Banco_Bs();
                            calcular_Banco_Sus();
                            calcular_Cheque_Bs();
                            calcular_Cheque_Sus();
                            calcular_tCredito_Bs();
                            calcular_tCredito_Sus();
                            calcular_tDebito_Bs();
                            calcular_tDebito_Sus();

                        } else {
                            $("#money1").text("Sus.");
                            $("#money2").text("Sus.");
                            $("#money3").text("Sus.");
                            $("#money4").text("Sus.");
                            $("#money5").text("Sus.");
                            $("#money6").text("Sus.");
                            $("#money7").text("Sus.");
                            totalConDescuento = $("#total").text();
                            document.getElementById('totalfijo').innerHTML = total;
                            $("#datosfactura tr").remove();

                            var tipoCV = parseFloat($("#TCV").text());
                            var totalConversion = parseFloat(total);
                            var totaltotal = totalConversion * tipoCV;
                            var redondeo = totaltotal.toFixed(2);
                            var valorConversion = LITERAL(redondeo);
                            $("#totalventaliteralSus").text(valorConversion);


                            var valor = LITERALDOLAR(total);
                            var tabladatos = $('#datosfactura');
                            $("#totalacobrarcondescuentoenlaventa").text(total);
                            $("#saldoCredito").text(total);
                            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                            var porcentaje = total * 0.3;
                            porcentaje = porcentaje.toFixed(2);
                            var saldo = total - porcentaje;
                            $("#aCuenta").val(0);
                            $("#saldo").val(total);
                            var slider = $("#porcentajepago").data("ionRangeSlider");
                            // slider.update({
                            //     min: 0,
                            //     max: 100,
                            //     from: 0
                            // });
                            $("#descuentos").val(1);
                            $("#descuentos option:selected").val(1);
                            $('#descuentos').material_select();
                            $("#modal1").modal('open');
                            calcular_Bs();
                            calcular_Sus();
                            calcular_Banco_Bs();
                            calcular_Banco_Sus();
                            calcular_Cheque_Bs();
                            calcular_Cheque_Sus();
                            calcular_tCredito_Bs();
                            calcular_tCredito_Sus();
                            calcular_tDebito_Bs();
                            calcular_tDebito_Sus();
                        }
                    });
                });
            } else {  //No puede abrir el modal de cobranza por que hay producto en 0.
                swal({
                        title: "Uno o varios productos de la venta no tiene precio.",
                        text: "Desea continuar de todos modos?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Si, cobrar!",
                        cancelButtonText: "No, cancelar!",
                        closeOnConfirm: true,
                        closeOnCancel: true},
                    function (isConfirm) {
                        if (isConfirm) {
                            var idventa = $('#venta').val();
                            var route = "/obtenerMoneda/" + idventa;
                            $.get(route, function (res) {
                                $(res).each(function (key, value) {

                                    $("#idMoneda").val(value.idMoneda);
                                    var money = value.idMoneda;

                                    if (money == 1) {//Bolivianos
                                        $("#money1").text("Bs.");
                                        $("#money2").text("Bs.");
                                        $("#money3").text("Bs.");
                                        $("#money4").text("Bs.");
                                        $("#money5").text("Bs.");
                                        $("#money6").text("Bs.");
                                        $("#money7").text("Bs.");

                                        totalConDescuento = $("#total").text();
                                        document.getElementById('totalfijo').innerHTML = total;
                                        $("#datosfactura tr").remove();
                                        var valor = LITERAL(total);
                                        var tabladatos = $('#datosfactura');
                                        $("#totalacobrarcondescuentoenlaventa").text(total);
                                        $("#saldoCredito").text(total);
                                        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                                        var porcentaje = total * 0.3;
                                        porcentaje = porcentaje.toFixed(2);
                                        var saldo = total - porcentaje;
                                        $("#aCuenta").val(0);
                                        $("#saldo").val(total);
                                        var slider = $("#porcentajepago").data("ionRangeSlider");
                                        // slider.update({
                                        //     min: 0,
                                        //     max: 100,
                                        //     from: 0
                                        // });
                                        $("#descuentos").val(1);
                                        $("#descuentos option:selected").val(1);
                                        $('#descuentos').material_select();
                                        $("#modal1").modal('open');
                                        calcular_Bs();
                                        calcular_Sus();
                                        calcular_Banco_Bs();
                                        calcular_Banco_Sus();
                                        calcular_Cheque_Bs();
                                        calcular_Cheque_Sus();
                                        calcular_tCredito_Bs();
                                        calcular_tCredito_Sus();
                                        calcular_tDebito_Bs();
                                        calcular_tDebito_Sus();
                                    } else {
                                        $("#money1").text("Sus.");
                                        $("#money2").text("Sus.");
                                        $("#money3").text("Sus.");
                                        $("#money4").text("Sus.");
                                        $("#money5").text("Sus.");
                                        $("#money6").text("Sus.");
                                        $("#money7").text("Sus.");
                                        totalConDescuento = $("#total").text();
                                        document.getElementById('totalfijo').innerHTML = total;
                                        $("#datosfactura tr").remove();

                                        var tipoCV = parseFloat($("#TCV").text());
                                        var totalConversion = parseFloat(total);
                                        var totaltotal = totalConversion * tipoCV;
                                        var redondeo = totaltotal.toFixed(2);
                                        var valorConversion = LITERAL(redondeo);
                                        $("#totalventaliteralSus").text(valorConversion);


                                        var valor = LITERALDOLAR(total);
                                        var tabladatos = $('#datosfactura');
                                        $("#totalacobrarcondescuentoenlaventa").text(total);
                                        $("#saldoCredito").text(total);
                                        tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                                        var porcentaje = total * 0.3;
                                        porcentaje = porcentaje.toFixed(2);
                                        var saldo = total - porcentaje;
                                        $("#aCuenta").val(0);
                                        $("#saldo").val(total);
                                        var slider = $("#porcentajepago").data("ionRangeSlider");
                                        // slider.update({
                                        //     min: 0,
                                        //     max: 100,
                                        //     from: 0
                                        // });
                                        $("#descuentos").val(1);
                                        $("#descuentos option:selected").val(1);
                                        $('#descuentos').material_select();
                                        $("#modal1").modal('open');
                                        calcular_Bs();
                                        calcular_Sus();
                                        calcular_Banco_Bs();
                                        calcular_Banco_Sus();
                                        calcular_Cheque_Bs();
                                        calcular_Cheque_Sus();
                                        calcular_tCredito_Bs();
                                        calcular_tCredito_Sus();
                                        calcular_tDebito_Bs();
                                        calcular_tDebito_Sus();
                                    }
                                });
                            });
                        }
                    }
                );
            }
        });
    });



//    var idventa = $('#venta').val();
//
//    var route = "/obtenerMoneda/" + idventa;
//    $.get(route, function (res) {
//        $(res).each(function (key, value) {
//
//            $("#idMoneda").val(value.idMoneda);
//            var money = value.idMoneda;
//
//            if (money == 1) {//Bolivianos
//                totalConDescuento = $("#total").text();
//                document.getElementById('totalfijo').innerHTML = total;
//                $("#datosfactura tr").remove();
//                var valor = LITERAL(total);
//                var tabladatos = $('#datosfactura');
//                $("#totalacobrarcondescuentoenlaventa").text(total);
//                tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
//                var porcentaje = total * 0.3;
//                porcentaje = porcentaje.toFixed(2);
//                var saldo = total - porcentaje;
//                $("#aCuenta").val(porcentaje);
//                $("#saldo").val(saldo.toFixed(2));
//                var slider = $("#porcentajepago").data("ionRangeSlider");
//                slider.update({
//                    min: 0,
//                    max: 100,
//                    from: 30
//                });
//                $("#descuentos").val(1);
//                $("#descuentos option:selected").val(1);
//                $('#descuentos').material_select();
//                $("#modal1").modal('open');
//
//
//            } else {
//
//                totalConDescuento = $("#total").text();
//                document.getElementById('totalfijo').innerHTML = total;
//                $("#datosfactura tr").remove();
//
//                var tipoCV = parseFloat($("#TCV").text());
//                var totalConversion = parseFloat(total);
//                var totaltotal = totalConversion * tipoCV;
//                var redondeo = totaltotal.toFixed(2);
//                var valorConversion = LITERAL(redondeo);
//                $("#totalventaliteralSus").text(valorConversion);
//
//
//                var valor = LITERALDOLAR(total);
//                var tabladatos = $('#datosfactura');
//                $("#totalacobrarcondescuentoenlaventa").text(total);
//                tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
//                var porcentaje = total * 0.3;
//                porcentaje = porcentaje.toFixed(2);
//                var saldo = total - porcentaje;
//                $("#aCuenta").val(porcentaje);
//                $("#saldo").val(saldo.toFixed(2));
//                var slider = $("#porcentajepago").data("ionRangeSlider");
//                slider.update({
//                    min: 0,
//                    max: 100,
//                    from: 30
//                });
//                $("#descuentos").val(1);
//                $("#descuentos option:selected").val(1);
//                $('#descuentos').material_select();
//                $("#modal1").modal('open');
//            }
//
//
//
//        });
//    });




}

/*
 * Guardar la factura de una venta para su posteerior impresion
 */

$("#guardarfactura").click(function () {

                                var idpuntoventa = $("#vendedor").val(); //$("#iddelpuntoventa").val();

    var elemento1 = document.querySelector('#FomasPagos');
    var elemento2 = document.querySelector('#pagoCreditos');

    var fomasPagos = elemento1.getAttribute('class');
    var pagoCredito = elemento2.getAttribute('class');
    var idmoneda = idMoneda;
    var formData = '';
    var tipoCambio = $("#TCC").text();
    var id_almacen = $('#almacen').val();

    if (fomasPagos == "active") {
        var saldoBs = $("#saldoCreditoBs").text();
        var saldoSus = $("#saldoCreditoSus").text();
        if (saldoBs != 0 || saldoSus != 0) {
            swal({
                    title: "Advertencia, Queda saldo pendiente de cobro!",
                    text: "",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Continuar",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: true,
                    closeOnCancel: true},
                function (isConfirm) {
                    if (isConfirm) {
                        var totalsindesceutos = $("#total").text();
                        if (totalsindesceutos == '' || totalsindesceutos == "0") {
                            $("#modal1").modal('close');
                            return swal({title: "Adverencia!",
                                text: "Venta Sin Detalle. Agregue Productos Para Poder Cobrar",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        var idventa = $("#venta").val();
                        if (idventa == '') {
                            $('#generadordeventa').show();
                            $("#modal1").modal('close');
                            return swal({title: "Advertencia!",
                                text: "No Se Puede Cobrar una Venta que ha sido ya cobrada o Anulada. Por favor cree una nueva",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        var estado;
                        var route = "/Validarventaantigua/" + idventa;
                        $.get(route, function (res) {
                            estado = res;
                            if (estado == 2) {
                                $("#modal1").modal('close');
                                return swal({title: "Advertencia!",
                                    text: "No Se Puede Cobrar una Venta Anulada. Por favor cree una nueva",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 1500});
                            }
                            if (estado == 1 || estado == 5) {
                                $('#generadordeventa').show();
                                $("#modal1").modal('close');
                                return swal({title: "Advertencia!",
                                    text: "Esta Venta Ya Fue Cobrada. Por favor cree una nueva",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 1500});
                            }
                            if (estado == 0 || estado == 4) {
                                var etapa = 'venta';
                                var nombre = $("#razonsocial").val();
                                var nit = parseInt($("#nit").val()) + "";
                                var idCliente = $("#idCliente").val();
                                if (idCliente == "") {
                                    idCliente = 1;
                                }

                                var cuotasSaldo = parseInt($("#nrCuotas").val()) + "";
                                var cobrarCada = $("#cobrarCada").val();
                                var observaciones = $("#observaciones").val();

                                var efectivoBs = parseFloat($("#efectivoBs").val());
                                var efectivoSus = parseFloat($("#efectivoSus").val());
                                var dBancoBs = parseFloat($("#dBancoBs").val());
                                var dBancoSus = parseFloat($("#dBancoSus").val());
                                var chequeBs = parseFloat($("#chequeBs").val());
                                var chequeSus = parseFloat($("#chequeSus").val());
                                var tDebitoBs = parseFloat($("#tDebitoBs").val());
                                var tDebitoSus = parseFloat($("#tDebitoSus").val());
                                var tCreditoBs = parseFloat($("#tCreditoBs").val());
                                var tCreditoSus = parseFloat($("#tCreditoSus").val());

                                if (isNaN(efectivoBs) || efectivoBs == 0 || typeof efectivoBs == "undefined") {
                                    efectivoBs = 0;
                                }
                                if (isNaN(efectivoSus) || efectivoSus == 0 || typeof efectivoSus == "undefined") {
                                    efectivoSus = 0;
                                }

                                if (isNaN(dBancoBs) || dBancoBs == 0 || typeof dBancoBs == "undefined") {
                                    dBancoBs = 0;
                                }

                                if (isNaN(dBancoSus) || dBancoSus == 0 || typeof dBancoSus == "undefined") {
                                    dBancoSus = 0;
                                }

                                if (isNaN(chequeBs) || chequeBs == 0 || typeof chequeBs == "undefined") {
                                    chequeBs = 0;
                                }

                                if (isNaN(chequeSus) || chequeSus == 0 || typeof chequeSus == "undefined") {
                                    chequeSus = 0;
                                }

                                if (isNaN(tDebitoBs) || tDebitoBs == 0 || typeof tDebitoBs == "undefined") {
                                    tDebitoBs = 0;
                                }

                                if (isNaN(tDebitoSus) || tDebitoSus == 0 || typeof tDebitoSus == "undefined") {
                                    tDebitoSus = 0;
                                }

                                if (isNaN(tCreditoBs) || tCreditoBs == 0 || typeof tCreditoBs == "undefined") {
                                    tCreditoBs = 0;
                                }

                                if (isNaN(tCreditoSus) || tCreditoSus == 0 || typeof tCreditoSus == "undefined") {
                                    tCreditoSus = 0;
                                }

                                var saldoFormaPago = $("#saldoFormaPago").text();

                                if (saldoFormaPago < 0) {
                                    return swal({title: "Advertencia!",
                                        text: "Excede el monto en algunas formas de pago!",
                                        type: "warning",
                                        showConfirmButton: false,
                                        closeOnConfirm: false,
                                        timer: 1500});
                                }
                                var idViaPagoEfectivoBs;
                                var idViaPagoEfectivoSus;
                                var idViaPagodBancoBs;
                                var idViaPagodBancoSus;
                                var idViaPagochequeBs;
                                var idViaPagochequeSus;
                                var idViaPagotDebitoBs;
                                var idViaPagotDebitoSus;
                                var idViaPagotCreditoBs;
                                var idViaPagotCreditoSus;

                                var suma_total_efectivo = 0;
                                var suma_total_banco = 0;
                                var suma_total_cheque = 0;
                                var suma_total_tdebito = 0;
                                var suma_total_tcredito = 0;

                                if (efectivoBs != "" || efectivoBs != 0 || !isNaN(efectivoBs)) {
                                    if ($('#select_caja').val() != '0') {
                                        idViaPagoEfectivoBs = 1;
                                        formData = formData + '&pago_efectivo_bs=' + idViaPagoEfectivoBs;
                                        formData = formData + '&monto_efectivo_bs=' + efectivoBs;
                                        if (idmoneda == 1){
                                            suma_total_efectivo = parseFloat(suma_total_efectivo) + efectivoBs;
                                        }else {
                                            suma_total_efectivo = suma_total_efectivo + (efectivoSus / tipoCambio);
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (efectivoSus != "" || efectivoSus != 0 || !isNaN(efectivoSus)) {
                                    if ($('#select_caja').val() != '0') {
                                        idViaPagoEfectivoSus = 1;
                                        formData = formData + '&pago_efectivo_sus=' + idViaPagoEfectivoSus;
                                        formData = formData + '&monto_efectivo_sus=' + efectivoSus;
                                        if (idmoneda == 1){
                                            suma_total_efectivo = suma_total_efectivo + (efectivoSus * tipoCambio);
                                        }else{
                                            suma_total_efectivo = suma_total_efectivo + efectivoSus;
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (dBancoBs != "" || dBancoBs != 0 || !isNaN(dBancoBs)) {
                                    if ($('#select_banco').val() != '0') {
                                        idViaPagodBancoBs = 1;
                                        formData = formData + '&pago_banco_bs=' + idViaPagodBancoBs;
                                        formData = formData + '&monto_banco_bs=' + dBancoBs;
                                        if (idmoneda == 1){
                                            suma_total_banco = suma_total_banco + dBancoBs;
                                        }else{
                                            suma_total_banco = suma_total_banco + (dBancoBs / tipoCambio);
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (dBancoSus != "" || dBancoSus != 0 || !isNaN(dBancoSus)) {
                                    if ($('#select_banco').val() != '0') {
                                        idViaPagodBancoSus = 1;
                                        formData = formData + '&pago_banco_sus=' + idViaPagodBancoSus;
                                        formData = formData + '&monto_banco_sus=' + dBancoSus;
                                        if (idmoneda == 1){
                                            suma_total_banco = suma_total_banco +(dBancoSus * tipoCambio)
                                        }else{
                                            suma_total_banco = suma_total_banco + dBancoSus
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (chequeBs != "" || chequeBs != 0 || !isNaN(chequeBs)) {
                                    if ($('#select_cuenta_cheque').val() != '0') {
                                        idViaPagochequeBs = 1;

                                        formData = formData + '&pago_cheque_bs=' + idViaPagochequeBs;
                                        formData = formData + '&monto_cheque_bs=' + chequeBs;
                                        suma_total_cheque = suma_total_cheque + chequeBs;
                                        if (idmoneda == 1){
                                            suma_total_cheque = suma_total_cheque + chequeBs;
                                        }else {
                                            suma_total_cheque = suma_total_cheque + (chequeBs / tipoCambio);
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (chequeSus != "" || chequeSus != 0 || !isNaN(chequeSus)) {
                                    if ($('#select_cuenta_cheque').val() != '0') {
                                        idViaPagochequeSus = 1;

                                        formData = formData + '&pago_cheque_sus=' + idViaPagochequeSus;
                                        formData = formData + '&monto_cheque_sus=' + chequeSus;
                                        if (idmoneda == 1){
                                            suma_total_cheque = suma_total_cheque + (chequeSus / tipoCambio);
                                        }else {
                                            suma_total_cheque = suma_total_cheque + chequeSus;
                                        }
                                    } else {
                                        return swal({
                                            title: "Advetencia!",
                                            text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 2000
                                        });
                                        return true;
                                    }
                                }
                                if (tDebitoBs != "" || tDebitoBs != 0 || !isNaN(tDebitoBs)) {
                                    if ($('#select_cuenta_debito').val() != '0') {
                                        idViaPagotDebitoBs = 1;
                                        formData = formData + '&pago_debito_bs=' + idViaPagotDebitoBs;
                                        formData = formData + '&monto_debito_bs=' + tDebitoBs;
                                        formData = formData + '&tarjeta_debito='+ $('#tarjeta_debito').val();
                                        if (idmoneda == 1){
                                            suma_total_tdebito = suma_total_tdebito + tDebitoBs;
                                        }else {
                                            suma_total_tdebito = suma_total_tdebito + (tDebitoBs / tipoCambio);
                                        }
                                    } else {
                                        if ($('#tarjeta_debito').val() == '') {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "El numero de tarjeta de debito es requerido",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        } else {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        }
                                    }
                                }
                                if (tDebitoSus != "" || tDebitoSus != 0 || !isNaN(tDebitoSus)) {
                                    if ($('#select_cuenta_debito').val() != '0') {
                                        idViaPagotDebitoSus = 1;
                                        formData = formData + '&pago_debito_sus=' + idViaPagotDebitoSus;
                                        formData = formData + '&monto_debito_sus=' + tDebitoSus;
                                        formData = formData + '&tarjeta_debito='+ $('#tarjeta_debito').val();
                                        if (idmoneda == 1){
                                            suma_total_tdebito =  suma_total_tdebito + (tDebitoSus * tipoCambio);
                                        }else {
                                            suma_total_tdebito =  suma_total_tdebito + tDebitoSus;
                                        }
                                    } else {
                                        if ($('#tarjeta_debito').val() == '') {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "El numero de tarjeta de debito es requerido",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        } else {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        }
                                    }
                                }
                                if (tCreditoBs != "" || tCreditoBs != 0 || !isNaN(tCreditoBs)) {
                                    if ($('#select_cuenta_credito').val() != '0') {
                                        idViaPagotCreditoBs = 1;
                                        formData = formData + '&pago_credito_bs=' + idViaPagotCreditoBs;
                                        formData = formData + '&monto_credito_bs=' + tCreditoBs;
                                        formData = formData + '&tarjeta_credito='+ $('#tarjeta_credito').val();
                                        if (idmoneda == 1){
                                            suma_total_tcredito = suma_total_tcredito + tCreditoBs;
                                        }else {
                                            suma_total_tcredito = suma_total_tcredito + (tCreditoBs / tipoCambio);
                                        }
                                    } else {
                                        if ($('#tarjeta_credito').val() == '') {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "El numero de tarjeta de credito es requerido",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        } else {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        }
                                    }
                                }
                                if (tCreditoSus != "" || tCreditoSus != 0 || !isNaN(tCreditoSus)) {
                                    if ($('#select_cuenta_credito').val() != '0') {
                                        idViaPagotCreditoSus = 1;
                                        formData = formData + '&monto_credito_sus=' + idViaPagotCreditoSus;
                                        formData = formData + '&monto_credito_sus=' + tCreditoSus;
                                        formData = formData + '&tarjeta_credito='+ $('#tarjeta_credito').val();
                                        if (idmoneda == 1){
                                            suma_total_tcredito = suma_total_tcredito + (tCreditoSus * tipoCambio);
                                        }else {
                                            suma_total_tcredito = suma_total_tcredito + tCreditoSus;
                                        }
                                    } else {
                                        if ($('#tarjeta_credito').val() == '') {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "El numero de tarjeta de credito es requerido",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        } else {
                                            return swal({
                                                title: "Advetencia!",
                                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 2000
                                            });
                                            return true;
                                        }
                                    }
                                }

                                formData = formData+'&caja_id='+ $('#select_caja').val();
                                formData = formData+'&cuenta_banco_id='+ $('#select_banco').val();
                                formData = formData+'&cuenta_cheque_id='+ $('#select_cuenta_cheque').val();
                                formData = formData+'&cuenta_tdebito_id='+ $('#select_cuenta_debito').val();
                                formData = formData+'&cuenta_tcredito_id='+ $('#select_cuenta_credito').val();

                                formData = formData+'&total_efectivo='+suma_total_efectivo;
                                formData = formData+'&total_banco='+suma_total_banco;
                                formData = formData+'&total_cheque='+suma_total_cheque;
                                formData = formData+'&total_debito='+suma_total_tdebito;
                                formData = formData+'&total_credito='+suma_total_tcredito;

                                var pagos;
                                var cambio;
                                var nroCuenta;
                                var pago;
                                cambio = parseInt($("#cambio").text());

                                if (parseFloat(saldoACobrar) != 0) {
                                    //Mostrar una Advertencia de que se cobrara con credito!!!!!!
                                    etapa = 'credito';
                                    if (pagoCredito == "active") {
                                        if (cobrarCada == null) {
                                            return swal({title: "Advertencia!",
                                                text: "Debe seleccionar el plan de pago!",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        if (!aCuenta || !aCuenta.trim().length || !saldoACobrar || !saldoACobrar.trim().length || !cuotasSaldo || !cuotasSaldo.trim().length || !cobrarCada || !cobrarCada.trim().length) {
                                            return swal({title: "Advertencia!",
                                                text: "Debe ingresar todos los datos del credito",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        if (parseFloat(saldoACobrar) <= 0) {
                                            return swal({title: "Advertencia!",
                                                text: "EL saldo del credito debe ser mayor a 0.",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        if (parseFloat(aCuenta) < 0) {
                                            return swal({title: "Advertencia!",
                                                text: "EL pago inicial debe ser mayor a 0",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        if (parseInt(cuotasSaldo) <= 0) {
                                            return swal({title: "Advertencia!",
                                                text: "La cantidad de cuotas del credito deben ser mayor a 0",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        if (idCliente == "" || idCliente == 1) {
                                            return swal({title: "Advertencia!",
                                                text: "No se puede realizar un credito sin un cliente, seleccionado",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }
                                        var importe = parseFloat(saldoACobrar) / parseFloat(cuotasSaldo);
                                        if (importe < 1) {
                                            return swal({title: "Advertencia!",
                                                text: "El numero de cuotas es muy elevado para el saldo del credito",
                                                type: "warning",
                                                showConfirmButton: false,
                                                closeOnConfirm: false,
                                                timer: 1500});
                                        }

                                    } else {
                                        return;
                                    }
                                }
                                var idelemeplaedo = $("#iddelempleado").val();
                                var idmesas = $("#mesa").val();
                                var totalcondescuento = $("#totalcondescuentoventa").text();
                                var totalliteralventa = $("#totalventaliteral").text();

                                var totalliteralDeSusABs = $("#totalventaliteralSus").text();

                                var idTipoDescuento = $("#descuentos").val();
                                var porcentajedescuento;
                                var importedescuento = $("#mostrardescuento").text();
                                var descuentoPorcentaje = document.getElementById('descuentoP').checked;
                                if (descuentoPorcentaje == true) {
                                    porcentajedescuento = descuent;
                                } else {
                                    porcentajedescuento = $("#mostrarimporte").text();
                                    parseFloat(porcentajedescuento);
                                    if (porcentajedescuento < 0) {
                                        return swal({title: "Advertencia!",
                                            text: "El Descuento Excede lo Permitido",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 1500});
                                    }
                                    parseFloat(totalsindesceutos);
                                    parseFloat(totalcondescuento);
                                    importedescuento = totalsindesceutos - totalcondescuento;
                                }
                                var confactura = document.getElementById('sifactura').checked;
                                var con_factura = 0;
                                if (confactura){
                                    con_factura = 1;
                                }
                                if (confactura) {
                                    if (!nombre || !nombre.trim().length) {
                                        return swal({title: "Advertencia!",
                                            text: "Debe ingresar la Razon Social del cliente para la facturacion",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 1500});
                                    }
                                    if (!nit || !nit.trim().length) {
                                        return swal({title: "Advertencia!",
                                            text: "Debe ingresar el NIT del cliente para la facturacion",
                                            type: "warning",
                                            showConfirmButton: false,
                                            closeOnConfirm: false,
                                            timer: 1500});
                                    }
                                }
                                var conenvio = false;//document.getElementById('test22').checked;
                                var FechaEntrega = $("#fechaentrega").val();
                                var HoraEntrega = $("#horaentrega").val();
                                var idventa = $('#venta').val();
                                var PersonaRecibeenvio = $("#personarecibeenvio").val();
                                var DireccionEnvio = $("#dirreccionenvio").val();
                                var Importetransporte = $("#importetransporte").val();
                                var ci = $("#ci").val();
                                var celular = $("#celulars").val();
                                var departamento = $("#ciudadd").val();
                                var estadoenvio;
                                if (conenvio == true) {
                                    estadoenvio = 2;
                                    if (!PersonaRecibeenvio || !PersonaRecibeenvio.trim().length) {
                                        return Materialize.toast('Persona Recibe envio Es obligatorio', 1000, 'rounded');
                                    }
                                    if (!ci || !ci.trim().length) {
                                        return Materialize.toast('La Cedula de Identidad Es obligatorio', 1000, 'rounded');
                                    } else {
                                        ci = parseInt($("#ci").val());
                                    }
                                    if (!celular || !celular.trim().length) {
                                        return Materialize.toast('El telefono Es obligatorio', 1000, 'rounded');
                                    } else {
                                        celular = parseInt($("#celulars").val());
                                    }
                                    if (!DireccionEnvio || !DireccionEnvio.trim().length) {
                                        return Materialize.toast('Direccion Envío Es obligatorio', 1000, 'rounded');
                                    }
                                    if (!Importetransporte || !Importetransporte.trim().length) {
                                        return Materialize.toast('Importe transporte Es obligatorio', 1000, 'rounded');
                                    }
                                    if (!FechaEntrega || !FechaEntrega.trim().length) {
                                        return Materialize.toast('Fecha Entrega Es obligatorio', 1000, 'rounded');
                                    }
                                    if (!HoraEntrega || !HoraEntrega.trim().length) {
                                        return Materialize.toast('Hora Entrega Es obligatorio', 1000, 'rounded');
                                    }
                                } else {
                                    PersonaRecibeenvio = "S/R";
                                    DireccionEnvio = "S/E";
                                    Importetransporte = "S/T";
                                    FechaEntrega = "";
                                    HoraEntrega = "";
                                    estadoenvio = 1;
                                    ci = 0;
                                    celular = 0;
                                    departamento = 0;
                                }
                                var garantia = parseInt($("#impgarantia").val());
                                var vendedor = $("#vendedor").val();
                                var token = $("#token").val();
                                var route = "/Factura";
                                var aCuenta = parseFloat($("#totafijo").val()) - parseFloat(suma_total_efectivo) + parseFloat(suma_total_banco)+ parseFloat(suma_total_cheque)+ parseFloat(suma_total_tdebito)+ parseFloat(suma_total_tcredito);

                                var saldoACobrar = $("#saldoCreditoBs").val();
                                formData = formData + '&idTipoDescuento='+idTipoDescuento + '&porcentajedescuento='+porcentajedescuento+
                                    '&importedescuento='+importedescuento+'&cambio='+cambio+'&idventa='+idventa+
                                    '&idpuntoventa='+idpuntoventa+'&total='+totalcondescuento+'&totaltotal='+totalsindesceutos+
                                    '&valorliteral='+totalliteralventa+'&totalliteralDeSusABs='+totalliteralDeSusABs+'&nombre='+nombre+
                                    '&nit='+nit+'&idelemeplaedo='+idelemeplaedo+'&pago='+pago+'&idmesas='+idmesas+'&aCuenta='+aCuenta+
                                    '&saldoACobrar='+saldoACobrar+'&cuotasSaldo='+cuotasSaldo+'&cobrarCada='+cobrarCada+
                                    '&idCliente='+ idCliente+'&facturacredito='+confactura+'&observaciones='+observaciones+
                                    '&garantia='+garantia+'&DireccionEnvio='+DireccionEnvio+'&Importetransporte='+Importetransporte+
                                    '&FechaEntrega='+FechaEntrega+'&HoraEntrega='+HoraEntrega+'&estadoenvio='+estadoenvio+
                                    '&celular='+celular+'&departamento='+departamento+'&nroCuenta='+nroCuenta+
                                    '&PersonaRecibeenvio='+PersonaRecibeenvio+'&etapa='+etapa+'&efectivoBs='+efectivoBs+
                                    '&efectivoSus='+efectivoSus+'&dBancoBs='+dBancoBs+'&dBancoSus='+dBancoSus+'&chequeBs='+chequeBs+
                                    '&chequeSus='+chequeSus+'&tDebitoBs='+tDebitoBs+'&tDebitoSus='+tDebitoSus+
                                    '&tCreditoBs='+tCreditoBs+'&tCreditoSus='+tCreditoSus+'&idViaPagoEfectivoBs='+idViaPagoEfectivoBs+
                                    '&idViaPagoEfectivoSus='+idViaPagoEfectivoSus+'&idViaPagodBancoBs='+idViaPagodBancoBs+
                                    '&idViaPagodBancoSus='+idViaPagodBancoSus+'&idViaPagochequeBs='+idViaPagodBancoSus+
                                    '&idViaPagochequeSus='+idViaPagochequeSus+'&idViaPagotDebitoBs='+idViaPagotDebitoBs+
                                    '&idViaPagotDebitoSus='+idViaPagotDebitoSus+'&idViaPagotCreditoBs='+idViaPagotCreditoBs+
                                    '&idViaPagotCreditoSus='+idViaPagotCreditoSus+'&con_factura='+con_factura+'&almacen='+id_almacen;
                                swal({
                                        title: "Esta seguro que desea registrar esta transaccion?",
                                        text: "El estado del registro cambiara y se generan otros registros a nivel contable",
                                        type: "warning",
                                        showCancelButton: true,
                                        confirmButtonColor: "#DD6B55",
                                        confirmButtonText: "Si, realizar transaccion!",
                                        cancelButtonText: "No, cancelar",
                                        closeOnConfirm: false,
                                        closeOnCancel: true
                                    },
                                    function (isConfirm) {
                                        if (isConfirm) {
                                            console.log(formData)
                                            ajaxStart('Generando Factura, por favor espere...')
                                            $.ajax({
                                                url: route,
                                                headers: {'X-CSRF-TOKEN': token},
                                                type: 'POST',
                                                dataType: 'json',
                                                data: formData,
                                                success: function (result) {
                                                    var nFactura;
                                                    if (result == "No se puede generar factura porque no existe libro de órdenes activos") {
                                                        return Materialize.toast(result, 1000, 'rounded');
                                                    }
                                                    if (result == "Fecha limite a Terminado") {
                                                        return Materialize.toast(result, 1000, 'rounded');
                                                    }
                                                    if (result == "limite de numero de factura") {
                                                        return  Materialize.toast(result, 1000, 'rounded');
                                                    } else {
                                                        console.log(result.data);
                                                        nFactura = result.data;
                                                        $("#datos tr").remove();
                                                        $("#resultadoprodcuto tr").remove();
                                                        $("#datosfactura tr").remove();
                                                        $('#razonsocial').val("");
                                                        $('#nit').val("");
                                                        $('#importe').val("");
                                                        $('#totals').val("0");
                                                        $('#venta').val("");
                                                        document.getElementById('total').innerHTML = "0";
                                                        $("#modal1").modal('close');
                                                        Materialize.toast('Guardado Exitoso', 1000, 'rounded');
                                                        if (confactura == true) {
                                                            window.open("/imprirfactura/" + nFactura);
                                                        } else {
                                                            window.open("/imprimirnotaventa/" + idventa);
                                                        }
                                                        window.location.href = '/listadeventa';
                                                    }
                                                    ajaxStop();
                                                }, error: function () {
                                                    swal({title: "Error!",
                                                        type: "warning",
                                                        showConfirmButton: false,
                                                        closeOnConfirm: false,
                                                        timer: 1500});
//                    window.location.reload();
                                                }
                                            });
                                        } /*else {
                                                swal("Cancelado", "Accion cancelada.", "error");
                                            }*/
                                    });
                            }
                        });
                    } else {
                        //cancelar!!
                        swal({title: "CANCELADO",
                            type: "error",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                        ajaxStop();
                    }
                });
        } else {
            var totalsindesceutos = $("#total").text();
            if (totalsindesceutos == '' || totalsindesceutos == "0") {
                $("#modal1").modal('close');
                return swal({title: "Adverencia!",
                    text: "Venta Sin Detalle. Agregue Productos Para Poder Cobrar",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1500});
            }
            var idventa = $("#venta").val();
            if (idventa == '') {
                $('#generadordeventa').show();
                $("#modal1").modal('close');
                return swal({title: "Advertencia!",
                    text: "No Se Puede Cobrar una Venta que ha sido ya cobrada o Anulada. Por favor cree una nueva",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1500});
            }
            var estado;
            var route = "/Validarventaantigua/" + idventa;
            $.get(route, function (res) {
                estado = res;
                if (estado == 2) {
                    $("#modal1").modal('close');
                    return swal({title: "Advertencia!",
                        text: "No Se Puede Cobrar una Venta Anulada. Por favor cree una nueva",
                        type: "warning",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1500});
                }
                if (estado == 1 || estado == 5) {
                    $('#generadordeventa').show();
                    $("#modal1").modal('close');
                    return swal({title: "Advertencia!",
                        text: "Esta Venta Ya Fue Cobrada. Por favor cree una nueva",
                        type: "warning",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1500});
                }
                if (estado == 0 || estado == 4) {
                    var etapa = 'venta';
                    var nombre = $("#razonsocial").val();
                    var nit = parseInt($("#nit").val()) + "";
                    var idCliente = $("#idCliente").val();
                    if (idCliente == "") {
                        idCliente = 1;
                    }

                    var aCuenta = parseFloat($("#aCuenta").val()) + "";
                    var saldoACobrar = $("#saldo").val();
                    var cuotasSaldo = parseInt($("#nrCuotas").val()) + "";
                    var cobrarCada = $("#cobrarCada").val();
                    var observaciones = $("#observaciones").val();

                    var efectivoBs = parseFloat($("#efectivoBs").val());
                    var efectivoSus = parseFloat($("#efectivoSus").val());
                    var dBancoBs = parseFloat($("#dBancoBs").val());
                    var dBancoSus = parseFloat($("#dBancoSus").val());
                    var chequeBs = parseFloat($("#chequeBs").val());
                    var chequeSus = parseFloat($("#chequeSus").val());
                    var tDebitoBs = parseFloat($("#tDebitoBs").val());
                    var tDebitoSus = parseFloat($("#tDebitoSus").val());
                    var tCreditoBs = parseFloat($("#tCreditoBs").val());
                    var tCreditoSus = parseFloat($("#tCreditoSus").val());

                    if (isNaN(efectivoBs) || efectivoBs == 0 || typeof efectivoBs == "undefined") {
                        efectivoBs = 0;
                    }
                    if (isNaN(efectivoSus) || efectivoSus == 0 || typeof efectivoSus == "undefined") {
                        efectivoSus = 0;
                    }

                    if (isNaN(dBancoBs) || dBancoBs == 0 || typeof dBancoBs == "undefined") {
                        dBancoBs = 0;
                    }

                    if (isNaN(dBancoSus) || dBancoSus == 0 || typeof dBancoSus == "undefined") {
                        dBancoSus = 0;
                    }

                    if (isNaN(chequeBs) || chequeBs == 0 || typeof chequeBs == "undefined") {
                        chequeBs = 0;
                    }

                    if (isNaN(chequeSus) || chequeSus == 0 || typeof chequeSus == "undefined") {
                        chequeSus = 0;
                    }

                    if (isNaN(tDebitoBs) || tDebitoBs == 0 || typeof tDebitoBs == "undefined") {
                        tDebitoBs = 0;
                    }

                    if (isNaN(tDebitoSus) || tDebitoSus == 0 || typeof tDebitoSus == "undefined") {
                        tDebitoSus = 0;
                    }

                    if (isNaN(tCreditoBs) || tCreditoBs == 0 || typeof tCreditoBs == "undefined") {
                        tCreditoBs = 0;
                    }

                    if (isNaN(tCreditoSus) || tCreditoSus == 0 || typeof tCreditoSus == "undefined") {
                        tCreditoSus = 0;
                    }
                    var saldoFormaPago = $("#saldoFormaPago").text();
                    if (saldoFormaPago < 0) {
                        return swal({title: "Advertencia!",
                            text: "Excede el monto en algunas formas de pago!",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1500});

                    }

                    var idViaPagoEfectivoBs = 0;
                    var idViaPagoEfectivoSus = 0;
                    var idViaPagodBancoBs = 0;
                    var idViaPagodBancoSus = 0;
                    var idViaPagochequeBs = 0;
                    var idViaPagochequeSus = 0;
                    var idViaPagotDebitoBs = 0;
                    var idViaPagotDebitoSus = 0;
                    var idViaPagotCreditoBs = 0;
                    var idViaPagotCreditoSus = 0;

                    var suma_total_efectivo = 0;
                    var suma_total_banco = 0;
                    var suma_total_cheque = 0;
                    var suma_total_tdebito = 0;
                    var suma_total_tcredito = 0;

                    if (efectivoBs != "" || efectivoBs != 0 || !isNaN(efectivoBs)) {
                        if ($('#select_caja').val() != '0') {
                            idViaPagoEfectivoBs = 1;
                            formData = formData + '&pago_efectivo_bs=' + idViaPagoEfectivoBs;
                            formData = formData + '&monto_efectivo_bs=' + efectivoBs;
                            if (idmoneda == 1){
                                suma_total_efectivo = suma_total_efectivo + efectivoBs;
                            }else {
                                suma_total_efectivo = suma_total_efectivo + (efectivoSus / tipoCambio);
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (efectivoSus != "" || efectivoSus != 0 || !isNaN(efectivoSus)) {
                        if ($('#select_caja').val() != '0') {
                            idViaPagoEfectivoSus = 1;
                            formData = formData + '&pago_efectivo_sus=' + idViaPagoEfectivoSus;
                            formData = formData + '&monto_efectivo_sus=' + efectivoSus;
                            if (idmoneda == 1){
                                suma_total_efectivo = suma_total_efectivo + (efectivoSus * tipoCambio);
                            }else{
                                suma_total_efectivo = suma_total_efectivo + efectivoSus;
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (dBancoBs != "" || dBancoBs != 0 || !isNaN(dBancoBs)) {
                        if ($('#select_banco').val() != '0') {
                            idViaPagodBancoBs = 1;
                            formData = formData + '&pago_banco_bs=' + idViaPagodBancoBs;
                            formData = formData + '&monto_banco_bs=' + dBancoBs;
                            if (idmoneda == 1){
                                suma_total_banco = suma_total_banco + dBancoBs;
                            }else{
                                suma_total_banco = suma_total_banco + (dBancoBs / tipoCambio);
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (dBancoSus != "" || dBancoSus != 0 || !isNaN(dBancoSus)) {
                        if ($('#select_banco').val() != '0') {
                            idViaPagodBancoSus = 1;
                            formData = formData + '&pago_banco_sus=' + idViaPagodBancoSus;
                            formData = formData + '&monto_banco_sus=' + dBancoSus;
                            if (idmoneda == 1){
                                suma_total_banco = suma_total_banco +(dBancoSus * tipoCambio)
                            }else{
                                suma_total_banco = suma_total_banco + dBancoSus
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (chequeBs != "" || chequeBs != 0 || !isNaN(chequeBs)) {
                        if ($('#select_cuenta_cheque').val() != '0') {
                            idViaPagochequeBs = 1;

                            formData = formData + '&pago_cheque_bs=' + idViaPagochequeBs;
                            formData = formData + '&monto_cheque_bs=' + chequeBs;
                            suma_total_cheque = suma_total_cheque + chequeBs;
                            if (idmoneda == 1){
                                suma_total_cheque = suma_total_cheque + chequeBs;
                            }else {
                                suma_total_cheque = suma_total_cheque + (chequeBs / tipoCambio);
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (chequeSus != "" || chequeSus != 0 || !isNaN(chequeSus)) {
                        if ($('#select_cuenta_cheque').val() != '0') {
                            idViaPagochequeSus = 1;

                            formData = formData + '&pago_cheque_sus=' + idViaPagochequeSus;
                            formData = formData + '&monto_cheque_sus=' + chequeSus;
                            if (idmoneda == 1){
                                suma_total_cheque = suma_total_cheque + (chequeSus / tipoCambio);
                            }else {
                                suma_total_cheque = suma_total_cheque + chequeSus;
                            }
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                    if (tDebitoBs != "" || tDebitoBs != 0 || !isNaN(tDebitoBs)) {
                        if ($('#select_cuenta_debito').val() != '0') {
                            idViaPagotDebitoBs = 1;
                            formData = formData + '&pago_debito_bs=' + idViaPagotDebitoBs;
                            formData = formData + '&monto_debito_bs=' + tDebitoBs;
                            formData = formData + '&tarjeta_debito='+ $('#tarjeta_debito').val();
                            if (idmoneda == 1){
                                suma_total_tdebito = suma_total_tdebito + tDebitoBs;
                            }else {
                                suma_total_tdebito = suma_total_tdebito + (tDebitoBs / tipoCambio);
                            }
                        } else {
                            if ($('#tarjeta_debito').val() == '') {
                                return swal({
                                    title: "Advetencia!",
                                    text: "El numero de tarjeta de debito es requerido",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            } else {
                                return swal({
                                    title: "Advetencia!",
                                    text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            }
                        }
                    }
                    if (tDebitoSus != "" || tDebitoSus != 0 || !isNaN(tDebitoSus)) {
                        if ($('#select_cuenta_debito').val() != '0') {
                            idViaPagotDebitoSus = 1;
                            formData = formData + '&pago_debito_sus=' + idViaPagotDebitoSus;
                            formData = formData + '&monto_debito_sus=' + tDebitoSus;
                            formData = formData + '&tarjeta_debito='+ $('#tarjeta_debito').val();
                            if (idmoneda == 1){
                                suma_total_tdebito =  suma_total_tdebito + (tDebitoSus * tipoCambio);
                            }else {
                                suma_total_tdebito =  suma_total_tdebito + tDebitoSus;
                            }
                        } else {
                            if ($('#tarjeta_debito').val() == '') {
                                return swal({
                                    title: "Advetencia!",
                                    text: "El numero de tarjeta de debito es requerido",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            } else {
                                return swal({
                                    title: "Advetencia!",
                                    text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            }
                        }
                    }
                    if (tCreditoBs != "" || tCreditoBs != 0 || !isNaN(tCreditoBs)) {
                        if ($('#select_cuenta_credito').val() != '0') {
                            idViaPagotCreditoBs = 1;
                            formData = formData + '&pago_credito_bs=' + idViaPagotCreditoBs;
                            formData = formData + '&monto_credito_bs=' + tCreditoBs;
                            formData = formData + '&tarjeta_credito='+ $('#tarjeta_credito').val();
                            if (idmoneda == 1){
                                suma_total_tcredito = suma_total_tcredito + tCreditoBs;
                            }else {
                                suma_total_tcredito = suma_total_tcredito + (tCreditoBs / tipoCambio);
                            }
                        } else {
                            if ($('#tarjeta_credito').val() == '') {
                                return swal({
                                    title: "Advetencia!",
                                    text: "El numero de tarjeta de credito es requerido",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            } else {
                                return swal({
                                    title: "Advetencia!",
                                    text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            }
                        }
                    }
                    if (tCreditoSus != "" || tCreditoSus != 0 || !isNaN(tCreditoSus)) {
                        if ($('#select_cuenta_credito').val() != '0') {
                            idViaPagotCreditoSus = 1;
                            formData = formData + '&monto_credito_sus=' + idViaPagotCreditoSus;
                            formData = formData + '&monto_credito_sus=' + tCreditoSus;
                            formData = formData + '&tarjeta_credito='+ $('#tarjeta_credito').val();
                            if (idmoneda == 1){
                                suma_total_tcredito = suma_total_tcredito + (tCreditoSus * tipoCambio);
                            }else {
                                suma_total_tcredito = suma_total_tcredito + tCreditoSus;
                            }
                        } else {
                            if ($('#tarjeta_credito').val() == '') {
                                return swal({
                                    title: "Advetencia!",
                                    text: "El numero de tarjeta de credito es requerido",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            } else {
                                return swal({
                                    title: "Advetencia!",
                                    text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                    type: "warning",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 2000
                                });
                                return true;
                            }
                        }
                    }

                    formData = formData+'&caja_id='+ $('#select_caja').val();
                    formData = formData+'&cuenta_banco_id='+ $('#select_banco').val();
                    formData = formData+'&cuenta_cheque_id='+ $('#select_cuenta_cheque').val();
                    formData = formData+'&cuenta_tdebito_id='+ $('#select_cuenta_debito').val();
                    formData = formData+'&cuenta_tcredito_id='+ $('#select_cuenta_credito').val();

                    formData = formData+'&total_efectivo='+suma_total_efectivo;
                    formData = formData+'&total_banco='+suma_total_banco;
                    formData = formData+'&total_cheque='+suma_total_cheque;
                    formData = formData+'&total_debito='+suma_total_tdebito;
                    formData = formData+'&total_credito='+suma_total_tcredito;

                    var pagos;
                    var cambio;
                    var nroCuenta;
                    var pago;
                    cambio = parseInt($("#cambio").text());

                    if (parseFloat(saldoACobrar) != 0) {
                        //Mostrar una Advertencia de que se cobrara con credito!!!!!!

                        etapa = 'credito';

                        pago = "Efectivo";

                        if (cobrarCada == null) {
                            return swal({title: "Advertencia!",
                                text: "Debe seleccionar la fecha de entrega",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (!aCuenta || !aCuenta.trim().length || !saldoACobrar || !saldoACobrar.trim().length || !cuotasSaldo || !cuotasSaldo.trim().length || !cobrarCada || !cobrarCada.trim().length) {
                            return swal({title: "Advertencia!",
                                text: "Debe ingresar todos los datos del credito",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (parseFloat(saldoACobrar) <= 0) {
                            return swal({title: "Advertencia!",
                                text: "EL saldo del credito debe ser mayor a 0.",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (parseFloat(aCuenta) < 0) {
                            return swal({title: "Advertencia!",
                                text: "EL pago inicial debe ser mayor a 0",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (parseInt(cuotasSaldo) <= 0) {
                            return swal({title: "Advertencia!",
                                text: "La cantidad de cuotas del credito deben ser mayor a 0",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (idCliente == "" || idCliente == 1) {
                            return swal({title: "Advertencia!",
                                text: "No se puede realizar un credito sin un cliente, seleccionado",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        var importe = parseFloat(saldoACobrar) / parseFloat(cuotasSaldo);
                        if (importe < 1) {
                            return swal({title: "Advertencia!",
                                text: "El numero de cuotas es muy elevado para el saldo del credito",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                    }


                    //var idpuntoventa = $("#iddelpuntoventa").val();
                    var idpuntoventa = $("#vendedor").val();

                    var idelemeplaedo = $("#iddelempleado").val();
                    var idmesas = $("#mesa").val();
                    var totalcondescuento = $("#totalcondescuentoventa").text();
                    var totalliteralventa = $("#totalventaliteral").text();

                    var totalliteralDeSusABs = $("#totalventaliteralSus").text();

                    var idTipoDescuento = $("#descuentos").val();
                    var porcentajedescuento;
                    var importedescuento = $("#mostrardescuento").text();
                    var descuentoPorcentaje = document.getElementById('descuentoP').checked;
                    if (descuentoPorcentaje == true) {
                        porcentajedescuento = descuent;
                    } else {
                        porcentajedescuento = $("#mostrarimporte").text();
                        parseFloat(porcentajedescuento);
                        if (porcentajedescuento < 0) {
                            return swal({title: "Advertencia!",
                                text: "El Descuento Excede lo Permitido",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        parseFloat(totalsindesceutos);
                        parseFloat(totalcondescuento);
                        importedescuento = totalsindesceutos - totalcondescuento;
                    }

                    var confactura = document.getElementById('sifactura').checked;
                    var con_factura = 0;
                    if (confactura){
                        con_factura = 1;
                    }
                    if (confactura) {
                        if (!nombre || !nombre.trim().length) {
                            return swal({title: "Advertencia!",
                                text: "Debe ingresar la Razon Social del cliente para la facturacion",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (!nit || !nit.trim().length) {
                            return swal({title: "Advertencia!",
                                text: "Debe ingresar el NIT del cliente para la facturacion",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                    }
                    var conenvio = false;//document.getElementById('test22').checked;
                    var FechaEntrega = $("#fechaentrega").val();
                    var HoraEntrega = $("#horaentrega").val();
                    var idventa = $('#venta').val();
                    var PersonaRecibeenvio = $("#personarecibeenvio").val();
                    var DireccionEnvio = $("#dirreccionenvio").val();
                    var Importetransporte = $("#importetransporte").val();
                    var ci = $("#ci").val();
                    var celular = $("#celulars").val();
                    var departamento = $("#ciudadd").val();
                    var estadoenvio;
                    if (conenvio == true) {
                        estadoenvio = 2;
                        if (!PersonaRecibeenvio || !PersonaRecibeenvio.trim().length) {
                            return Materialize.toast('Persona Recibe envio Es obligatorio', 1000, 'rounded');
                        }
                        if (!ci || !ci.trim().length) {
                            return Materialize.toast('La Cedula de Identidad Es obligatorio', 1000, 'rounded');
                        } else {
                            ci = parseInt($("#ci").val());
                        }
                        if (!celular || !celular.trim().length) {
                            return Materialize.toast('El telefono Es obligatorio', 1000, 'rounded');
                        } else {
                            celular = parseInt($("#celulars").val());
                        }
                        if (!DireccionEnvio || !DireccionEnvio.trim().length) {
                            return Materialize.toast('Direccion Envío Es obligatorio', 1000, 'rounded');
                        }
                        if (!Importetransporte || !Importetransporte.trim().length) {
                            return Materialize.toast('Importe transporte Es obligatorio', 1000, 'rounded');
                        }
                        if (!FechaEntrega || !FechaEntrega.trim().length) {
                            return Materialize.toast('Fecha Entrega Es obligatorio', 1000, 'rounded');
                        }
                        if (!HoraEntrega || !HoraEntrega.trim().length) {
                            return Materialize.toast('Hora Entrega Es obligatorio', 1000, 'rounded');
                        }
                    } else {
                        PersonaRecibeenvio = "S/R";
                        DireccionEnvio = "S/E";
                        Importetransporte = "S/T";
                        FechaEntrega = "";
                        HoraEntrega = "";
                        estadoenvio = 1;
                        ci = 0;
                        celular = 0;
                        departamento = 0;
                    }
                    var garantia = parseInt($("#impgarantia").val());
                    var vendedor = $("#vendedor").val();
                    var token = $("#token").val();
                    var route = "/Factura";
                    formData = formData + '&idTipoDescuento='+idTipoDescuento + '&porcentajedescuento='+porcentajedescuento+'&importedescuento='+importedescuento+
                        '&cambio='+cambio+'&idventa='+idventa+'&idpuntoventa='+idpuntoventa+'&total='+totalcondescuento+'&totaltotal='+totalsindesceutos+
                        '&valorliteral='+totalliteralventa+'&totalliteralDeSusABs='+totalliteralDeSusABs+'&nombre='+nombre+'&nit='+nit+'&idelemeplaedo='+idelemeplaedo+
                        '&pago='+pago+'&idmesas='+idmesas+'&aCuenta='+aCuenta+'&saldoACobrar='+saldoACobrar+'&cuotasSaldo'+cuotasSaldo+'&cobrarCada='+cobrarCada+
                        '&idCliente='+ idCliente+'&facturacredito='+confactura+'&observaciones='+observaciones+'&garantia='+garantia+'&DireccionEnvio='+DireccionEnvio+
                        '&Importetransporte='+Importetransporte+'&FechaEntrega='+FechaEntrega+'&HoraEntrega='+HoraEntrega+'&estadoenvio='+estadoenvio+'&celular='+celular+
                        '&departamento='+departamento+'&nroCuenta='+nroCuenta+'&PersonaRecibeenvio='+PersonaRecibeenvio+'&etapa='+etapa+'&efectivoBs='+efectivoBs+
                        '&efectivoSus='+efectivoSus+'&dBancoBs='+dBancoBs+'&dBancoSus='+dBancoSus+'&chequeBs='+chequeBs+'&chequeSus='+chequeSus+'&tDebitoBs='+tDebitoBs+
                        '&tDebitoSus='+tDebitoSus+'&tCreditoBs='+tCreditoBs+'&tCreditoSus='+tCreditoSus+'&idViaPagoEfectivoBs='+idViaPagoEfectivoBs+'&idViaPagoEfectivoSus='+idViaPagoEfectivoSus+
                        '&idViaPagodBancoBs='+idViaPagodBancoBs+'&idViaPagodBancoSus='+idViaPagodBancoSus+'&idViaPagochequeBs='+idViaPagochequeBs+'&idViaPagochequeSus='+idViaPagochequeSus+
                        '&idViaPagotDebitoBs='+idViaPagotDebitoBs+'&idViaPagotDebitoSus='+idViaPagotDebitoSus+'&idViaPagotCreditoBs='+idViaPagotCreditoBs+'&idViaPagotCreditoSus='+idViaPagotCreditoSus+'&con_factura='+con_factura;
                    console.log(formData);
                    ajaxStart('Generando Factura, por favor espere...')
                    $.ajax({
                        url: route,
                        headers: {'X-CSRF-TOKEN': token},
                        type: 'POST',
                        dataType: 'json',
                        data: formData,
                        success: function (result) {
                            var nFactura;
                            if (result == "No se puede generar factura porque no existe libro de órdenes activos") {
                                return Materialize.toast(value, 1000, 'rounded');
                            }
                            if (result == "Fecha limite a Terminado") {
                                return Materialize.toast(value, 1000, 'rounded');
                            }
                            if (result == "limite de numero de factura") {
                                return  Materialize.toast(value, 1000, 'rounded');
                            } else {
                                console.log(result.data);
                                nFactura = result.data;
                                $("#datos tr").remove();
                                $("#resultadoprodcuto tr").remove();
                                $("#datosfactura tr").remove();
                                $('#razonsocial').val("");
                                $('#nit').val("");
                                $('#importe').val("");
                                $('#totals').val("0");
                                $('#venta').val("");
                                document.getElementById('total').innerHTML = "0";
                                $("#modal1").modal('close');
                                Materialize.toast('Guardado Exitoso', 1000, 'rounded');
                                if (confactura == true) {
                                    window.open("/imprirfactura/" + nFactura);
                                } else {
                                    window.open("/imprimirnotaventa/" + idventa);
                                }
                                window.location.href = '/listadeventa';
                            }
                            ajaxStop();
                        }, error: function () {
                            swal({title: "Error",
                                    text: 'Se registraron problemas en el proceso de registro',
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                            ajaxStop();
//                    window.location.reload();
                        }
                    });
                }
            });
        }

    }
    if (pagoCredito == "active") {
        var totalsindesceutos = $("#total").text();
        if (totalsindesceutos == '' || totalsindesceutos == "0") {
            $("#modal1").modal('close');
            return swal({title: "Adverencia!",
                text: "Venta Sin Detalle. Agregue Productos Para Poder Cobrar",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1500});
        }
        var idventa = $("#venta").val();
        if (idventa == '') {
            $('#generadordeventa').show();
            $("#modal1").modal('close');
            return swal({title: "Advertencia!",
                text: "No Se Puede Cobrar una Venta que ha sido ya cobrada o Anulada. Por favor cree una nueva",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1500});
        }
        var estado;
        var route = "/Validarventaantigua/" + idventa;
        $.get(route, function (res) {
            estado = res;
            if (estado == 2) {
                $("#modal1").modal('close');
                return swal({title: "Advertencia!",
                    text: "No Se Puede Cobrar una Venta Anulada. Por favor cree una nueva",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1500});
            }
            if (estado == 1 || estado == 5) {
                $('#generadordeventa').show();
                $("#modal1").modal('close');
                return swal({title: "Advertencia!",
                    text: "Esta Venta Ya Fue Cobrada. Por favor cree una nueva",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1500});
            }
            if (estado == 0 || estado == 4) {

                var etapa = 'venta';
                var nombre = $("#razonsocial").val();
                var nit = parseInt($("#nit").val()) + "";
                var idCliente = $("#idCliente").val();
                if (idCliente == "") {
                    idCliente = 1;
                }

                var cuotasSaldo = parseInt($("#nrCuotas").val()) + "";
                var cobrarCada = $("#cobrarCada").val();
                var observaciones = $("#observaciones").val();

                var efectivoBs = parseFloat($("#efectivoBs").val());
                var efectivoSus = parseFloat($("#efectivoSus").val());
                var dBancoBs = parseFloat($("#dBancoBs").val());
                var dBancoSus = parseFloat($("#dBancoSus").val());
                var chequeBs = parseFloat($("#chequeBs").val());
                var chequeSus = parseFloat($("#chequeSus").val());
                var tDebitoBs = parseFloat($("#tDebitoBs").val());
                var tDebitoSus = parseFloat($("#tDebitoSus").val());
                var tCreditoBs = parseFloat($("#tCreditoBs").val());
                var tCreditoSus = parseFloat($("#tCreditoSus").val());

                if (isNaN(dBancoBs) || dBancoBs == 0 || typeof dBancoBs == "undefined") {
                    dBancoBs = 0;
                }

                if (isNaN(dBancoSus) || dBancoSus == 0 || typeof dBancoSus == "undefined") {
                    dBancoSus = 0;
                }

                if (isNaN(chequeBs) || chequeBs == 0 || typeof chequeBs == "undefined") {
                    chequeBs = 0;
                }

                if (isNaN(chequeSus) || chequeSus == 0 || typeof chequeSus == "undefined") {
                    chequeSus = 0;
                }

                if (isNaN(tDebitoBs) || tDebitoBs == 0 || typeof tDebitoBs == "undefined") {
                    tDebitoBs = 0;
                }

                if (isNaN(tDebitoSus) || tDebitoSus == 0 || typeof tDebitoSus == "undefined") {
                    tDebitoSus = 0;
                }

                if (isNaN(tCreditoBs) || tCreditoBs == 0 || typeof tCreditoBs == "undefined") {
                    tCreditoBs = 0;
                }

                if (isNaN(tCreditoSus) || tCreditoSus == 0 || typeof tCreditoSus == "undefined") {
                    tCreditoSus = 0;
                }
                var saldoFormaPago = $("#saldoFormaPago").text();
                if (saldoFormaPago < 0) {
                    return swal({title: "Advertencia!",
                        text: "Excede el monto en algunas formas de pago!",
                        type: "warning",
                        showConfirmButton: false,
                        closeOnConfirm: false,
                        timer: 1500});

                }
                var idViaPagoEfectivoBs = 0;
                var idViaPagoEfectivoSus = 0;
                var idViaPagodBancoBs = 0;
                var idViaPagodBancoSus = 0;
                var idViaPagochequeBs = 0;
                var idViaPagochequeSus = 0;
                var idViaPagotDebitoBs = 0;
                var idViaPagotDebitoSus = 0;
                var idViaPagotCreditoBs = 0;
                var idViaPagotCreditoSus = 0;

                var suma_total_efectivo = 0;
                var suma_total_banco = 0;
                var suma_total_cheque = 0;
                var suma_total_tdebito = 0;
                var suma_total_tcredito = 0;

                if (efectivoBs != "" || efectivoBs != 0 || !isNaN(efectivoBs)) {
                    if ($('#select_caja').val() != '0') {
                        idViaPagoEfectivoBs = 1;
                        formData = formData + '&pago_efectivo_bs=' + idViaPagoEfectivoBs;
                        formData = formData + '&monto_efectivo_bs=' + efectivoBs;
                        if (idmoneda == 1){
                            suma_total_efectivo = parseFloat(suma_total_efectivo) + efectivoBs;
                        }else {
                            suma_total_efectivo = suma_total_efectivo + (efectivoSus / tipoCambio);
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (efectivoSus != "" || efectivoSus != 0 || !isNaN(efectivoSus)) {
                    if ($('#select_caja').val() != '0') {
                        idViaPagoEfectivoSus = 1;
                        formData = formData + '&pago_efectivo_sus=' + idViaPagoEfectivoSus;
                        formData = formData + '&monto_efectivo_sus=' + efectivoSus;
                        if (idmoneda == 1){
                            suma_total_efectivo = suma_total_efectivo + (efectivoSus * tipoCambio);
                        }else{
                            suma_total_efectivo = suma_total_efectivo + efectivoSus;
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la caja de la forma de pago EFECTIVO",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (dBancoBs != "" || dBancoBs != 0 || !isNaN(dBancoBs)) {
                    if ($('#select_banco').val() != '0') {
                        idViaPagodBancoBs = 1;
                        formData = formData + '&pago_banco_bs=' + idViaPagodBancoBs;
                        formData = formData + '&monto_banco_bs=' + dBancoBs;
                        if (idmoneda == 1){
                            suma_total_banco = suma_total_banco + dBancoBs;
                        }else{
                            suma_total_banco = suma_total_banco + (dBancoBs / tipoCambio);
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (dBancoSus != "" || dBancoSus != 0 || !isNaN(dBancoSus)) {
                    if ($('#select_banco').val() != '0') {
                        idViaPagodBancoSus = 1;
                        formData = formData + '&pago_banco_sus=' + idViaPagodBancoSus;
                        formData = formData + '&monto_banco_sus=' + dBancoSus;
                        if (idmoneda == 1){
                            suma_total_banco = suma_total_banco +(dBancoSus * tipoCambio)
                        }else{
                            suma_total_banco = suma_total_banco + dBancoSus
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la cuenta de la forma de pago BANCO",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (chequeBs != "" || chequeBs != 0 || !isNaN(chequeBs)) {
                    if ($('#select_cuenta_cheque').val() != '0') {
                        idViaPagochequeBs = 1;
                        formData = formData + '&pago_cheque_bs=' + idViaPagochequeBs;
                        formData = formData + '&monto_cheque_bs=' + chequeBs;
                        suma_total_cheque = suma_total_cheque + chequeBs;
                        if (idmoneda == 1){
                            suma_total_cheque = suma_total_cheque + chequeBs;
                        }else {
                            suma_total_cheque = suma_total_cheque + (chequeBs / tipoCambio);
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (chequeSus != "" || chequeSus != 0 || !isNaN(chequeSus)) {
                    if ($('#select_cuenta_cheque').val() != '0') {
                        idViaPagochequeSus = 1;
                        formData = formData + '&pago_cheque_sus=' + idViaPagochequeSus;
                        formData = formData + '&monto_cheque_sus=' + chequeSus;
                        if (idmoneda == 1){
                            suma_total_cheque = suma_total_cheque + (chequeSus / tipoCambio);
                        }else {
                            suma_total_cheque = suma_total_cheque + chequeSus;
                        }
                    } else {
                        return swal({
                            title: "Advetencia!",
                            text: "No ha seleccionado la cuenta de la forma de pago CHEQUE",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 2000
                        });
                        return true;
                    }
                }
                if (tDebitoBs != "" || tDebitoBs != 0 || !isNaN(tDebitoBs)) {
                    if ($('#select_cuenta_debito').val() != '0') {
                        idViaPagotDebitoBs = 1;
                        formData = formData + '&pago_debito_bs=' + idViaPagotDebitoBs;
                        formData = formData + '&monto_debito_bs=' + tDebitoBs;
                        formData = formData + '&tarjeta_debito=' + $('#tarjeta_debito').val();
                        if (idmoneda == 1){
                            suma_total_tdebito = suma_total_tdebito + tDebitoBs;
                        }else {
                            suma_total_tdebito = suma_total_tdebito + (tDebitoBs / tipoCambio);
                        }
                    } else {
                        if ($('#tarjeta_debito').val() == '') {
                            return swal({
                                title: "Advetencia!",
                                text: "El numero de tarjeta de debito es requerido",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                }
                if (tDebitoSus != "" || tDebitoSus != 0 || !isNaN(tDebitoSus)) {
                    if ($('#select_cuenta_debito').val() != '0') {
                        idViaPagotDebitoSus = 1;
                        formData = formData + '&pago_debito_sus=' + idViaPagotDebitoSus;
                        formData = formData + '&monto_debito_sus=' + tDebitoSus;
                        formData = formData + '&tarjeta_debito=' + $('#tarjeta_debito').val();
                        if (idmoneda == 1){
                            suma_total_tdebito =  suma_total_tdebito + (tDebitoSus * tipoCambio);
                        }else {
                            suma_total_tdebito =  suma_total_tdebito + tDebitoSus;
                        }
                    } else {
                        if ($('#tarjeta_debito').val() == '') {
                            return swal({
                                title: "Advetencia!",
                                text: "El numero de tarjeta de debito es requerido",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DEBITO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                }
                if (tCreditoBs != "" || tCreditoBs != 0 || !isNaN(tCreditoBs)) {
                    if ($('#select_cuenta_credito').val() != '0') {
                        idViaPagotCreditoBs = 1;
                        formData = formData + '&pago_credito_bs=' + idViaPagotCreditoBs;
                        formData = formData + '&monto_credito_bs=' + tCreditoBs;
                        formData = formData + '&tarjeta_credito=' + $('#tarjeta_credito').val();
                        if (idmoneda == 1){
                            suma_total_tcredito = suma_total_tcredito + tCreditoBs;
                        }else {
                            suma_total_tcredito = suma_total_tcredito + (tCreditoBs / tipoCambio);
                        }
                    } else {
                        if ($('#tarjeta_credito').val() == '') {
                            return swal({
                                title: "Advetencia!",
                                text: "El numero de tarjeta de credito es requerido",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                }
                if (tCreditoSus != "" || tCreditoSus != 0 || !isNaN(tCreditoSus)) {
                    if ($('#select_cuenta_credito').val() != '0') {
                        idViaPagotCreditoSus = 1;
                        formData = formData + '&monto_credito_sus=' + idViaPagotCreditoSus;
                        formData = formData + '&monto_credito_sus=' + tCreditoSus;
                        formData = formData + '&tarjeta_credito=' + $('#tarjeta_credito').val();
                        if (idmoneda == 1){
                            suma_total_tcredito = suma_total_tcredito + (tCreditoSus * tipoCambio);
                        }else {
                            suma_total_tcredito = suma_total_tcredito + tCreditoSus;
                        }
                    } else {
                        if ($('#tarjeta_credito').val() == '') {
                            return swal({
                                title: "Advetencia!",
                                text: "El numero de tarjeta de credito es requerido",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        } else {
                            return swal({
                                title: "Advetencia!",
                                text: "No ha seleccionado la cuenta de la forma de pago TARJETA DE CREDITO",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 2000
                            });
                            return true;
                        }
                    }
                }

                formData = formData+'&caja_id='+ $('#select_caja').val();
                formData = formData+'&cuenta_banco_id='+ $('#select_banco').val();
                formData = formData+'&cuenta_cheque_id='+ $('#select_cuenta_cheque').val();
                formData = formData+'&cuenta_tdebito_id='+ $('#select_cuenta_debito').val();
                formData = formData+'&cuenta_tcredito_id='+ $('#select_cuenta_credito').val();

                formData = formData+'&total_efectivo='+suma_total_efectivo;
                formData = formData+'&total_banco='+suma_total_banco;
                formData = formData+'&total_cheque='+suma_total_cheque;
                formData = formData+'&total_debito='+suma_total_tdebito;
                formData = formData+'&total_credito='+suma_total_tcredito;

                var aCuenta = parseFloat($("#totalacobrarcondescuentoenlaventa").val()) - parseFloat(suma_total_efectivo) + parseFloat(suma_total_banco)+ parseFloat(suma_total_cheque)+ parseFloat(suma_total_tdebito)+ parseFloat(suma_total_tcredito);
                var pagos;
                var cambio;
                var nroCuenta;
                var pago;
                cambio = parseInt($("#cambio").text());
                var saldoACobrar = $("#saldo").val();
                if (parseFloat(saldoACobrar) != 0) {
                    //Mostrar una Advertencia de que se cobrara con credito!!!!!!

                    etapa = 'credito';

                    pago = "Efectivo";

                    if (pagoCredito == "active") {
                        if (cobrarCada == null) {
                            return swal({title: "Advertencia!",
                                text: "Debe seleccionar el plan de pago!",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (!saldoACobrar || !saldoACobrar.trim().length || !cuotasSaldo || !cuotasSaldo.trim().length || !cobrarCada || !cobrarCada.trim().length) {
                            return swal({title: "Advertencia!",
                                text: "Debe ingresar todos los datos del credito",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (parseFloat(saldoACobrar) <= 0) {
                            return swal({title: "Advertencia!",
                                text: "EL saldo del credito debe ser mayor a 0.",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        // if (parseFloat(aCuenta) < 0) {
                        //     return swal({title: "Advertencia!",
                        //         text: "EL pago inicial debe ser mayor a 0",
                        //         type: "warning",
                        //         showConfirmButton: false,
                        //         closeOnConfirm: false,
                        //         timer: 1500});
                        // }
                        if (parseInt(cuotasSaldo) <= 0) {
                            return swal({title: "Advertencia!",
                                text: "La cantidad de cuotas del credito deben ser mayor a 0",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        if (idCliente == "" || idCliente == 1) {
                            return swal({title: "Advertencia!",
                                text: "No se puede realizar un credito sin un cliente, seleccionado",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }
                        var importe = parseFloat(saldoACobrar) / parseFloat(cuotasSaldo);
                        if (importe < 1) {
                            return swal({title: "Advertencia!",
                                text: "El numero de cuotas es muy elevado para el saldo del credito",
                                type: "warning",
                                showConfirmButton: false,
                                closeOnConfirm: false,
                                timer: 1500});
                        }

                    } else {
                        return;
                    }
                }

                var idpuntoventa = $("#iddelpuntoventa").val();
                var idelemeplaedo = $("#iddelempleado").val();
                var idmesas = $("#mesa").val();
                var totalcondescuento = $("#totalcondescuentoventa").text();
                var totalliteralventa = $("#totalventaliteral").text();

                var totalliteralDeSusABs = $("#totalventaliteralSus").text();

                var idTipoDescuento = $("#descuentos").val();
                var porcentajedescuento;
                var importedescuento = $("#mostrardescuento").text();
                var descuentoPorcentaje = document.getElementById('descuentoP').checked;
                if (descuentoPorcentaje == true) {
                    porcentajedescuento = descuent;
                } else {
                    porcentajedescuento = $("#mostrarimporte").text();
                    parseFloat(porcentajedescuento);
                    if (porcentajedescuento < 0) {
                        return swal({title: "Advertencia!",
                            text: "El Descuento Excede lo Permitido",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1500});
                    }
                    parseFloat(totalsindesceutos);
                    parseFloat(totalcondescuento);
                    importedescuento = totalsindesceutos - totalcondescuento;
                }

                var confactura = document.getElementById('sifactura').checked;
                var con_factura = 0;
                if (confactura){
                    con_factura = 1;
                }
                if (confactura) {
                    if (!nombre || !nombre.trim().length) {
                        return swal({title: "Advertencia!",
                            text: "Debe ingresar la Razon Social del cliente para la facturacion",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1500});
                    }
                    if (!nit || !nit.trim().length) {
                        return swal({title: "Advertencia!",
                            text: "Debe ingresar el NIT del cliente para la facturacion",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1500});
                    }
                    var con_factura = 1;
                }
                var conenvio = false;//document.getElementById('test22').checked;
                var FechaEntrega = $("#fechaentrega").val();
                var HoraEntrega = $("#horaentrega").val();
                var idventa = $('#venta').val();
                var PersonaRecibeenvio = $("#personarecibeenvio").val();
                var DireccionEnvio = $("#dirreccionenvio").val();
                var Importetransporte = $("#importetransporte").val();
                var ci = $("#ci").val();
                var celular = $("#celulars").val();
                var departamento = $("#ciudadd").val();
                var estadoenvio;
                if (conenvio == true) {
                    estadoenvio = 2;
                    if (!PersonaRecibeenvio || !PersonaRecibeenvio.trim().length) {
                        return Materialize.toast('Persona Recibe envio Es obligatorio', 1000, 'rounded');
                    }
                    if (!ci || !ci.trim().length) {
                        return Materialize.toast('La Cedula de Identidad Es obligatorio', 1000, 'rounded');
                    } else {
                        ci = parseInt($("#ci").val());
                    }
                    if (!celular || !celular.trim().length) {
                        return Materialize.toast('El telefono Es obligatorio', 1000, 'rounded');
                    } else {
                        celular = parseInt($("#celulars").val());
                    }
                    if (!DireccionEnvio || !DireccionEnvio.trim().length) {
                        return Materialize.toast('Direccion Envío Es obligatorio', 1000, 'rounded');
                    }
                    if (!Importetransporte || !Importetransporte.trim().length) {
                        return Materialize.toast('Importe transporte Es obligatorio', 1000, 'rounded');
                    }
                    if (!FechaEntrega || !FechaEntrega.trim().length) {
                        return Materialize.toast('Fecha Entrega Es obligatorio', 1000, 'rounded');
                    }
                    if (!HoraEntrega || !HoraEntrega.trim().length) {
                        return Materialize.toast('Hora Entrega Es obligatorio', 1000, 'rounded');
                    }
                } else {
                    PersonaRecibeenvio = "S/R";
                    DireccionEnvio = "S/E";
                    Importetransporte = "S/T";
                    FechaEntrega = "";
                    HoraEntrega = "";
                    estadoenvio = 1;
                    ci = 0;
                    celular = 0;
                    departamento = 0;
                }
                var garantia = parseInt($("#impgarantia").val());
                var vendedor = $("#vendedor").val();
                var token = $("#token").val();

                var route = "/Factura";
                formData = formData + '&idTipoDescuento='+idTipoDescuento + '&porcentajedescuento='+porcentajedescuento+'&importedescuento='+importedescuento+
                    '&cambio='+cambio+'&idventa='+idventa+'&idpuntoventa='+idpuntoventa+'&total='+totalcondescuento+'&totaltotal='+totalsindesceutos+
                    '&valorliteral='+totalliteralventa+'&totalliteralDeSusABs='+totalliteralDeSusABs+'&nombre='+nombre+'&nit='+nit+'&idelemeplaedo='+idelemeplaedo+
                    '&pago='+pago+'&idmesas='+idmesas+'&aCuenta='+aCuenta+'&saldoACobrar='+saldoACobrar+'&cuotasSaldo='+cuotasSaldo+'&cobrarCada='+cobrarCada+
                    '&idCliente='+ idCliente+'&facturacredito='+confactura+'&observaciones='+observaciones+'&garantia='+garantia+'&DireccionEnvio='+DireccionEnvio+
                    '&Importetransporte='+Importetransporte+'&FechaEntrega='+FechaEntrega+'&HoraEntrega='+HoraEntrega+'&estadoenvio='+estadoenvio+'&celular='+celular+
                '&departamento='+departamento+'&nroCuenta='+nroCuenta+'&PersonaRecibeenvio='+PersonaRecibeenvio+'&etapa='+etapa+'&efectivoBs='+efectivoBs+
                    '&efectivoSus='+efectivoSus+'&dBancoBs='+dBancoBs+'&dBancoSus='+dBancoSus+'&chequeBs='+chequeBs+'&chequeSus='+chequeSus+'&tDebitoBs='+tDebitoBs+
                    '&tDebitoSus='+tDebitoSus+'&tCreditoBs='+tCreditoBs+'&tCreditoSus='+tCreditoSus+'&idViaPagoEfectivoBs='+idViaPagoEfectivoBs+'&idViaPagoEfectivoSus='+idViaPagoEfectivoSus+
                    '&idViaPagodBancoBs='+idViaPagodBancoBs+'&idViaPagodBancoSus='+idViaPagodBancoSus+'&idViaPagochequeBs='+idViaPagodBancoSus+'&idViaPagochequeSus='+idViaPagochequeSus+
                    '&idViaPagotDebitoBs='+idViaPagotDebitoBs+'&idViaPagotDebitoSus='+idViaPagotDebitoSus+'&idViaPagotCreditoBs='+idViaPagotCreditoBs+'&idViaPagotCreditoSus='+idViaPagotCreditoSus+'&con_factura='+con_factura;
                console.log(formData);
                // pregunta
                ajaxStart('Generando Factura, por favor espere...')
                $.ajax({
                    url: route,
                    headers: {'X-CSRF-TOKEN': token},
                    type: 'POST',
                    dataType: 'json',
                    data: formData,
                    success: function (result) {
                        var nFactura;
                        if (result == "No se puede generar factura porque no existe libro de órdenes activos") {
                            return Materialize.toast(value, 1000, 'rounded');
                        }
                        if (result == "Fecha limite a Terminado") {
                            return Materialize.toast(value, 1000, 'rounded');
                        }
                        if (result == "limite de numero de factura") {
                            return  Materialize.toast(value, 1000, 'rounded');
                        } else {
                            console.log(result.data);
                            nFactura = result.data;
                            $("#datos tr").remove();
                            $("#resultadoprodcuto tr").remove();
                            $("#datosfactura tr").remove();
                            $('#razonsocial').val("");
                            $('#nit').val("");
                            $('#importe').val("");
                            $('#totals').val("0");
                            $('#venta').val("");
                            document.getElementById('total').innerHTML = "0";
                            $("#modal1").modal('close');
                            Materialize.toast('Guardado Exitoso', 1000, 'rounded');
                            if (confactura == true) {
                                window.open("/imprirfactura/" + nFactura);
                            } else {
                                window.open("/imprimirnotaventa/" + idventa);
                            }
                            window.location.href = '/listadeventa';
                        }
                        ajaxStop();
                    }, error: function () {
                        swal({title: "Error!",
                            type: "warning",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1500});
                        ajaxStop();
//                    window.location.reload();
                    }
                });
            }
        });
    }
});

/*
 * Metodo para anular una venta
 */
$("#anularventa").click(function () {
    var idventa = $('#venta').val();
    if (!idventa || !idventa.trim().length) {
        $('#generadordeventa').show();
        return swal({title: "Advertencia",
            text: "No se puede anular una venta ya cobrada o anulada",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 2000});
    }
    var route = "/AnularVenta/" + idventa;
    $.get(route, function (res) {
        if (res.mensaje == "Venta anulada exitosamente") {
            $("#datos tr").remove();
            $("#datosfactura tr").remove();
            $('#razonsocial').val("");
            $('#nit').val("");
            $('#venta').val("");
            document.getElementById('total').innerHTML = "0";
            $('#generadordeventa').show();
            $("#modal1").modal('close');
            return swal({title: "Bien!",
                text: res.mensaje,
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 2000});
        } else {
            return swal({title: "Advertencia!",
                text: res.mensaje,
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 2000});
        }
    });
});
/*
 * Metodo para generar una proforma
 */
$("#proforma").click(function () {
    var idventa = $('#venta').val();
    var idCliente = $('#idCliente').val();
    var total = $("#total").text();
    if (!idventa || !idventa.trim().length) {
        return swal({title: "Adverencia!",
            text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    if (!idCliente || !idCliente.trim().length) {
        return swal({title: "Adverencia!",
            text: "Asigne un cliente a la venta",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    if (total == "0") {
        return swal({title: "Adverencia!",
            text: "No se puede hacer una proforma sin detalle",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
        return false;
    }
    var route = "/proforma/" + idventa + "/" + idCliente + "/" + total;
    $.get(route, function (res) {
        if (res == 1) {
            $("#datos tr").remove();
            $("#datosfactura tr").remove();
            $('#razonsocial').val("");
            $('#nit').val("");
            $('#venta').val("");
            document.getElementById('total').innerHTML = "0";
            $('#generadordeventa').show();
            $("#modal1").modal('close');
            $('#generadordeventa').show();
            $("#contenidoventa").hide();
            swal({title: "Bien!",
                text: "Proforma realizada exitosamente",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
            window.open("/imprimirproforma/" + idventa);
        }
        if (res == 2) {
            $('#generadordeventa').show();
            $("#contenidoventa").hide();
            return swal({title: "Adverencia!",
                text: "No se puede hacer una proforma de una venta anulada",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
        if (res == 0) {
            $('#generadordeventa').show();
            $("#contenidoventa").hide();
            return swal({title: "Adverencia!",
                text: "Esta venta ya fue cobrada. No se puede hacer proforma.",
                type: "warning",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });
});
/*
 * Eliminar un producto del detalle de la venta
 * @param {type} btn -> BTN con el ID del productoa eliminar
 * @returns {undefined}
 */
function Eliminar(btn) {
    var idventa = $('#venta').val();
    if (!idventa || !idventa.trim().length) {
        return swal({title: "Adverencia!",
            text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
    var route = "/validarestado/" + idventa;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            if (value.estado == 1) {
                return swal({title: "Adverencia!",
                    text: "Esta venta ya fue cobrada o anulada. Cree una nueva",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
            if (value.estado == 0 || value.estado == 4) {
                var route = "/Detalleventa/" + btn + "";
                var token = $("#token").val();
                var idventa = $('#venta').val();
                var idproducto = btn.value;
                $.ajax({
                    url: route,
                    headers: {'X-CSRF-TOKEN': token},
                    type: 'DELETE',
                    dataType: 'json',
                    data: {
                        idventa: idventa,
                        idproducto: idproducto
                    },
                    success: function () {
                        Cargartabla();
                        $("#total").text("0");
                        return swal({title: "Bien!",
                            text: "Producto eliminado de la venta",
                            type: "success",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                    },
                    error: function () {
                        swal({title: "Error",
                            text: "Error al eliminar el producto",
                            type: "error",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                        return location.reload();
                    }
                });
            }
            if (value.estado == 2) {
                return swal({title: "Adverencia!",
                    text: "No se puede eliminar el producto de la venta, porque ya fue anulada.",
                    type: "warning",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });
    });
}

/*
 * Metodo para cargar los descuentos a un combo
 * @returns {undefined}
 */
function cargardescuento() {
    $('#descuentos')
        .find('option')
        .remove()
        .end();
    $("#descuentos").append('<option value="1" >Seleccione el tipo de Descuento</option>');
    $('#descuentos').material_select();
    var route = "/listardescuentos/";
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $('#descuentos').append('<option value=' + value.id + ' >' + value.nombre + '  (' + value.descuento + '%)</option>');
            $('#descuentos').material_select();
        });
    });
}
/*
 * Metodo para aplicar el descuentpo a la venta seleccionando un descuento del
 * combo
 */

//MIGUEL NUEVO LINEA 8464
$("select#descuentos").change(function () {

    $('#calculoEfectivoBs').val(0);
    $('#calculoEfectivoSus').val(0);
    $('#efectivoBs').val("0.00");
    $('#efectivoSus').val("0.00");
    $('#dBancoBs').val("");
    $('#dBancoSus').val("");
    $('#chequeBs').val("");
    $('#chequeSus').val("");
    $('#tDebitoBs').val("");
    $('#tDebitoSus').val("");
    $('#tCreditoBs').val("");
    $('#tCreditoSus').val("");



    $("#calculoEfectivoSus").removeAttr('disabled');
    $("#calculoEfectivoBs").removeAttr('disabled');
    $("#dBancoBs").removeAttr('disabled');
    $("#dBancoSus").removeAttr('disabled');
    $("#chequeBs").removeAttr('disabled');
    $("#chequeSus").removeAttr('disabled');
    $("#tDebitoBs").removeAttr('disabled');
    $("#tDebitoSus").removeAttr('disabled');
    $("#tCreditoBs").removeAttr('disabled');
    $("#tCreditoSus").removeAttr('disabled');

    var money = $("#idMoneda").val();

    if (money == 1) { //Bolivianos              ///////////////////////////////////////////// ESTA MAL!!!!!!!!!!//////////////////////////////////////
        var idselecionado = $(this).val();
        var route = "/Descuento/" + idselecionado + "/edit";
        var totalcargado = $("#totaldefacturas").val(totalfactura);
        $("#totaldefacturassindescuento").val(totalfactura);
        if (totalfactura == 0) {
            Materialize.toast('No tiene total Asignado', 1000, 'rounded');
        } else {
            $.get(route, function (res) {
                $(res).each(function (key, value) {
                    $("#iddescuento").val(value.id);
                    var totalfacturas = $("#totaldefacturas").val();

                    var descuento = totalfacturas * value.descuento / 100;

                    descuentoTotal = descuento;
                    document.getElementById('mostrardescuento').innerHTML = descuento.toFixed(2);
                    $("#descuentoasignado").val(value.descuento);
                    descuent = value.descuento;
                    var totalfacturas = totalfacturas - descuento;
                    var total = "" + totalfacturas + "";
                    totalConDescuento = totalfacturas;
                    $("#datosfactura tr").remove();
                    var valor = LITERAL(total);
                    var tabladatos = $('#datosfactura');
                    $("#totalacobrarcondescuentoenlaventa").text(totalfacturas.toFixed(2));

                    $("#saldoCreditoBs").text(totalfacturas);

                    tabladatos.append("<tr><td id='totalcondescuentoventa'>" + totalfacturas.toFixed(2) + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                    $("#saldoCredito").text(totalfacturas);
                    calcular_BsCOMBO();
                    calcular_SusCOMBO();
                    calcular_Banco_Bs();
                    calcular_Banco_Sus();
                    calcular_Cheque_Bs();
                    calcular_Cheque_Sus();
                    calcular_tDebito_Bs();
                    calcular_tDebito_Sus();
                    calcular_tCredito_Bs();
                    calcular_tCredito_Sus();
                    $("#totaldefacturas").val(totalfacturas);
                    var porcentaje = totalfacturas * 0.3;
                    porcentaje = porcentaje.toFixed(2);
                    var saldo = totalfacturas - porcentaje;
                    $("#aCuenta").val(0);
//                    $("#saldo").val(saldo.toFixed(2));
                });
            });
        }

    } else {

        var idselecionado = $(this).val();
        var route = "/Descuento/" + idselecionado + "/edit";
        var totalcargado = $("#totaldefacturas").val(totalfactura);
        $("#totaldefacturassindescuento").val(totalfactura);
        if (totalfactura == 0) {
            Materialize.toast('No tiene total Asignado', 1000, 'rounded');
        } else {
            $.get(route, function (res) {
                $(res).each(function (key, value) {
                    $("#iddescuento").val(value.id);
                    var totalfacturas = $("#totaldefacturas").val();
                    var descuento = totalfacturas * value.descuento / 100;
                    descuentoTotal = descuento;
                    document.getElementById('mostrardescuento').innerHTML = descuento.toFixed(2);
                    $("#descuentoasignado").val(value.descuento);
                    descuent = value.descuento;
                    var totalfacturas = totalfacturas - descuento;
                    var total = "" + totalfacturas + "";
                    totalConDescuento = totalfacturas;

                    $("#datosfactura tr").remove();
                    var valor = LITERALDOLAR(total);

//para guardar en la factura el literal en bolivianos
                    var tipoCV = parseFloat($("#TCV").text());
                    var totalConversion = parseFloat(total);
                    var totaltotal = totalConversion * tipoCV;
                    var redondeo = totaltotal.toFixed(2);
                    var valorConversion = LITERAL(redondeo);
                    $("#totalventaliteralSus").text(valorConversion);
//=====================================================================
                    var tabladatos = $('#datosfactura');
                    $("#totalacobrarcondescuentoenlaventa").text(totalfacturas.toFixed(2));
                    $("#saldoCreditoBs").text(totalfacturas);

                    tabladatos.append("<tr><td id='totalcondescuentoventa'>" + totalfacturas.toFixed(2) + "</td><td id='totalventaliteral'>" + valor + "</td><tr>");
                    $("#saldoCredito").text(totalfacturas);
                    calcular_BsCOMBO();
                    calcular_SusCOMBO();
                    calcular_Efectivo_Bs();
                    calcular_Efectivo_Sus();
                    calcular_Banco_Bs();
                    calcular_Banco_Sus();
                    calcular_Cheque_Bs();
                    calcular_Cheque_Sus();
                    calcular_tDebito_Bs();
                    calcular_tDebito_Sus();
                    calcular_tCredito_Bs();
                    calcular_tCredito_Sus();

                    $("#totaldefacturas").val(totalfacturas);
                    var porcentaje = totalfacturas * 0.3;
                    porcentaje = porcentaje.toFixed(2);
                    var saldo = totalfacturas - porcentaje;
                    $("#aCuenta").val(0);
//                    $("#saldo").val(saldo.toFixed(2));
                });
            });
        }
    }


});




//MIGUEL MODIFICADO COMPARA TU ARCHIVO
function calcular_total_Modificado() {

    if ( parseFloat($('#totalcondescuento').val()) > parseFloat($("#totalfijo").text()) ) {
        swal({
            title: "EL MONTO ES MAYOR AL TOTAL DE VENTA",
            type: "error",
            showConfirmButton: true,
            closeOnConfirm: true,
        });        
        $("#guardarfactura").hide();
    }else{
        $("#guardarfactura").show();        
    }


    $('#calculoEfectivoBs').val(0);
    $('#calculoEfectivoSus').val(0);
    $('#efectivoBs').val("0.00");
    $('#efectivoSus').val("0.00");
    $('#dBancoBs').val("");
    $('#dBancoSus').val("");
    $('#chequeBs').val("");
    $('#chequeSus').val("");
    $('#tDebitoBs').val("");
    $('#tDebitoSus').val("");
    $('#tCreditoBs').val("");
    $('#tCreditoSus').val("");



    $("#calculoEfectivoSus").removeAttr('disabled');
    $("#calculoEfectivoBs").removeAttr('disabled');
    $("#dBancoBs").removeAttr('disabled');
    $("#dBancoSus").removeAttr('disabled');
    $("#chequeBs").removeAttr('disabled');
    $("#chequeSus").removeAttr('disabled');
    $("#tDebitoBs").removeAttr('disabled');
    $("#tDebitoSus").removeAttr('disabled');
    $("#tCreditoBs").removeAttr('disabled');
    $("#tCreditoSus").removeAttr('disabled');
    //ReiniciarCalcularPrecioFinal();
    //alert("l");
    var money = $("#idMoneda").val();
    if (money == 1) { //Bolivianos

        var totalfactura = 0;
        var importe_porcentaje = 0;
        var totaltraido = $("#totalfijo").text();
        if (totaltraido == "0") {
            return false;
        }
        var entradavalor = $('#totalcondescuento').val();
        if (entradavalor == "") {

            $("#mostrarimporte").text("0 %");
            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERAL(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");

            return false;
        }
        totaltraido = parseFloat(totaltraido);
        entradavalor = parseFloat(entradavalor);
        if (entradavalor > totaltraido) {
            $("#mostrarimporte").text("0 %");
            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERAL(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(total1);

            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();

            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/
            return false;
        }
        if (totaltraido === '') {
            totaltraido = totalfactura;
        }
        var numero = parseInt(totaltraido);
        importe_porcentaje = (entradavalor * 100).toFixed(2);
        var porcentajemitad = importe_porcentaje / numero;
        var porcentajereal = (100 - porcentajemitad).toFixed(1);

        if (entradavalor == "0" || entradavalor == "") {
            $("#mostrarimporte").text("0 %");

            var idselecionado = $("#descuentos").val();
            var route = "/Descuento/" + idselecionado + "/edit";
            var totalcargado = $("#totaldefacturas").val(totalfactura);
            $("#totaldefacturassindescuento").val(totalfactura);

            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERAL(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(total1);
            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Efectivo_Bs();
            calcular_Efectivo_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();   
                     
            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/
            var total1 = parseFloat(total1);
            var porcentaje = total1 * 0.3;
            porcentaje = porcentaje.toFixed(2);
            var saldo = total1 - porcentaje;
            $("#aCuenta").val(0);
//            $("#saldo").val(total1);

        } else {
            $("#mostrarimporte").text(porcentajereal + " %");
            $("#datosfactura tr").remove();
            var total1 = "" + entradavalor + "";
            var valor1 = LITERAL(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(entradavalor.toFixed(2));
            
            $("#saldoCreditoBs").text(entradavalor);

            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + entradavalor.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(entradavalor);

            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();

            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/


            var total1 = parseFloat(entradavalor);
            var porcentaje = total1 * 0.3;
            porcentaje = porcentaje.toFixed(2);
            var saldo = total1 - porcentaje;
            $("#aCuenta").val(0);
//            $("#saldo").val(entradavalor);
        }


    } else {

        var totalfactura = 0;
        var importe_porcentaje = 0;
        var totaltraido = $("#totalfijo").text();
        if (totaltraido == "0") {

            return false;
        }
        var entradavalor = $('#totalcondescuento').val();
        if (entradavalor == "") {
            $("#mostrarimporte").text("0 %");
            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERALDOLAR(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");

            return false;
        }
        totaltraido = parseFloat(totaltraido);
        entradavalor = parseFloat(entradavalor);
        if (entradavalor > totaltraido) {
            $("#mostrarimporte").text("0 %");
            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERALDOLAR(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(total1);

            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();

            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/

            return false;
        }
        if (totaltraido === '') {
            totaltraido = totalfactura;
        }
        var numero = parseInt(totaltraido);
        importe_porcentaje = (entradavalor * 100).toFixed(2);
        var porcentajemitad = importe_porcentaje / numero;
        var porcentajereal = (100 - porcentajemitad).toFixed(1);

        if (entradavalor == "0" || entradavalor == "") {
            $("#mostrarimporte").text("0 %");

            var idselecionado = $("#descuentos").val();
            var route = "/Descuento/" + idselecionado + "/edit";
            var totalcargado = $("#totaldefacturas").val(totalfactura);
            $("#totaldefacturassindescuento").val(totalfactura);

            $("#datosfactura tr").remove();
            var total1 = $("#totalfijo").text();
            var valor1 = LITERALDOLAR(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(total1.toFixed(2));
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + total1.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(total1);
            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();

            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/
            var total1 = parseFloat(total1);
            var porcentaje = total1 * 0.3;
            porcentaje = porcentaje.toFixed(2);
            var saldo = total1 - porcentaje;
            $("#aCuenta").val(0);
//            $("#saldo").val(total1);

        } else {
            $("#mostrarimporte").text(porcentajereal + " %");
            $("#datosfactura tr").remove();
            var total1 = "" + entradavalor + "";
            var valor1 = LITERALDOLAR(total1);
            var tabladatos = $('#datosfactura');
            $("#totalacobrarcondescuentoenlaventa").text(entradavalor.toFixed(2));

            $("#saldoCreditoBs").text(entradavalor);
            
            tabladatos.append("<tr><td id='totalcondescuentoventa'>" + entradavalor.toFixed(2) + "</td><td id='totalventaliteral'>" + valor1 + "</td><tr>");
            $("#saldoCredito").text(entradavalor);
            calcular_BsCOMBO();
            calcular_SusCOMBO();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();

            /*calcular_Bs();
            calcular_Sus();
            calcular_Cheque_Bs();
            calcular_Cheque_Sus();
            calcular_Banco_Bs();
            calcular_Banco_Sus();
            calcular_tCredito_Bs();
            calcular_tCredito_Sus();
            calcular_tDebito_Bs();
            calcular_tDebito_Sus();*/
            var total1 = parseFloat(entradavalor);
            var porcentaje = total1 * 0.3;
            porcentaje = porcentaje.toFixed(2);
            var saldo = total1 - porcentaje;
            $("#aCuenta").val(0);
//            $("#saldo").val(entradavalor);
        }


    }




}




/*******************************************************************************
 ************************************* ENVIOS***********************************
 * *****************************************************************************
 */
function mostrardatosdeenvio() {
    $('#informaciondelenvio').show();
}

function ocultardatosdeenvio() {
    $('#informaciondelenvio').hide();
}

var contardirecciones = 0;

$('#nuevadireccion').click(function () {
    contardirecciones++;
    if (contardirecciones == 1) {
        $('#direcion2').show();
        contardirecciones = 1;
        return;
    } else {
    }
    if (contardirecciones == 2) {
        $('#direcion3').show();
        contardirecciones = 0;
        return;
    } else {
        return;
    }
});

var quitarcontador = 1;

$('#quitardiceccion').click(function () {
    quitarcontador++;
    if (quitarcontador == 1) {
        $('#direcion2').hide();
        quitarcontador = 1;
        return;
    } else {
    }
    if (quitarcontador == 2) {
        $('#direcion3').hide();
        quitarcontador = 0;
        return;
    } else {
        return;
    }
});

$("#programarentrega").click(function () {
    var FechaEntrega = $("#fechaentrega").val();
    var HoraEntrega = $("#horaentrega").val();
    var idventa = $('#venta').val();
    var estado = 3;
//*****esto ya valida
    var EnvioaDomicilio;
    var PersonaRecibeenvio = $("#personarecibeenvio").val();
    var DireccionEnvio = $("#dirreccionenvio").val();
    var Cobroalentregar;
    var Importetransporte = $("#importetransporte").val();
    var sienviodomicilio = document.getElementById('sienviodomiciolio').checked;
    var noenviodomicilio = document.getElementById('noenviodomiciolio').checked;
    var sicobro = document.getElementById('sicobro').checked;
    var nocobro = document.getElementById('nocobro').checked;
    if (sicobro == true) {
        Cobroalentregar = 1;
    } else {
        Cobroalentregar = 0;
    }
    if (nocobro == true) {
        Cobroalentregar = 0;
    }
    if (sienviodomicilio == true) {
        if (!PersonaRecibeenvio || !PersonaRecibeenvio.trim().length) {
            Materialize.toast('Persona Recibe envio Es obligatorio', 1000, 'rounded');
            return;
        } else {
        }
        if (!DireccionEnvio || !DireccionEnvio.trim().length) {
            Materialize.toast('Direccion Envío Es obligatorio', 1000, 'rounded');
            return;
        } else {
        }
        if (!Importetransporte || !Importetransporte.trim().length) {
            Materialize.toast('Importe transporte Es obligatorio', 1000, 'rounded');
            return;
        } else {
        }
        EnvioaDomicilio = 1;
    } else {
        EnvioaDomicilio = 0;
        PersonaRecibeenvio = "S/R";
        DireccionEnvio = "S/E";
        Importetransporte = "S/T";
    }
    if (noenviodomicilio == true) {
        EnvioaDomicilio = 0;
    }
    if (!FechaEntrega || !FechaEntrega.trim().length) {
        Materialize.toast('Fecha Entrega Es obligatorio', 1000, 'rounded');
        return;
    } else {
    }
    if (!HoraEntrega || !HoraEntrega.trim().length) {
        Materialize.toast('Hora Entrega Es obligatorio', 1000, 'rounded');
        return;
    } else {
    }
    //idventa
    var route = "/conenvioventa";
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'POST',
        dataType: 'json',
        data: {
            idventa: idventa,
            estado: estado,
            FechaEntrega: FechaEntrega,
            HoraEntrega: HoraEntrega,
            EnvioaDomicilio: EnvioaDomicilio,
            PersonaRecibeenvio: PersonaRecibeenvio,
            DireccionEnvio: DireccionEnvio,
            Cobroalentregar: Cobroalentregar,
            Importetransporte: Importetransporte
        },
        success: function () {
            Materialize.toast('Envio Programadao !! ', 2000, 'rounded');
        }, error: function () {
            Materialize.toast('Error!! ', 2000, 'rounded');
        }
    });
});

/*******************************************************************************
 * *****************************************************************************
 * *********************************LITERAL*************************************
 * *****************************************************************************
 * *****************************************************************************
 */
// Función modulo, regresa el residuo de una división
function mod(dividendo, divisor) {
    resDiv = dividendo / divisor;
    parteEnt = Math.floor(resDiv);            // Obtiene la parte Entera de resDiv
    parteFrac = resDiv - parteEnt;      // Obtiene la parte Fraccionaria de la división
    //modulo = parteFrac * divisor;  // Regresa la parte fraccionaria * la división (modulo)
    modulo = Math.round(parteFrac * divisor)
    return modulo;
} // Fin de función mod

// Función ObtenerParteEntDiv, regresa la parte entera de una división
function ObtenerParteEntDiv(dividendo, divisor) {
    resDiv = dividendo / divisor;
    parteEntDiv = Math.floor(resDiv);
    return parteEntDiv;
} // Fin de función ObtenerParteEntDiv

// function fraction_part, regresa la parte Fraccionaria de una cantidad
function fraction_part(dividendo, divisor) {
    resDiv = dividendo / divisor;
    f_part = Math.floor(resDiv);
    return f_part;
} // Fin de función fraction_part

// function string_literal conversion is the core of this program
// converts numbers to spanish strings, handling the general special
// cases in spanish language.
function string_literal_conversion(number) {
    // first, divide your number in hundreds, tens and units, cascadig
    // trough subsequent divisions, using the modulus of each division
    // for the next.
    centenas = ObtenerParteEntDiv(number, 100);
    number = mod(number, 100);
    decenas = ObtenerParteEntDiv(number, 10);
    number = mod(number, 10);
    unidades = ObtenerParteEntDiv(number, 1);
    number = mod(number, 1);
    string_hundreds = "";
    string_tens = "";
    string_units = "";
    // cascade trough hundreds. This will convert the hundreds part to
    // their corresponding string in spanish.
    if (centenas == 1) {
        string_hundreds = "ciento ";
    }
    if (centenas == 2) {
        string_hundreds = "doscientos ";
    }
    if (centenas == 3) {
        string_hundreds = "trescientos ";
    }
    if (centenas == 4) {
        string_hundreds = "cuatrocientos ";
    }
    if (centenas == 5) {
        string_hundreds = "quinientos ";
    }

    if (centenas == 6) {
        string_hundreds = "seiscientos ";
    }

    if (centenas == 7) {
        string_hundreds = "setecientos ";
    }

    if (centenas == 8) {
        string_hundreds = "ochocientos ";
    }

    if (centenas == 9) {
        string_hundreds = "novecientos ";
    }

    // end switch hundreds

    // casgade trough tens. This will convert the tens part to corresponding
    // strings in spanish. Note, however that the strings between 11 and 19
    // are all special cases. Also 21-29 is a special case in spanish.
    if (decenas == 1) {
        //Special case, depends on units for each conversion
        if (unidades == 1) {
            string_tens = "once";
        }

        if (unidades == 2) {
            string_tens = "doce";
        }

        if (unidades == 3) {
            string_tens = "trece";
        }

        if (unidades == 4) {
            string_tens = "catorce";
        }

        if (unidades == 5) {
            string_tens = "quince";
        }

        if (unidades == 6) {
            string_tens = "dieciseis";
        }

        if (unidades == 7) {
            string_tens = "diecisiete";
        }

        if (unidades == 8) {
            string_tens = "dieciocho";
        }

        if (unidades == 9) {
            string_tens = "diecinueve";
        }
    }

    if (decenas == 2) {
        string_tens = "veinti";

    }
    if (decenas == 3) {
        string_tens = "treinta";
    }
    if (decenas == 4) {
        string_tens = "cuarenta";
    }
    if (decenas == 5) {
        string_tens = "cincuenta";
    }
    if (decenas == 6) {
        string_tens = "sesenta";
    }
    if (decenas == 7) {
        string_tens = "setenta";
    }
    if (decenas == 8) {
        string_tens = "ochenta";
    }
    if (decenas == 9) {
        string_tens = "noventa";
    }

    // Fin de swicth decenas


    // cascades trough units, This will convert the units part to corresponding
    // strings in spanish. Note however that a check is being made to see wether
    // the special cases 11-19 were used. In that case, the whole conversion of
    // individual units is ignored since it was already made in the tens cascade.

    if (decenas == 1)
    {
        string_units = "";  // empties the units check, since it has alredy been handled on the tens switch
    } else
    {
        if (unidades == 1) {
            string_units = "un";
        }
        if (unidades == 2) {
            string_units = "dos";
        }
        if (unidades == 3) {
            string_units = "tres";
        }
        if (unidades == 4) {
            string_units = "cuatro";
        }
        if (unidades == 5) {
            string_units = "cinco";
        }
        if (unidades == 6) {
            string_units = "seis";
        }
        if (unidades == 7) {
            string_units = "siete";
        }
        if (unidades == 8) {
            string_units = "ocho";
        }
        if (unidades == 9) {
            string_units = "nueve";
        }
        // end switch units
    } // end if-then-else


//final special cases. This conditions will handle the special cases which
//are not as general as the ones in the cascades. Basically four:

// when you've got 100, you dont' say 'ciento' you say 'cien'
// 'ciento' is used only for [101 >= number > 199]
    if (centenas == 1 && decenas == 0 && unidades == 0) {
        string_hundreds = "cien ";
    }

// when you've got 10, you don't say any of the 11-19 special
// cases.. just say 'diez'
    if (decenas == 1 && unidades == 0) {
        string_tens = "diez ";
    }

// when you've got 20, you don't say 'veinti', which is used
// only for [21 >= number > 29]
    if (decenas == 2 && unidades == 0)
    {
        string_tens = "veinte ";
    }

// for numbers >= 30, you don't use a single word such as veintiuno
// (twenty one), you must add 'y' (and), and use two words. v.gr 31
// 'treinta y uno' (thirty and one)
    if (decenas >= 3 && unidades >= 1) {
        string_tens = string_tens + " y ";
    }

// this line gathers all the hundreds, tens and units into the final string
// and returns it as the function value.
    final_string = string_hundreds + string_tens + string_units;


    return final_string;

} //end of function string_literal_conversion()================================

// handle some external special cases. Specially the millions, thousands
// and hundreds descriptors. Since the same rules apply to all number triads
// descriptions are handled outside the string conversion function, so it can
// be re used for each triad.

function LITERAL(number) {
    //number = number_format (number, 2);
    number1 = number;
    //settype (number, "integer");
    cent = number1.split(".");
    centavos = cent[1];
    //Mind Mod
    number = cent[0];
    if (centavos == 0 || centavos == undefined) {
        centavos = "00";
    }

    if (number == 0 || number == "")
    { // if amount = 0, then forget all about conversions,
        centenas_final_string = " cero "; // amount is zero (cero). handle it externally, to
        // function breakdown
    } else
    {

        millions = ObtenerParteEntDiv(number, 1000000); // first, send the millions to the string
        number = mod(number, 1000000);           // conversion function

        if (millions != 0)
        {
            // This condition handles the plural case
            if (millions == 1)
            {              // if only 1, use 'millon' (million). if
                descriptor = " millon ";  // > than 1, use 'millones' (millions) as
            } else
            {                           // a descriptor for this triad.
                descriptor = " millones ";
            }
        } else
        {
            descriptor = " ";                 // if 0 million then use no descriptor.
        }
        millions_final_string = string_literal_conversion(millions) + descriptor;


        thousands = ObtenerParteEntDiv(number, 1000);  // now, send the thousands to the string
        number = mod(number, 1000);            // conversion function.
        //print "Th:".thousands;
        if (thousands != 1)
        {                   // This condition eliminates the descriptor
            thousands_final_string = string_literal_conversion(thousands) + " mil ";
            //  descriptor = " mil ";          // if there are no thousands on the amount
        }
        if (thousands == 1)
        {
            thousands_final_string = " mil ";
        }
        if (thousands < 1)
        {
            thousands_final_string = " ";
        }

        // this will handle numbers between 1 and 999 which
        // need no descriptor whatsoever.

        centenas = number;
        centenas_final_string = string_literal_conversion(centenas);

    } //end if (number ==0)

    /*if (ereg("un",centenas_final_string))
     {
     centenas_final_string = ereg_replace("","o",centenas_final_string);
     }*/
    //finally, print the output.

    /* Concatena los millones, miles y cientos*/
    cad = millions_final_string + thousands_final_string + centenas_final_string;

    /* Convierte la cadena a Mayúsculas*/
    cad = cad.toUpperCase();

    if (centavos.length > 2)
    {

        if (centavos.substring(2, 3) >= 5) {
            centavos = centavos.substring(0, 1) + (parseInt(centavos.substring(1, 2)) + 1).toString();
        } else {

            centavos = centavos.substring(0, 1);
        }
    }

    /* Concatena a los centavos la cadena "/100" */
    if (centavos.length == 1)
    {
        centavos = centavos + "0";
    }
    centavos = centavos + "/100";


    /* Asigna el tipo de moneda, para 1 = PESO, para distinto de 1 = PESOS*/
    if (number == 1)
    {
        moneda = " BOLIVIANOS ";
    } else
    {
        moneda = " BOLIVIANOS ";
    }
    /* Regresa el número en cadena entre paréntesis y con tipo de moneda y la fase M.N.*/
    //Mind Mod, si se deja MIL pesos y se utiliza esta función para imprimir documentos
    //de caracter legal, dejar solo MIL es incorrecto, para evitar fraudes se debe de poner UM MIL pesos
    if (cad == 'MIL ') {
        cad = 'UN MIL ';
    }
    return cad + moneda + centavos + " Bs.";
}


function LITERALDOLAR(number) {
    //number = number_format (number, 2);
    number1 = number;
    //settype (number, "integer");
    cent = number1.split(".");
    centavos = cent[1];
    //Mind Mod
    number = cent[0];
    if (centavos == 0 || centavos == undefined) {
        centavos = "00";
    }

    if (number == 0 || number == "")
    { // if amount = 0, then forget all about conversions,
        centenas_final_string = " cero "; // amount is zero (cero). handle it externally, to
        // function breakdown
    } else
    {

        millions = ObtenerParteEntDiv(number, 1000000); // first, send the millions to the string
        number = mod(number, 1000000);           // conversion function

        if (millions != 0)
        {
            // This condition handles the plural case
            if (millions == 1)
            {              // if only 1, use 'millon' (million). if
                descriptor = " millon ";  // > than 1, use 'millones' (millions) as
            } else
            {                           // a descriptor for this triad.
                descriptor = " millones ";
            }
        } else
        {
            descriptor = " ";                 // if 0 million then use no descriptor.
        }
        millions_final_string = string_literal_conversion(millions) + descriptor;


        thousands = ObtenerParteEntDiv(number, 1000);  // now, send the thousands to the string
        number = mod(number, 1000);            // conversion function.
        //print "Th:".thousands;
        if (thousands != 1)
        {                   // This condition eliminates the descriptor
            thousands_final_string = string_literal_conversion(thousands) + " mil ";
            //  descriptor = " mil ";          // if there are no thousands on the amount
        }
        if (thousands == 1)
        {
            thousands_final_string = " mil ";
        }
        if (thousands < 1)
        {
            thousands_final_string = " ";
        }

        // this will handle numbers between 1 and 999 which
        // need no descriptor whatsoever.

        centenas = number;
        centenas_final_string = string_literal_conversion(centenas);

    } //end if (number ==0)

    /*if (ereg("un",centenas_final_string))
     {
     centenas_final_string = ereg_replace("","o",centenas_final_string);
     }*/
    //finally, print the output.

    /* Concatena los millones, miles y cientos*/
    cad = millions_final_string + thousands_final_string + centenas_final_string;

    /* Convierte la cadena a Mayúsculas*/
    cad = cad.toUpperCase();

    if (centavos.length > 2)
    {

        if (centavos.substring(2, 3) >= 5) {
            centavos = centavos.substring(0, 1) + (parseInt(centavos.substring(1, 2)) + 1).toString();
        } else {

            centavos = centavos.substring(0, 1);
        }
    }

    /* Concatena a los centavos la cadena "/100" */
    if (centavos.length == 1)
    {
        centavos = centavos + "0";
    }
    centavos = centavos + "/100";


    /* Asigna el tipo de moneda, para 1 = PESO, para distinto de 1 = PESOS*/
    if (number == 1)
    {
        moneda = " DOLARES ";
    } else
    {
        moneda = " DOLARES ";
    }
    /* Regresa el número en cadena entre paréntesis y con tipo de moneda y la fase M.N.*/
    //Mind Mod, si se deja MIL pesos y se utiliza esta función para imprimir documentos
    //de caracter legal, dejar solo MIL es incorrecto, para evitar fraudes se debe de poner UM MIL pesos
    if (cad == 'MIL ') {
        cad = 'UN MIL ';
    }
    return cad + moneda + centavos + " $us.";
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}


// takes the form field value and returns true on valid number
function valcreditcard(value) {
    // accept only digits, dashes or spaces
    if (/[^0-9-\s]+/.test(value))
        return false;

    // The Luhn Algorithm. It's so pretty.
    var nCheck = 0, nDigit = 0, bEven = false;
    value = value.replace(/\D/g, "");

    for (var n = value.length - 1; n >= 0; n--) {
        var cDigit = value.charAt(n),
            nDigit = parseInt(cDigit, 10);

        if (bEven) {
            if ((nDigit *= 2) > 9)
                nDigit -= 9;
        }

        nCheck += nDigit;
        bEven = !bEven;
    }

    return (nCheck % 10) == 0;
}




/*******************************************************************************
 **** Muestra el total con descuento editable***********************************
 * *****************************************************************************
 */




function cargarMoneda() {

    var idmoneda = $("#idmoneda").val();
    var route = "/listarTipoCambio/" + idmoneda;
    $.get(route, function (res) {
        bolivianos1 = parseFloat(res[0].tipoCambio);
    });
}

function inputcargar(btn) {


    var route = "/Cliente/" + btn + "/edit";
    $.get(route, function (res) {
        $("#id").val(res.id);
        $("#nombres").val(res.nombre);
        $("#dirreccionenvio").val(res.direccion);
        $("#telefonoFijos").val(res.telefonoFijo);
        $("#correos").val(res.correo);
        $("#celulars").val(res.celular);
        $("#razonSocials").val(res.razonSocial);
//        $("#NITs").val(res.NIT);
//        $('#tipoclientes option:selected').val(res.idTipoCliente);
//        $('#tipoclientes').material_select();
        $('#ci').val(res.NIT);
//        descuentoProbando = res.idDescuento;
    });
}

function cargaralmacendesucursal() {
    var idpunto = $("#iddelpuntoventa").val();
    $('#almacencombo')
        .find('option')
        .remove()
        .end();
    $('#almacencombo').material_select();
    var route = "/listaralmacensucursal/" + idpunto;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $('#almacencombo').append('<option value=' + value.id + ' >' + value.nombre + '</option>');
            $('#almacencombo').material_select();
        });
        $("#almacencombo").val($("#almacen").val());
        $("#almacn option:selec").val($("#almacen").val());
        $('#almacencombo').material_select();
    });
}

//MIGUEL NUEVO
$('#nrCuotas').keyup(function () {

    var cantidadCuotas = $(this).val();
    var saldo = parseFloat($("#saldo").val());

    if (cantidadCuotas == "" || cantidadCuotas == "0") {
        $('#CantidadApagarXcuotas').val(saldo.toFixed(2));
        return false;
    } else {
        var total = saldo / cantidadCuotas;
        $('#CantidadApagarXcuotas').val(total.toFixed(2));
    }

});


//MIGUEL NUEVO
$('#FomasPagos').click(function () {
    $("#nrCuotas").val("");
    $("#CantidadApagarXcuotas").val("");
    $("#observaciones").val("");

});


function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    } else {
        return true;

    }
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
function productosVendidos(id) {
    debugger
    $("#creditlist").slideUp(10, function () {
        $("#productCredit").slideDown(10);
        $("#credv").text(id);
        mostrarProductos(id);
    });

}
function mostrarProductos(id) {
    var contenedor = $("#productosdelcredito");
    contenedor.empty();
    var route = "/obtenerporductoscombo/" + id;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $("#botonproductos").empty();
            contenedor.append("<div class='product col s12 m4 l3' style='margin-top: 20px;'>" +
                "<div class='card'>" +
                "<div class='card-image waves-effect waves-block waves-light'>" +
                "<img src='" + value.imagen + "' alt='product-img' width='200'></div>" +
                "<ul class = 'card-action-buttons' >" +
                "<li> <a class='btn-floating waves-effect waves-light light-blue' ><i class='mdi-action-info activator'></i></a>" +
                "</li></ul><div class='card-content' ><div class='row' ><div class='col s8'>" +
                "<p class='card-title grey-text text-darken-4'><a href='#' class='grey-text text-darken-4'><strong>" + value.nombre + "</strong></a>" +
                "</p></div><div class ='col s4 no-padding'>" +
                "<p><strong>Compuesto x: </strong>" + value.cantidad + "</br>" +
                "<strong>IdProducto: </strong>" + value.idcontenido + "</br>" +
                "</p></div></div></div>");
        });
    });
}
function listarCreditosP() {
    $("#productCredit").slideUp(10, function () {
        $("#creditlist").slideDown(10);
        $("#credito").val("");
        $("#tablacategoria").DataTable().destroy();
        // $("#monto").val("");
        Cargartabla();
    });
}

