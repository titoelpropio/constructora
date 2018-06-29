 $(document).ready(function () {
    Cargar();  $('.modal').modal();
    cargarListaP();
});
function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function openmodalListaPrecio(btn) {
    $("#modal3").modal('open');
    MostrarDatos(btn);
}

function MostrarDatos(btn) {
    $("#idClient").val(btn.value);
    MostrarTabla(btn.value);
}
$("#agregarLista").click(function () {
    var idCliente = $("#idClient").val();
    var idListaPrecio = $("#idlistaP").val();

    if (idListaPrecio == "null" || idListaPrecio == "") {
        Materialize.toast('Seleccione una lista de Precio', 2000, 'rounded');
        return false;
    }

    var route = "AgregarDetalleCL";
    var token = $("#token").val();
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'get',
        dataType: 'json',
        data: {
            idCliente: idCliente,
            idListaPrecio: idListaPrecio
        },
        success: function (json) {
//            $('#tablacategoria').DataTable().destroy();
            cargarListaP();
            var idClient = json.idCliente;
            var mensaje = json.mensaje;
            var mensaje2 = json.mensaje2;
//            $('.lean-overlay').remove();
            if (mensaje == "Ya Existe esa lista de precio") {
                swal({title: mensaje,
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                return;
            }
            if (mensaje2 == "No se puede ingresar una lista de precio") {
                swal({title: mensaje2,
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                return;
            }
            MostrarTabla(idClient);

            swal({title: "AGREGADO CORRECTAMENTE",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        },
        error: function () {
            $("#modal2").modal('close');
            swal({title: "ERROR AL ACTUALIZAR",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });

});


function MostrarTabla(btn) {
    var idVenta = $("#venta").val();
    var tabladatos = $('#resultadoLista');
    var route = "listarListaPrecioCliente/" + btn;
    $('#resultadoLista').empty();
    $.get(route, function (res) {
        $('#resultadoLista').empty();
        $(res).each(function (key, value) {

            tabladatos.append("<tr>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" + value.abreviatura + "</td>" +
                    "<td>" +
                    "<button class='btn btn-danger btn-floating' value=" + value.id + " OnClick='EliminarLista(this);' title='Eliminar'>" +
                    "<i class='material-icons'>delete</i>" +
                    "</button>" +
                    "</td>" +
                    "</tr>"
                    );
        });
    });

}


function cargarListaP() {
    $('#idlistaP')
            .find('option')
            .remove()
            .append('<option value="null">Selecione una Moneda</option>')
            .val("");
    $('#idlistaP').material_select();
    var route = "/listarprecio/";
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $('#idlistaP').append('<option value=' + value.id + ' selected name=' + value.nombre + '>' + value.nombre + '  ( ' + value.abreviatura + ' )' + '</option>');
            $('#idlistaP').material_select();
        });
    });
}

function EliminarLista(btn) {
    var route = "/DetalleClienteListaPrecio/" + btn.value + "";
    var token = $("#token").val();

    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'DELETE',
        dataType: 'json',
        success: function (json) {
            var idcliente = json.idCliente;

//            $('#tablacategoria').DataTable().destroy();
            MostrarTabla(idcliente);
            swal({title: "ELIMINACION COMPLETA",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        },
        error: function () {

            swal({title: "ERROR AL ELIMINAR",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });


}
/*
 * Metodo para cargar la tabla con la lista de clientes sregistrados en el sistema
 */
function Cargar() {
    var multiLista = $("#multiLista").val();
    var route = 'listarcliente';
    $('#lista_clientes').DataTable({
        paging: true,
        info: true,
        filter: true,
        stateSave: true,
        responsive: true,
        // 'processing': true,
        // 'serverSide': true,
        ajax: {
            url: route,
            type: "get",
            dataSrc: '',
            // async: false,
        },
        'columns': [
            {data: 'id'},
            {data: 'nombre'},
            {data: 'direccion'},
            {data: 'telefonoFijo'},
            {data: 'celular'},
            {data: 'correo'},
            {data: 'ciudad'},
            {data: 'tipocliente'},
            {data: 'listaprecio'},
            {data: 'Preferencias'},
            {data: 'Editar', 'class': 'dt-body-center'},
            {data: 'Eliminar', 'class': 'dt-body-center'},
            {data: 'lista_precio', 'class': 'dt-body-center'}
        ],
        "columnDefs": [
            {
                targets: 0,
                visible: false,
                searchable: false,
            },
            {
                targets: 11,
                searchable: false,
                orderable:false,
                render: function (data, type, row) {
                    return "<button value=" + row.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating' data-target='modal2' title='Editar'>" +
                        "<i class='material-icons'>mode_edit</i>" +
                        "</button>";
                }
            },
            {
                targets: 12,
                searchable: false,
                orderable:false,
                render: function (data, type, row) {
                    return "<button class='btn btn-danger btn-floating' value=" + row.id + " OnClick='Eliminar(this);' title='Eliminar'>" +
                    "<i class='material-icons'>delete</i>" +
                    "</button>";
                }
            },
            {
                targets: 13,
                searchable: false,
                orderable:false,
                render: function (data, type, row) {
                    if (multiLista == 0){
                        return "";
                    }else{
                        return "<button class='waves-effect waves-light btn btn-floating' data-target='modal3' value=" + row.id + " OnClick='openmodalListaPrecio(this);'  title='Lista de Precio'>" +
                            "<i class='mdi-action-account-child'></i>" +
                            "</button>";
                    }
                }
            }
        ],
        "order": [[ 1, "asc" ]],
    });
}

/*
 * Metodo para mostrar los datos de un cliente en un modal
 */
function Mostrar(btn) {
    var route = "/Cliente/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#id").val(res.id);
        $.get(route, function (res) {
            $("#nombres").val(res.nombre);
            $("#direccions").val(res.direccion);
            $("#telefonoFijos").val(res.telefonoFijo);
            $("#correos").val(res.correo);
            $("#celulars").val(res.celular);
            $("#razonSocials").val(res.razonSocial);
            $("#NITs").val(res.NIT);
            $("#listaprecio1").val(res.idlistaprecio);
            $('#listaprecio1 option:selected').val(res.idlistaprecio);
            $("#listaprecio1").material_select();
            $("#ciudads").val(res.idCiudad);
            $("#preferenciass").val(res.Preferencias);
            $('#tipoclientes option:selected').val(res.idTipoCliente);
            $('#tipoclientes').material_select();
            $("#cuentaconact").val(res.idcuenta);
            $("#cuentaconact option:selected").val(res.idcuenta);
            $("#cuentaconact").material_select();
        });
    });
}
/*
 * Metodo para eliminar un cliente
 */
function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "/Cliente/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR EL CLIENTE?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Si, eliminarlo!",
            cancelButtonText: "No, cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false},
                function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            url: route,
                            headers: {'X-CSRF-TOKEN': token},
                            type: 'DELETE',
                            dataType: 'json',
                            success: function () {
                                $('#lista_clientes').DataTable().ajax.reload();
                                swal({title: "ELIMINACION COMPLETA",
                                    type: "success",
                                    showConfirmButton: false,
                                    closeOnConfirm: false,
                                    timer: 1000});
                            }
                        });
                    } else {
                        swal({title: "CANCELADO",
                            type: "error",
                            showConfirmButton: false,
                            closeOnConfirm: false,
                            timer: 1000});
                    }
                });
    } else {
        swal({title: "NO TIENE PERMISO PARA ELIMINAR",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
}
/*
 * Metodo para modificar un cliente
 */
$("#actualizar").click(function () {
    if ($("#perfilpuedeModificar").val() == 1) {
        var value = $("#id").val();
        var idcuenta = $("#cuentaconact").val();
        var nombre = $("#nombres").val( );
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('NOMBRE VACIO', 2000, 'rounded');
            return;
        }


        var direccion = $("#direccions").val( );
        var telefonoFijo = $("#telefonoFijos").val( );
        var correo = $("#correos").val( );
        if (!correo || !correo.trim().length) {
        } else {
            if (!valEmail(correo)) {
                Materialize.toast('Inserte una direccion de correo correcta', 2000, 'rounded');
                return false;
            }
        }
        var celular = $("#celulars").val( );
        var ciudad = $("#ciudads").val();
        if (!ciudad || !ciudad.trim().length) {
            Materialize.toast('CIUDAD VACIA', 2000, 'rounded');
            return;
        }
        var razonSocial = $("#razonSocials").val( );
        if (!razonSocial || !razonSocial.trim().length) {
            Materialize.toast('RAZON SOCIAL VACIA', 2000, 'rounded');
            return;
        }
        var NIT = parseInt($("#NITs").val()) + "";
        if (!NIT || !NIT.trim().length) {
            Materialize.toast('NIT VACIO', 2000, 'rounded');
            return;
        }
        var preferencias = $("#preferenciass").val();
        var tipocliente = $("#tipoclientes").val( );
        var descuento = $("#descuento1").val();
        var route = "/Cliente/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {
                nombre: nombre,
                direccion: direccion,
                telefonoFijo: telefonoFijo,
                correo: correo,
                celular: celular,
                razonSocial: razonSocial,
                NIT: NIT,
                idCiudad: ciudad,
                Preferencias: preferencias,
                idTipoCliente: tipocliente,
                idcuenta: idcuenta,
                idDescuento: descuento
            },
            success: function () {
                $('#lista_clientes').DataTable().ajax.reload();
                $("#modal2").modal('close');
                $('.lean-overlay').remove();
                swal({title: "ACTUALIZACION COMPLETA",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            },
            error: function () {
                $("#modal2").modal('close');
                swal({title: "ERROR AL ACTUALIZAR",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });
    } else {
        swal({title: "NO TIENE PERMISO PARA MODIFICAR",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
});
/*
 * Metodo para crear un nuevo cliente s
 */
$("#guardar").click(function () {
    if ($("#perfilpuedeGuardar").val() == 1) {
        var nombre = $("#nombre").val( );
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('NOMBRE VACIO', 2000, 'rounded');
            return;
        }
        var direccion = $("#direccion").val( );
        var telefonoFijo = $("#telefonoFijo").val( );
        var correo = $("#correo").val( );
        if (!correo || !correo.trim().length) {
        } else {
            if (!valEmail(correo)) {
                Materialize.toast('Inserte una direccion de correo correcta', 2000, 'rounded');
                return false;
            }
        }
        var idcuenta = $("#cuentacon").val();
        var celular = $("#celular").val( );
        var ciudad = $("#ciudad").val();
        if (!ciudad || !ciudad.trim().length) {
            Materialize.toast('CIUDAD VACIA', 2000, 'rounded');
            return;
        }
        var razonSocial = $("#razonSocial").val();
        if (!razonSocial || !razonSocial.trim().length) {
            Materialize.toast('RAZON SOCIAL VACIA', 2000, 'rounded');
            return;
        }
        var NIT = parseInt($("#NIT").val()) + "";
        if (!NIT || !NIT.trim().length) {
            Materialize.toast('NIT VACIO', 2000, 'rounded');
            return;
        }
        var preferencias = $("#preferencias").val();
        var tipocliente = $("#tipocliente").val( );
        var descuentos = $("#descuento").val();
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
                idCiudad: ciudad,
                Preferencias: preferencias,
                idcuenta: idcuenta,
                idTipoCliente: tipocliente,
                idDescuento: descuentos
            },
            success: function () {
                $('#lista_clientes').DataTable().ajax.reload();
                $(".lean-overlay").remove();
                $("#modal1").modal('close');
                swal({title: "CLIENTE CREADO EXITOSAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                $("#nombre").val("");
                $("#direccion").val("");
                $("#telefonoFijo").val("");
                $("#correo").val("");
                $("#celular").val("");
                $("#razonSocial").val("");
                $("#NIT").val("");
            },
            error: function () {
                swal({title: "ERROR AL GUARDAR CLIENTES",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });
    } else {
        swal({title: "NO TIENE PERMISO PARA GUARDAR",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
});
/*
 * Metodo para la paginacion de la tabla
 */
function paginador() {
    // Setup - add a text input to each footer cell
    $('#tablacategoria tfoot th').each(function () {
        var title = $(this).text();
        if (title == "") {
        } else {
            $(this).html('<input type="text" placeholder="' + title + '" style=" border-radius: 3px;"/>');
        }
    });
    var route = "obtenerModulo/venta";
    var table;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            var cantidad = value.cantidad;
            table = $('#tablacategoria').DataTable({
                "pagingType": "full_numbers",
                retrieve: true,
                "order": [0, "asc"],
                "lengthMenu": [[cantidad], [cantidad]],
                responsive: true
            });
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that.search(this.value).draw();
                    }
                });
            });
        });
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}