 $(document).ready(function () {
    Cargar();  
    $('.modal').modal({dismissible: false});      
    $("#closemodal").click(function (event) {
        $(".lean-overlay").remove();
    });
});

function Nuevo_HerraObra(){
    $('#nombre').val('');    
    $("#modal1").modal('open');    
}

function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    idObra=$('#idObra').val();
    var route = "../listarHerraObra/"+idObra;
    $('#lista_MaterialObra').DataTable({
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
            {data: 'obra'},
            {data: 'herramienta'},
            {data: 'cantidad'},
            {data: 'precio'},
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
    var route = "../HerraObra/" + btn.value + "/edit";
    $.get(route, function (res) {
        $("#obras").val(res[0].id_obra);
        $("#idactualizar").val(res[0].id);
        $("#herramientas").val(res[0].id_herramienta);
         $('#herramientas').material_select();
        
        $("#cantidads").val(res[0].cantidad);
        $("#precios").val(res[0].precio);
    });
}

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "../HerraObra/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR EL HerraObra?",
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
                                $('#lista_MaterialObra').DataTable().destroy();
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
   
        var value = $("#idactualizar").val();
        var obra = $("#obras").val();
        var cantidad = $("#cantidads").val();
        var herramienta = $("#herramientas").val();
        var precio = $("#precios").val();
       
        var route = "../HerraObra/" + value + "";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {obra: obra,herramienta:herramienta,precio:precio,cantidad:cantidad},
            success: function () {
                $("#cantidads").val('0');
                $("#precios").val('0');
                $('#lista_MaterialObra').DataTable().destroy();
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
 
  
});

$("#guardar").click(function () {
  
        var obra = $("#obra").val();
        var cantidad = $("#cantidad").val();
        var herramienta = $("#herramienta").val();
        var precio = $("#precio").val();
        
        var route = "../HerraObra";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {obra: obra,herramienta:herramienta,precio:precio,cantidad:cantidad},
            success: function () {
                $('#lista_MaterialObra').DataTable().destroy();
                Cargar();
                $("#modal1").modal('close');
                $(".lean-overlay").remove();
                swal({title: "HerraObra GUARDADO EXITOSAMENTE",
                    type: "success",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
         $("#cantidad").val("0");
         $("#precio").val("0");
            },
            error: function () {
                swal({title: "ERROR AL GUARDAR",
                    type: "error",
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000});
            }
        });
   
});

