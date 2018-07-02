 $(document).ready(function () {
    Cargar();  
    $('.modal').modal({dismissible: false}); 
    //cargarselectcargo();
    $("#descuento").ionRangeSlider({
        grid: true,
        min: 0,
        max: 100,
        from: 0
    });
});

function openmodal(btn) {
    $("#modal1").modal('open');
    Mostrar(btn);
}

// function cargarselectcargo() {
//     var route = "listarcargo/";
//     $.get(route, function (res) {
//         $(res).each(function (key, value) {
//             $('#Cargo').append('<option value=' + value.id + ' selected>' + value.nombre + '</option>');
//             $('#Cargo').material_select();
//         });
//     });
//     var router2 = "/listaturno/";
//     $.get(router2, function (rest) {
//         $(rest).each(function (key, value) {
//             $('#turno').append('<option value=' + value.id + ' selected>' + value.nombre + '</option>');
//             $('#turno').material_select();

//         });
//     });
// }

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listarempleados";
    $('#datos').empty();
    $.get(route, function (res) {
     
          
             $('#tablacategoria').DataTable({
        'paging': true,
        'info': true,
        'filter': true,
        'stateSave': true,
        // 'processing': true,
        // 'serverSide': true,
        'ajax': {
            url: route,
            type: "get",
            dataSrc: '',
            // async: false,
        },
        'columns': [
            {data: 'nombre'},
            {data: 'genero'},
            {data: 'docidentidad'},
            {data: 'Editar', 'class': 'dt-body-center'},
            {data: 'Eliminar', 'class': 'dt-body-center'},
            {data: 'Usuario', 'class': 'dt-body-center'},
        ],
        "columnDefs": [
            {
                targets: 3,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button value=" + row.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'><i class='material-icons'>mode_edit</i></button>"
                }
            },
            {
                targets: 4,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button class='btn btn-danger btn-floating' value=" + row.id + " OnClick='Eliminar(this);' title='Eliminar'><i class='material-icons'>delete</i></button>"
                }
            } ,
            {
                targets: 5,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button class='btn btn-danger btn-floating' value=" + row.id + " OnClick='usuario(this);' title='Asignar usuario'><i class='material-icons'>assignment_ind</i></button>"
                }
            }            
        ],
        "order": [[ 0, "asc" ]],
    });
        });
       // paginador();
}

function usuario(btn) {
    var route = "Gestionarusuario/" + btn.value;
    window.location.href = route;
}

function nuevoempleado() {
    if ($("#perfilpuedeGuardar").val() == 1) {
        var route = "contructora/AddEmpleado/";
        window.location.href = route;
    } else {
        swal({title: "NO TIENE PERMISO PARA CREAR EMPRESA",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
}

function Mostrar(btn) {
    var route = "Empleado/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#id").val(res.id);
        $("#nombre").val(res.nombre);
        $('#fechanacimiento').val(res.fecha_nac);
        $('#Docidentidad').val(res.docidentidad);
        $('#genero').val(res.genero);
        $('#genero').material_select();
    });
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "Empleado/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR EL EMPLEADO?",
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
                                $('#tablacategoria').DataTable().destroy();
                                Cargar();
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

$("#guardar").click(function () {
    var route = "Empleado";
    var token = $("#token").val();
    var nombre = $('#nombre').val();
    var apellido = $('#apellido').val();
    var fechaNacimiento = $('#fechanacimiento').val();
    var docIdentidad = $('#Docidentidad').val();
    var genero = $('#genero').val();
    $('input#nombre,input#Docidentidad,input#celular,input#correo').characterCounter();
    if (!nombre || !nombre.trim().length) {
        Materialize.toast('NOMBRE VACIO', 1000, 'rounded');
        return;
    }
    if (!fechaNacimiento || !fechaNacimiento.trim().length) {
        Materialize.toast('FECHA DE NACIMIENTO VACIO', 1000, 'rounded');
        return;
    }
    if (!docIdentidad || !docIdentidad.trim().length) {
        Materialize.toast('DOCUMENTO DE IDENTIDAD VACIO', 1000, 'rounded');
        return;
    }
    $.ajax({
        url: route,
        headers: {'X-CSRF-TOKEN': token},
        type: 'POST',
        dataType: 'json',
        data: {
            nombre: nombre,
            apellido: apellido,
            fechaNacimiento: fechaNacimiento,
            genero: genero,
            docIdentidad: docIdentidad
        },
        success: function () {
            var route = "Empleados";
            swal({title: "EMPLEADO GUARDADO EXITOSAMENTE",
                type: "success",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
            window.location.href = route;
        }, error: function () {
            swal({title: "ERROR AL GUARDAR",
                type: "error",
                showConfirmButton: false,
                closeOnConfirm: false,
                timer: 1000});
        }
    });

});

$("#actualizar").click(function () {
    if ($("#perfilpuedeModificar").val() == 1) {
        var value = $("#id").val();
        var nombre = $("#nombre").val();
       var apellido = $('#apellido').val();

        var fechaNacimiento = $('#fechanacimiento').val();
        var docIdentidad = $('#Docidentidad').val();
        var genero = $('#genero').val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('NOMBRE VACIO', 1000, 'rounded');
            return;
        }
        if (!fechaNacimiento || !fechaNacimiento.trim().length) {
            Materialize.toast('FECHA DE NACIMIENTO VACIO', 1000, 'rounded');
            return;
        }
        if (!docIdentidad || !docIdentidad.trim().length) {
            Materialize.toast('DOCUMENTO DE IDENTIDAD VACIO', 1000, 'rounded');
            return;
        }
      
        var route = "Empleado/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {
                nombre: nombre,
                fechaNacimiento: fechaNacimiento,
                genero: genero,
                apellido:apellido,
                docIdentidad: docIdentidad
            },
            success: function () {
               // $('#tablacategoria').DataTable().destroy();
                Cargar();
                $("#modal1").modal('close');
                $('.lean-overlay').remove();
                swal({title: "DATOS ACTUALIZADOS CORRECTAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }, error: function () {
                swal({title: "ERROR AL GUARDAR",
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

function paginador() {
    // Setup - add a text input to each footer cell
    $('#tablacategoria tfoot th').each(function () {
        var title = $(this).text();
        if (title == "") {
        } else {
            $(this).html('<input type="text" placeholder="' + title + '" style=" border-radius: 3px;"/>');
        }
    });
    var route = "obtenerModulo/general";
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

function cargaralmacendesucursal(idpunto) {
    $('#almacen')
            .find('option')
            .remove()
            .end()
            .append('<option value="null">Selecione un Almacen por Defecto</option>')
            .val('null');
    $('#almacen').material_select();

    var route = "/listaralmacendelasucursal/" + idpunto;
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            $('#almacen').append('<option value=' + value.id + ' >' + value.nombre + '</option>');
            $('#almacen').material_select();
        });
    });
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}