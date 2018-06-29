 $(document).ready(function () {
    Cargar();  $('.modal').modal();
});

function openmodal(btn) {
    $("#modal2").modal('open');
   Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listaperfil";
    $('#datos').empty();
    // $.get(route, function (res) {
    //     $(res).each(function (key, value) {
    //         tabladatos.append("<tr>" +
    //                 "<td>" + value.nombre + "</td>" +
    //                 "<td>" +
    //                 "<button value=" + value.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'><i class='material-icons'>mode_edit</i></button>" +
    //                 "</td><td>" +
    //                 "<button class='btn btn-danger btn-floating' value=" + value.id + " OnClick='Eliminar(this);' title='Eliminar'><i class='material-icons'>delete</i></button>" +
    //                 "</td><td>" +
    //                 "<button class='btn btn-danger btn-floating' value=" + value.id + " OnClick='perfilobjeto(this);' title='Perfil Objeto'><i class='material-icons'>view_list</i></button>" +
    //                 "</td>" +
    //                 "</tr>");
    //     });
    //     paginador();
    // });
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
            {data: 'Editar', 'class': 'dt-body-center'},
            {data: 'Eliminar', 'class': 'dt-body-center'},
            {data: 'Permisos', 'class': 'dt-body-center'},
        ],
        "columnDefs": [
            {
                targets: 1,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button value=" + row.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'><i class='material-icons'>mode_edit</i></button>"
                }
            },
            {
                targets: 2,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button class='btn btn-danger btn-floating' value=" + row.id + " OnClick='Eliminar(this);' title='Eliminar'><i class='material-icons'>delete</i></button>"
                }
            },    
            {
                targets: 3,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button class='btn btn-danger btn-floating' value=" + row.id + " OnClick='perfilobjeto(this);' title='Perfil Objeto'><i class='material-icons'>view_list</i></button>"
                }
            }            
        ],
        "order": [[ 0, "asc" ]],
    });
}

$("#guardar").click(function () {
    if ($("#perfilpuedeGuardar").val() == 1) {
        var nombre = $("#nombre").val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('Campos vacios', 1000, 'rounded');
            return;
        }


        var tipoCambio;
        var apertura = 0;
        var admin = 0;
        var route = "Perfil";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {nombre: nombre},
            success: function () {
                $('#tablacategoria').DataTable().destroy();
                Cargar();
                $(".lean-overlay").remove();
                $("#modal1").modal('close');
                swal({title: "GUARDADO EXITOSO",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                $("#nombre").val("");
            }, error: function () {
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

function Mostrar(btn) {
    var route = "Perfil/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#nombreact").val(res.nombre);
        $("#idactualizar").val(res.id);
        var tipoCambio = res.tipoCambio;
        var apertura  = res.apertura;
        var admin = res.admin;

    });
}

function perfilobjeto(btn) {
    var route = "GestionarPerfilObjeto/" + btn.value;
    window.location.href = route;
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "/Perfil/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR PERFIL?",
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

$("#actualizar").click(function () {
    if ($("#perfilpuedeModificar").val() == 1) {
        var value = $("#idactualizar").val();
        var nombre = $("#nombreact").val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('Campos vacios', 1000, 'rounded');
            return;
        }
        var route = "Perfil/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {nombre: nombre},
            success: function () {
                $('#tablacategoria').DataTable().destroy();
                Cargar();
                $("#modal2").modal('close');
                $('.lean-overlay').remove();
                swal({title: "DATOS ACTUALIZADOS CORRECTAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            },
            error: function () {
                $("#modal2").modal('close');
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

