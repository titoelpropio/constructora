 $(document).ready(function () {
    Cargar();  $('.modal').modal();
    Cargarcombo();
});

function openmodal(btn) {
    $("#modal2").modal('open');
    Mostrar(btn);
}

function Cargar() {
    var tabladatos = $('#datos');
    var route = "listarobjeto";
    // $('#datos').empty();
    // $.get(route, function (res) {
    //     $(res).each(function (key, value) {
    //         var habilitados = "";
    //         var visible = "";
    //         if (value.habilitado == 1) {
    //             habilitados = "Habilidato";
    //         } else {
    //             habilitados = "No Habilitado";
    //         }
    //         if (value.visibleEnMenu == 1) {
    //             visible = "Visible";
    //         } else {
    //             visible = "No Visible";
    //         }

    //         tabladatos.append("<tr>" +
    //                 "<td>" + value.nombre + "</td>" +
    //                 "<td>" + value.tipoObjeto + "</td>" +
    //                 "<td>" + habilitados + "</td>" +
    //                 "<td>" + visible + "</td>" +
    //                 "<td>" + value.nommodulo + "</td>" +
    //                 "<td>" +
    //                 "<button value=" + value.id + " OnClick='openmodal(this);' class='waves-effect waves-light btn btn-floating'  href='#modal2' title='Editar'><i class='material-icons'>mode_edit</i></button>" +
    //                 "</td><td>" +
    //                 "<button class='btn btn-danger btn-floating' value=" + value.id + " OnClick='Eliminar(this);' title='Eliminar'><i class='material-icons'>delete</i></button>" +
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
            {data: 'tipoobjeto'},
            {data: "estado"   ,
                "render" : function ( data , type , row , meta )
                {
                    if (row.estado==0) {
                        habilitados = "Habilidato";
                    }else{
                        habilitados = "No Habilitado";
                    }
                    return habilitados;
                }
                 },
            {data: 'nommodulo'},
            {data: 'visiblemenu'},
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

function Cargarcombo() {
    var route = "listarmodulo";
    $.get(route, function (res) {
        $(res).each(function (key, value) {

            $('#modulo').append('<option value=' + value.id + ' selected>' + value.nombre + '</option>');
            $('#modulo').material_select();
            $('#modulos').append('<option value=' + value.id + ' selected>' + value.nombre + '</option>');
            $('#modulos').material_select();
        });
    });
}

function Mostrar(btn) {
    var route = "Objeto/" + btn.value + "/edit";
    $.get(route, function (res) {
        var habilitado = res.estado;
        var visibleEnMenu = res.visiblemenu;
        if (habilitado == 0) {
            document.getElementById('test1s').checked = 1;
        }
        if (habilitado == 1) {
            document.getElementById('test2s').checked = 1;
        }
        if (visibleEnMenu == 0) {

            document.getElementById('test3s').checked = 1;
        }
        if (visibleEnMenu == 1) {
            document.getElementById('test4s').checked = 1;
        }
        $("#idactualizar").val(res.id);
        $("#nombres").val(res.nombre);
        $("#tipoObjetos").val(res.tipoobjeto);
        $("#urlObjetos").val(res.urlobjeto);
        $('#modulos').val(res.idModulo);
        $('#modulos').material_select();
    });
}

function limpiar() {
    $("#nombre").val("");
    $("#nro").val("");
    $("#urlObjeto").val("");
    var si = document.getElementById('test1').checked;
    var no = document.getElementById('test2').checked;
    if (si == true) {
        si == false;
    }
    if (no == true) {
        no = false;
    } else {
        si = false;
    }
    var sii = document.getElementById('test3').checked;
    var noo = document.getElementById('test4').checked;
    if (sii == true) {
        sii == false;
    }
    if (noo == true) {
        noo = false;
    } else {
        sii == false;
    }
}

$("#guardar").click(function () {
    if ($("#perfilpuedeGuardar").val() == 1) {

        var nro = $("#nro").val();
        var habilitado = 0;
        var visibleEnMenu = 0;
        var si = document.getElementById('test1').checked;
        var no = document.getElementById('test2').checked;
        if (si == true) {
            habilitado = 0;
        }
        if (no == true) {
            habilitado = 0;
        } else {
            habilitado = 1;
        }
        var sii = document.getElementById('test3').checked;
        var noo = document.getElementById('test4').checked;
        if (sii == true) {
            visibleEnMenu = 0;
        }
        if (noo == true) {
            visibleEnMenu = 0;
        } else {
            visibleEnMenu = 1;
        }
        var nombre = $("#nombre").val();

        var tipoObjeto = $("#tipoObjeto").val();
        var urlObjeto = $("#urlObjeto").val();
        var modulo = $("#modulo").val();
        if (!nombre || !nombre.trim().length) {
            Materialize.toast('Campos vacios' + '  Nombre', 2500, 'rounded');
            return;
        }
        if (!tipoObjeto || !tipoObjeto.trim().length) {
            Materialize.toast('Campos vacios' + '  Tipo Objeto', 2500, 'rounded');
            return;
        }
        if (!urlObjeto || !urlObjeto.trim().length) {
            Materialize.toast('Campos vacios' + '  Url Objeto', 2500, 'rounded');
            return;
        }
       
        var route = "Objeto";
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'POST',
            dataType: 'json',
            data: {
                nombre: nombre,
                tipoObjeto: tipoObjeto,
                modulo: modulo,
                urlObjeto: urlObjeto,
                habilitado: habilitado
            },
            success: function () {
                $('#tablacategoria').DataTable().destroy();
                Cargar();
                $(".lean-overlay").remove();
                limpiar();
                $("#modal1").modal('close');
                swal({title: "GUARDADO EXITOSO",
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
        swal({title: "NO TIENE PERMISO PARA GUARDAR",
            type: "warning",
            showConfirmButton: false,
            closeOnConfirm: false,
            timer: 1000});
    }
});

function limpiar() {
    $("#nombre").val("");
    $("#tipoObjeto").val("");
    $("#urlObjeto").val("");
    $("#modulo").val("");
    $("#nro").val("");
    document.getElementById('test1').checked = false;
    document.getElementById('test2').checked = false;
    document.getElementById('test3').checked = false;
    document.getElementById('test4').checked = false;
}

$("#actualizar").click(function () {
    if ($("#perfilpuedeModificar").val() == 1) {
        var nro = $("#nro_act").val();
        var habilitado = 0;
        var visibleEnMenu = 0;
        var si = document.getElementById('test1s').checked;
        var no = document.getElementById('test2s').checked;
        if (si == true) {
            habilitado = 1;
        }
        if (no == true) {
            habilitado = 0;
        }
        var sii = document.getElementById('test3s').checked;
        var noo = document.getElementById('test4s').checked;
        if (sii == true) {
            visibleEnMenu = 1;
        }
        if (noo == true) {
            visibleEnMenu = 0;
        }
        var nombre = $("#nombres").val();
        var tipoObjeto = $("#tipoObjetos").val();
        var urlObjeto = $("#urlObjetos").val();
        var modulo = $("#modulos").val();
        var value = $("#idactualizar").val();
        var route = "/Objeto/"+value;
        var token = $("#token").val();
        $.ajax({
            url: route,
            headers: {'X-CSRF-TOKEN': token},
            type: 'PUT',
            dataType: 'json',
            data: {
                nombre: nombre,
                tipoObjeto: tipoObjeto,
                modulo: modulo,
                urlObjeto: urlObjeto,
                habilitado: habilitado,
                visibleEnMenu: visibleEnMenu,
                nro:nro,
            },
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

function Eliminar(btn) {
    if ($("#perfilpuedeEliminar").val() == 1) {
        var route = "Objeto/" + btn.value + "";
        var token = $("#token").val();
        swal({title: "ESTA SEGURO QUE DESEA ELIMINAR OBJETO?",
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


function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
