 $(document).ready(function () {
    Cargar();  $('.modal').modal();
});

function limpiar(){
    $("#nombre").val("");
    $("#icono").val("");
    $("#nro").val("");
}

function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listarmodulo";
    $('#datos').empty();
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            tabladatos.append("<tr>" +
                    "<td>" + value.nombre + "</td>" +
                    "<td>" +
                    "<button value=" + value.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'><i class='material-icons'>mode_edit</i></button>" +
                    "</td><td>" +
                    "<button class='btn btn-danger btn-floating' value=" + value.id + " OnClick='Eliminar(this);' title='Eliminar'><i class='material-icons'>delete</i></button>" +
                    "</td>" +
                    "</tr>");
        });
        paginador();
    });
}

$("#guardar").click(function () {
    if ($("#perfilpuedeGuardar").val() == 1) {
        var nombre = $("#nombre").val();
        // if (!nombre || !nombre.trim().length) {
        //     Materialize.toast('Campos vacios', 1000, 'rounded');
        //     return;
        // }
        // if (document.getElementById('test1').checked == true) {
        //     habilitado = 1;//SI
        // } else {
        //     habilitado = 0;//NO        
        var route = "Modulo";
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
    var route = "Modulo/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#nombreact").val(res.nombre);
        $("#iconoact").val(res.icono);
        $("#nroact").val(res.nro);

        if (res.habilitado == 1) {
            document.getElementById('test1act').checked = true;
            document.getElementById('test2act').checked = false;
        } else {
            document.getElementById('test1act').checked = false;
            document.getElementById('test2act').checked = true;
        }

        $("#idactualizar").val(res.id);
    });
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "Modulo/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR MODULO?",
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
        var icono = $("#iconoact").val();
        var nro = $("#nroact").val();

        if (document.getElementById('test1act').checked == true) {
            habilitado = 1;//SI
        } else {
            habilitado = 0;//NO        
        }
                
        var route = "/Modulo/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {nombre: nombre,icono:icono,habilitado:habilitado,nro:nro},
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

function paginador() {
    // Setup - add a text input to each footer cell
    $('#tablacategoria tfoot th').each(function () {
        var title = $(this).text();
        if (title == "") {
        } else {
            $(this).html('<input type="text" placeholder="' + title + '" style=" border-radius: 3px;"/>');
        }
    });
    var route = "obtenerModulo/seguridad";
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