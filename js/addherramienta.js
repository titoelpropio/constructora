 $(document).ready(function () {
    Cargar();  
    $('.modal').modal({dismissible: false});      
    $("#closemodal").click(function (event) {
        $(".lean-overlay").remove();
    });
});

function Nuevo_Herramienta(){
    $('#nombre').val('');    
    $("#modal1").modal('open');    
}

function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listarHerramienta";
    // $('#datos').empty();
    // $.get(route, function (res) {
    //     $(res).each(function (key, value) {
    //         tabladatos.append("<tr>" +
    //                 "<td>" + value.id + "</td>" +
    //                 "<td>" + value.nombre + "</td>" +
    //                 "<td>" + value.precio + "</td>" +
    //                 "<td>" +
    //                 "<button value=" + value.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'>" +
    //                 "<i class='material-icons'>mode_edit</i>" +
    //                 "</button>" +
    //                 "</td><td>" +
    //                 "<button class='waves-effect waves-light btn btn-floating' value=" + value.id + " OnClick='Eliminar(this);' title='Eliminar'>" +
    //                 "<i class='material-icons'>delete</i>" +
    //                 "</button>" +
    //                 "</td>" +
    //                 "</tr>");
    //     });
    //     paginador();
    // });
     $('#lista_Herramienta').DataTable({
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
            {data: 'id'},
            {data: 'nombre'},
            {data: 'precio'},
            {data: 'Editar', 'class': 'dt-body-center'},
            {data: 'Eliminar', 'class': 'dt-body-center'},
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
            }            
        ],
        "order": [[ 0, "asc" ]],
    });
}

function Mostrar(btn) {
    var route = "Herramienta/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#nombres").val(res[0].nombre);
        $("#idactualizar").val(res[0].id);
        $("#precios").val(res[0].precio);
    });
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "Herramienta/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR EL Herramienta?",
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
                                $('#lista_Herramienta').DataTable().destroy();
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

$("#actualizar").click(function () {
    if ($("#perfilpuedeModificar").val() == 1) {
       
        var value = $("#idactualizar").val();
        var nombre = $("#nombres").val();
        var precio = $("#precios").val();
        if (!nombre || !nombre.trim().length) {
            Herramientaize.toast('NOMBRE VACIO', 1000, 'rounded');
            return;
        }
        var route = "Herramienta/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {nombre: nombre,precio:precio},
            success: function () {
                  $("#nombre").val("");
                 $("#descripcion").val("");
                $("#precio").val('0');
                $('#lista_Herramienta').DataTable().destroy();
                Cargar();
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
        swal({title: "NO TIENE PERMISO PARA ACTUALIZAR",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
});

$("#guardar").click(function () {
    if ($("#perfilpuedeGuardar").val() == 1) {
        var nombre = $("#nombre").val();
        var precio = $("#precio").val();
        if (!nombre || !nombre.trim().length) {
            Herramientaize.toast('NOMBRE VACIO', 1000, 'rounded');
            return;
        }
        var route = "Herramienta";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {nombre: nombre,precio:precio},
            success: function () {
                $('#lista_Herramienta').DataTable().destroy();
                Cargar();
                $("#modal1").modal('close');
                $(".lean-overlay").remove();
                swal({title: "Herramienta GUARDADO EXITOSAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                $("#nombre").val("");
                 $("#descripcion").val("");
                $("#precio").val('0');
            },
            error: function () {
                swal({title: "ERROR AL GUARDAR",
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

