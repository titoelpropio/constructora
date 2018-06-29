 $(document).ready(function () {
    Cargar();  
    $('.modal').modal({dismissible: false});      
    $("#closemodal").click(function (event) {
        $(".lean-overlay").remove();
    });
});

function Nuevo_Obra(){
    $('#nombre').val('');    
    $("#modal1").modal('open');    
}

function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listarobra";
    $('#lista_Obra').DataTable({
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
            {data: 'descripcion'},
            {data: 'duracion'},
            {data: 'presupuesto'},
            {data: 'Editar', 'class': 'dt-body-center'},
            {data: 'Eliminar', 'class': 'dt-body-center'},
        ],
        "columnDefs": [
            {
                targets: 5,
                searchable: false,
                orderable: false,
                render: function (data, type, row) {
                    return "<button value=" + row.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#' title='Editar'><i class='material-icons'>mode_edit</i></button>"
                }
            },
            {
                targets: 6,
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
    var route = "Obra/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#nombres").val(res[0].nombre);
        $("#idactualizar").val(res[0].id);
        $("#descripcions").val(res[0].descripcion);
        $("#preciousos").val(res[0].precio_uso);
    });
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "Obra/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR EL Obra?",
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
                                $('#lista_Obra').DataTable().destroy();
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
        var descripcion = $("#descripcions").val();
        var duracion = $("#duracions").val();
        var presupuesto = $("#presupuestos").val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('NOMBRE VACIO', 1000, 'rounded');
            return;
        }
        var route = "Obra/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {nombre: nombre,descripcion:descripcion,duracion:duracion,presupuesto:presupuesto},
            success: function () {
                  $("#nombre").val("");
                 $("#descripcion").val("");
                $('#lista_Obra').DataTable().destroy();
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
        var descripcion = $("#descripcion").val();
        var duracion = $("#duracion").val();
        var presupuesto = $("#presupuesto").val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('NOMBRE VACIO', 1000, 'rounded');
            return;
        }
        var route = "Obra";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {nombre: nombre,descripcion:descripcion,duracion:duracion,presupuesto:presupuesto},
            success: function () {
                $('#lista_Obra').DataTable().destroy();
                Cargar();
                $("#modal1").modal('close');
                $(".lean-overlay").remove();
                swal({title: "Obra GUARDADO EXITOSAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
                $("#nombre").val("");
                 $("#descripcion").val("");
                $("#duracion").val('');
                $("#presupuesto").val('');
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