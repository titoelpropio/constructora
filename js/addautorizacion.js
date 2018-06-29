var URLactual;

$(document).ready(function () {
    URLactual = window.location.pathname;
    /*var idd = $('#iddelperfil').val();
    if (idd == '') {
        var route = "/";
        window.location.href = route;
    } else {*/
        var route = "Autorizaciones"// + idd;
        Cargarpermiso(route);
       // cargarvistademenu(route);
    //}
});

$('#cache').click(function () {
    var route = "clear-cache";
    $.get(route, function (res) {
        success:{
            window.location.reload();
        }
    });
});


function Cargarpermiso(route) {
    $.ajax({
        url: route,
        type: 'get',
        async: false,
        success: function (result) {
            $.each(result, function (i, value) {
                if (URLactual == value.urlObjeto) {
                      $("#perfilpuedeGuardar").val("1");
                    $("#perfilpuedeEliminar").val("1");
                    $("#perfilpuedeModificar").val("1");
                    $("#perfilpuedeListars").val("1");
                    $("#perfilpuedeVerReporte").val("1");
                    $("#perfilpuedeImprimir").val("1");
                    // $("#perfilpuedeGuardar").val(value.puedeGuardar);
                    // $("#perfilpuedeEliminar").val(value.puedeEliminar);
                    // $("#perfilpuedeModificar").val(value.puedeModificar);
                    // $("#perfilpuedeListars").val(value.puedeListar);
                    // $("#perfilpuedeVerReporte").val(value.puedeVerReporte);
                    // $("#perfilpuedeImprimir").val(value.puedeImprimir);
                }
            });
        }
    });
}

function cargarvistademenu(route) {
    $.get(route, function (res) {
        $(res).each(function (key, value) {
            var url = value.urlObjeto;
            var completo = url.replace('/', '', url);
            var index = "index";

            //General
            var Gestionarempresa = "Gestionarempresa";
            var Pais = "GestionarPais";
            var Sucursal = "GestionarSucursal";
            var cargo = "cargoempleado";
            var turno = "Gestionarturno";
            var emple = "Empleados";
            //EndGeneral
            //Compras
            var prov = "GestionarProveedor";
            var CompraCredito = "CompraCredito";
            var GestionarGastoCompra = "GestionarGastoCompra";
            var com = "Gestionarcompras";
            //End Compras
            //Ventas
            var Gestionarmoneda = "Gestionarmoneda";
            var GestionartipoCambio = "GestionarTipoDeCambio";
            var TipoCliente1 = "TipoCliente1";
            var Cliente = "Gestionarcliente";
            var Mesa = "GestionarMesa";
            var libroorden = "Gestionarlibroorden";
            var gestionarcontador = "gestionarcontador";
            var Factura = "GestionarFactura";
            var descuentos = "Descuentos";
            var lisr = "listadeventa";
            var Creditos = "Creditos";
            var TipoCuentaCobrar = "cuentacobrar";
            var listaralquiler = "listaralquiler";
            var Mapamesa = "GestionarMapamesa";
            var listadeventares = "listadeventares";
            var listadeventaopt = "listadeventaopt";
            //End Ventas
            //Inventario
            var categorias = "Categoria";
            var pro = "Productos";
            var ProductosResto = "ProductosResto";
            var Productosucursal = "Productosucursal";
            var med = "Medida";
            var origen = "Origen";
            var marca = "Marca";
            var Almacen = "gestionaralmacen";
            var Motivo = "gestionarmotivo";
            var Inventario = "gestionarinventario";
            //End Inventario
            //Caja
            var GestionarConcepto = "GestionarConcepto";
            var GestionarBanco = "GestionarBanco";
            var GestionarCuentaBancaria = "GestionarCuentaBancaria";
            var Egreso = "GestionarEgreso";
            var Ingreso = "GestionarIngreso";
            var Tipoegreso = "GestionarTipoEgreso";
            var TipoIngreso = "GestionarTipoIngreso";
            //End Caja
            //Seguridad
            var objeto = "GestionarObjeto";
            var Modulo = "GestionarModulo";
            var Perfil = "GestionarPerfil";
            //End Seguridad
            //Reportes
            var ReportVentasporusuario = "ReportVentasporusuario";
            var Reporttodousurios = "Reporttodousurios";
            var Reporttodousuriosporusuario = "Reporttodousuriosporusuario";
            var ReportVentasComisionActual = "ReportVentasComisionActual";
            var ReportVentasComisionPorUsuario = "ReportVentasComisionPorUsuario";
            var ReportGarantiaAlquilerActual = "ReportGarantiaAlquilerActual";
            var ReportGarantiaAlquilerPorUsuario = "ReportGarantiaAlquilerPorUsuario";
            var Reportporusuario = "Reportporusuario";
            var Reportflujousuario = "Reportflujousuario";
            var Reportflujoporusuario = "Reportflujoporusuario";
//            var CompraEfectivo = "CompraEfectivo";
            var CompraCredito1 = "CompraCredito1";
            var detallecomprasactual = "detallecomprasactual";
            var detallecomprasporusuario = "detallecomprasporusuario";
            var ReportEgreso = "ReportEgreso";
            var ReportEgresoPorUsuario = "ReportEgresoPorUsuario";
            var ReportIngreso = "ReportIngreso";
            var ReportIngresoPorUsuario = "ReportIngresoPorUsuario";
            var ReporteKardexInventario = "ReporteKardexInventario";
            var ReportRaking = "ReportRaking";
            var Ventacruzada = "Ventacruzada";
            var EstadoInventario = "EstadoInventario";
            var reporte_libros_contables = "reporte_libros_contables";
            var ReporteMovimientoInventario = "ReporteMovimientoInventario";
            var Reportelibroventa = "Reportelibroventa";
            var ReportVentaACredito = "ReportVentaACredito";
            var ReportVentasanuladas = "ReportVentasanuladas";
            var reportflujoingresosegresos = "reportflujoingresosegresos";
            var ReporteTxNInventario = "ReporteTxNInventario";
			var ReportVentasanuladasyeliminadas = "ReportVentasanuladasyeliminadas";

            var ReportVentaDetalleBelleMarie = "ReportVentaDetalleBelleMarie";
            var Gestionarordencompra = "Gestionarordencompra";
            var cuentapagar = "cuentapagar";
			var GestionarCaja = "GestionarCaja";
            //End Reportes
            // Modulo contable
            var PlandeCuentas = "cuentacontable";
            var CentrosCosto = "centroCosto";
            var Impuesto = "impuesto";
            var AsientoContable = "Gestionarasientocontable";

            var facturaEgreso = 'GestionarFacturaEgreso';
            var listaPrecios = 'ListaPrecios';
            var configuracionGeneral = 'configuracionGeneral';
            var configuracionVenta = 'ConfiguracionVenta';
            var configuracionMoneda = 'configuracionMoneda';
            var configuracionDasboard = 'configuracion';
            var configuracionCompra = 'ConfiguracionCompra';
            var configuracionCaja = 'ConfiguracionCaja';
            var configuracionInventario = 'ConfiguracionInventario';
            var listar = value.puedeListar;

            if (index == completo) {
                if (listar == 0) {
                    $("#index").hide();
                    $("#avengers").show();
                } else {
                    $("#index").show();
                    $("#avengers").hide();
                }
            }

            //General
            if (Gestionarempresa == completo) {
                if (listar == 0) {
                    $("#Gestionarempresa").hide();
                } else {
                    $("#Gestionarempresa").show();
                }
            }
			if (ReportVentasanuladasyeliminadas == completo) {
                if (listar == 0) {
                    $("#ReportVentasanuladasyeliminadas").hide();
                } else {
                    $("#ReportVentasanuladasyeliminadas").show();
                }
            }
			if (ReportVentaDetalleBelleMarie == completo) {
                if (listar == 0) {
                    $("#ReportVentaDetalleBelleMarie").hide();
                } else {
                    $("#ReportVentaDetalleBelleMarie").show();
                }
            }
            if (Pais == completo) {
                if (listar == 0) {
                    $("#GestionarPais").hide();
                } else {
                    $("#GestionarPais").show();
                }
            }
            if (Sucursal == completo) {
                if (listar == 0) {
                    $("#GestionarSucursal").hide();
                } else {
                    $("#GestionarSucursal").show();
                }
            }
            if (cargo == completo) {
                if (listar == 0) {
                    $("#cargoempleado").hide();
                } else {
                    $("#cargoempleado").show();
                }
            }
            if (turno == completo) {
                if (listar == 0) {
                    $("#Gestionarturno").hide();
                } else {
                    $("#Gestionarturno").show();
                }
            }
            if (emple == completo) {
                if (listar == 0) {
                    $("#Empleados").hide();
                } else {
                    $("#Empleados").show();
                }
            }
            //End Genreral
            //Compras
            if (prov == completo) {
                if (listar == 0) {
                    $("#GestionarProveedor").hide();
                } else {
                    $("#GestionarProveedor").show();
                }
            }

            if (Gestionarordencompra == completo) {
                if (listar == 0) {
                    $("#Gestionarordencompra").hide();
                } else {
                    $("#Gestionarordencompra").show();
                }
            }

            if (cuentapagar == completo) {
                if (listar == 0) {
                    $("#cuentapagar").hide();
                } else {
                    $("#cuentapagar").show();
                }
            }

            if (GestionarCaja == completo) {
                if (listar == 0) {
                    $("#GestionarCaja").hide();
                } else {
                    $("#GestionarCaja").show();
                }
            }            

            if (GestionarGastoCompra == completo) {
                if (listar == 0) {
                    $("#GestionarGastoCompra").hide();
                } else {
                    $("#GestionarGastoCompra").show();
                }
            }
            if (CompraCredito == completo) {
                if (listar == 0) {
                    $("#CompraCredito").hide();
                } else {
                    $("#CompraCredito").show();
                }
            }
            if (com == completo) {
                if (listar == 0) {
                    $("#Gestionarcompras").hide();
                } else {
                    $("#Gestionarcompras").show();
                }
            }
            //End Compras
            //Ventas
            if (Gestionarmoneda == completo) {
                if (listar == 0) {
                    $("#Gestionarmoneda").hide();
                } else {
                    $("#Gestionarmoneda").show();
                }
            }
            if (GestionartipoCambio == completo) {
                if (listar == 0) {
                    $("#GestionarTipoDeCambio").hide();
                } else {
                    $("#GestionarTipoDeCambio").show();
                }
            }
            if (TipoCliente1 == completo) {
                if (listar == 0) {
                    $("#TipoCliente1").hide();
                } else {
                    $("#TipoCliente1").show();
                }
            }
            if (Cliente == completo) {
                if (listar == 0) {
                    $("#Gestionarcliente").hide();
                } else {
                    $("#Gestionarcliente").show();
                }
            }
            if (Mesa == completo) {
                if (listar == 0) {
                    $("#GestionarMesa").hide();
                } else {
                    $("#GestionarMesa").show();
                }
            }
            if (libroorden == completo) {
                if (listar == 0) {
                    $("#Gestionarlibroorden").hide();
                } else {
                    $("#Gestionarlibroorden").show();
                }
            }
            if (gestionarcontador == completo) {
                if (listar == 0) {
                    $("#gestionarcontador").hide();
                } else {
                    $("#gestionarcontador").show();
                }
            }
            if (Factura == completo) {
                if (listar == 0) {
                    $("#GestionarFactura").hide();
                } else {
                    $("#GestionarFactura").show();
                }
            }
            if (descuentos == completo) {
                if (listar == 0) {
                    $("#Descuentos").hide();
                } else {
                    $("#Descuentos").show();
                }
            }
            if (lisr == completo) {
                if (listar == 0) {
                    $("#listadeventa").hide();
                } else {
                    $("#listadeventa").show();
                }
            }
            if (Creditos == completo) {
                if (listar == 0) {
                    $("#Creditos").hide();
                } else {
                    $("#Creditos").show();
                }
            }
            if (listaralquiler == completo) {
                if (listar == 0) {
                    $("#listaralquiler").hide();
                } else {
                    $("#listaralquiler").show();
                }
            }
            if (Mapamesa == completo) {
                if (listar == 0) {
                    $("#GestionarMapamesa").hide();
                } else {
                    $("#GestionarMapamesa").show();
                }
            }
            if (listadeventares == completo) {
                if (listar == 0) {
                    $("#listadeventares").hide();
                } else {
                    $("#listadeventares").show();
                }
            }
            if (listadeventaopt == completo) {
                if (listar == 0) {
                    $("#listadeventaopt").hide();
                } else {
                    $("#listadeventaopt").show();
                }
            }
            if (TipoCuentaCobrar == completo) {
                if (listar == 0) {
                    $("#cuentacobrar").hide();
                } else {
                    $("#cuentacobrar").show();
                }
            }
            //End Ventas
            //Inventario
            if (categorias == completo) {
                if (listar == 0) {
                    $("#Categoria").hide();
                } else {
                    $("#Categoria").show();
                }
            }
            if (pro == completo) {
                if (listar == 0) {
                    $("#Productos").hide();
                } else {
                    $("#Productos").show();
                }
            }
            if (ProductosResto == completo) {
                if (listar == 0) {
                    $("#ProductosResto").hide();
                } else {
                    $("#ProductosResto").show();
                }
            }
            if (Productosucursal == completo) {
                if (listar == 0) {
                    $("#Productosucursal").hide();
                } else {
                    $("#Productosucursal").show();
                }
            }
            if (med == completo) {
                if (listar == 0) {
                    $("#Medida").hide();
                } else {
                    $("#Medida").show();
                }
            }
            if (origen == completo) {
                if (listar == 0) {
                    $("#Origen").hide();
                } else {
                    $("#Origen").show();
                }
            }
            if (marca == completo) {
                if (listar == 0) {
                    $("#Marca").hide();
                } else {
                    $("#Marca").show();
                }
            }
            if (Almacen == completo) {
                if (listar == 0) {
                    $("#gestionaralmacen").hide();
                } else {
                    $("#gestionaralmacen").show();
                }
            }
            if (Motivo == completo) {
                if (listar == 0) {
                    $("#gestionarmotivo").hide();
                } else {
                    $("#gestionarmotivo").show();
                }
            }
            if (Inventario == completo) {
                if (listar == 0) {
                    $("#gestionarinventario").hide();
                } else {
                    $("#gestionarinventario").show();
                }
            }

            if (listaPrecios == completo) {
                if (listar == 0) {
                    $("#ListaPrecios").hide();
                } else {
                    $("#ListaPrecios").show();
                }
            }
            //End Inventario
            //Caja
            if (facturaEgreso == completo) {
                if (listar == 0) {
                    $("#GestionarFacturaEgreso").hide();
                } else {
                    $("#GestionarFacturaEgreso").show();
                }
            }
            if (GestionarConcepto == completo) {
                if (listar == 0) {
                    $("#GestionarConcepto").hide();
                } else {
                    $("#GestionarConcepto").show();
                }
            }
            if (GestionarBanco == completo) {
                if (listar == 0) {
                    $("#GestionarBanco").hide();
                } else {
                    $("#GestionarBanco").show();
                }
            }
            if (GestionarCuentaBancaria == completo) {
                if (listar == 0) {
                    $("#GestionarCuentaBancaria").hide();
                } else {
                    $("#GestionarCuentaBancaria").show();
                }
            }
            if (Egreso == completo) {
                if (listar == 0) {
                    $("#GestionarEgreso").hide();
                } else {
                    $("#GestionarEgreso").show();
                }
            }
            if (Ingreso == completo) {
                if (listar == 0) {
                    $("#GestionarIngreso").hide();
                } else {
                    $("#GestionarIngreso").show();
                }
            }
            if (Tipoegreso == completo) {
                if (listar == 0) {
                    $("#GestionarTipoEgreso").hide();
                } else {
                    $("#GestionarTipoEgreso").show();
                }
            }
            if (TipoIngreso == completo) {
                if (listar == 0) {
                    $("#GestionarTipoIngreso").hide();
                } else {
                    $("#GestionarTipoIngreso").show();
                }
            }
            //End Caja
            //Seguridad
            if (objeto == completo) {
                if (listar == 0) {
                    $("#GestionarObjeto").hide();
                } else {
                    $("#GestionarObjeto").show();
                }
            }
            if (Modulo == completo) {
                if (listar == 0) {
                    $("#GestionarModulo").hide();
                } else {
                    $("#GestionarModulo").show();
                }
            }
            if (Perfil == completo) {
                if (listar == 0) {
                    $("#GestionarPerfil").hide();
                } else {
                    $("#GestionarPerfil").show();
                }
            }
            //End Seguridad
            //Reportes
            if (ReportVentasporusuario == completo) {
                if (listar == 0) {
                    $("#ReportVentasporusuario").hide();
                } else {
                    $("#ReportVentasporusuario").show();
                }
            }
            if (Reporttodousurios == completo) {
                if (listar == 0) {
                    $("#Reporttodousurios").hide();
                } else {
                    $("#Reporttodousurios").show();
                }
            }
            if (Reporttodousuriosporusuario == completo) {
                if (listar == 0) {
                    $("#Reporttodousuriosporusuario").hide();
                } else {
                    $("#Reporttodousuriosporusuario").show();
                }
            }
            if (ReportVentasComisionActual == completo) {
                if (listar == 0) {
                    $("#ReportVentasComisionActual").hide();
                } else {
                    $("#ReportVentasComisionActual").show();
                }
            }
            if (ReportVentasComisionPorUsuario == completo) {
                if (listar == 0) {
                    $("#ReportVentasComisionPorUsuario").hide();
                } else {
                    $("#ReportVentasComisionPorUsuario").show();
                }
            }
            if (ReportGarantiaAlquilerActual == completo) {
                if (listar == 0) {
                    $("#ReportGarantiaAlquilerActual").hide();
                } else {
                    $("#ReportGarantiaAlquilerActual").show();
                }
            }
            if (ReportGarantiaAlquilerPorUsuario == completo) {
                if (listar == 0) {
                    $("#ReportGarantiaAlquilerPorUsuario").hide();
                } else {
                    $("#ReportGarantiaAlquilerPorUsuario").show();
                }
            }
            if (Reportporusuario == completo) {
                if (listar == 0) {
                    $("#Reportporusuario").hide();
                } else {
                    $("#Reportporusuario").show();
                }
            }
            if (Reportflujousuario == completo) {
                if (listar == 0) {
                    $("#Reportflujousuario").hide();
                } else {
                    $("#Reportflujousuario").show();
                }
            }
            if (Reportflujoporusuario == completo) {
                if (listar == 0) {
                    $("#Reportflujoporusuario").hide();
                } else {
                    $("#Reportflujoporusuario").show();
                }
            }
//            if (CompraEfectivo == completo) {
//                if (listar == 0) {
//                    $("#CompraEfectivo").hide();
//                } else {
//                    $("#CompraEfectivo").show();
//                }
//            }
            if (CompraCredito1 == completo) {
                if (listar == 0) {
                    $("#CompraCredito1").hide();
                } else {
                    $("#CompraCredito1").show();
                }
            }
            if (detallecomprasactual == completo) {
                if (listar == 0) {
                    $("#detallecomprasactual").hide();
                } else {
                    $("#detallecomprasactual").show();
                }
            }
            if (detallecomprasporusuario == completo) {
                if (listar == 0) {
                    $("#detallecomprasporusuario").hide();
                } else {
                    $("#detallecomprasporusuario").show();
                }
            }
            if (ReportEgreso == completo) {
                if (listar == 0) {
                    $("#ReportEgreso").hide();
                } else {
                    $("#ReportEgreso").show();
                }
            }
            if (ReportEgresoPorUsuario == completo) {
                if (listar == 0) {
                    $("#ReportEgresoPorUsuario").hide();
                } else {
                    $("#ReportEgresoPorUsuario").show();
                }
            }
            if (ReportIngreso == completo) {
                if (listar == 0) {
                    $("#ReportIngreso").hide();
                } else {
                    $("#ReportIngreso").show();
                }
            }
            if (ReportIngresoPorUsuario == completo) {
                if (listar == 0) {
                    $("#ReportIngresoPorUsuario").hide();
                } else {
                    $("#ReportIngresoPorUsuario").show();
                }
            }
            if (ReporteKardexInventario == completo) {
                if (listar == 0) {
                    $("#ReporteKardexInventario").hide();
                } else {
                    $("#ReporteKardexInventario").show();
                }
            }
            if (ReportRaking == completo) {
                if (listar == 0) {
                    $("#ReportRaking").hide();
                } else {
                    $("#ReportRaking").show();
                }
            }
            if (Ventacruzada == completo) {
                if (listar == 0) {
                    $("#Ventacruzada").hide();
                } else {
                    $("#Ventacruzada").show();
                }
            }
            if (EstadoInventario == completo) {
                if (listar == 0) {
                    $("#EstadoInventario").hide();
                } else {
                    $("#EstadoInventario").show();
                }
            }
            if (reporte_libros_contables == completo) {
                if (listar == 0) {
                    $("#reporte_libros_contables").hide();
                } else {
                    $("#reporte_libros_contables").show();
                }
            }
            if (ReporteMovimientoInventario == completo) {
                if (listar == 0) {
                    $("#ReporteMovimientoInventario").hide();
                } else {
                    $("#ReporteMovimientoInventario").show();
                }
            }
            if (Reportelibroventa == completo) {
                if (listar == 0) {
                    $("#Reportelibroventa").hide();
                } else {
                    $("#Reportelibroventa").show();
                }
            }
            if (ReportVentaACredito == completo) {
                if (listar == 0) {
                    $("#ReportVentaACredito").hide();
                } else {
                    $("#ReportVentaACredito").show();
                }
            }
            if (ReportVentasanuladas == completo) {
                if (listar == 0) {
                    $("#ReportVentasanuladas").hide();
                } else {
                    $("#ReportVentasanuladas").show();
                }
            }
            if (reportflujoingresosegresos == completo) {
                if (listar == 0) {
                    $("#reportflujoingresosegresos").hide();
                } else {
                    $("#reportflujoingresosegresos").show();
                }
            }
            if (ReporteTxNInventario == completo) {
                if (listar == 0) {
                    $("#ReporteTxNInventario").hide();
                } else {
                    $("#ReporteTxNInventario").show();
                }
            }
            //End Reportes
            // Contabilidad
            if (PlandeCuentas == completo) {
                if (listar == 0) {
                    $("#cuentacontable").hide();
                } else {
                    $("#cuentacontable").show();
                }
            }
            if (CentrosCosto == completo) {
                if (listar == 0) {
                    $("#centroCosto").hide();
                } else {
                    $("#centroCosto").show();
                }
            }
            if (Impuesto == completo) {
                if (listar == 0) {
                    $("#impuesto").hide();
                } else {
                    $("#impuesto").show();
                }
            }
            if (AsientoContable == completo) {
                if (listar == 0) {
                    $("#Gestionarasientocontable").hide();
                } else {
                    $("#Gestionarasientocontable").show();
                }
            }
            // Configuracion
            if (configuracionGeneral == completo) {
                if (listar == 0) {
                    $("#configuracionGeneral").hide();
                } else {
                    $("#configuracionGeneral").show();
                }
            }
            if (configuracionDasboard == completo) {
                if (listar == 0) {
                    $("#configuracion").hide();
                } else {
                    $("#configuracion").show();
                }
            }
            if (configuracionVenta == completo) {
                if (listar == 0) {
                    $("#ConfiguracionVenta").hide();
                } else {
                    $("#ConfiguracionVenta").show();
                }
            }
            if (configuracionMoneda == completo) {
                if (listar == 0) {
                    $("#configuracionMoneda").hide();
                } else {
                    $("#configuracionMoneda").show();
                }
            }
            if (configuracionVenta == completo) {
                if (listar == 0) {
                    $("#ConfiguracionCompra").hide();
                } else {
                    $("#ConfiguracionCompra").show();
                }
            }
            if (configuracionCaja == completo) {
                if (listar == 0) {
                    $("#ConfiguracionCaja").hide();
                } else {
                    $("#ConfiguracionCaja").show();
                }
            }
            if (configuracionInventario == completo) {
                if (listar == 0) {
                    $("#ConfiguracionInventario").hide();
                } else {
                    $("#configuracionInventario").show();
                }
            }
        });
    });
}


function VerificarAcceso(){
    $("#modalAcceso").openModal({dismissible: false});
}

$("#acceder").click(function () {

    if ($("#usuario_v").val()=="") {
        Materialize.toast('Introduca Su Usuario', 3000, 'rounded');
        return;
    }
    if ($("#password_v").val()=="") {
        Materialize.toast('Introdusca Su Password', 3000, 'rounded');    
        return;
    }


    var usuario = $("#usuario_v").val();
    var password = $("#password_v").val();
    var route = "VerificarAcceso/"+usuario+"/"+password;

    $.get(route, function (res) {
            switch(res.dato) {
                case 1:
                    $("#modalAcceso").modal('close');
                    Materialize.toast('Accedo Autorizado', 3000, 'rounded');
                    if (URLactual == 'EmpresaModulo') {
                        window.location.href = "/EmpresaModulo";
                        break;                        
                    } else {                      


                        if ( $('#asiento').prop('checked') == true) {
                            // Hacer algo si el checkbox ha sido seleccionado
                            checket = 1;
                            swal({
                                    title: "Esta seguro que desea activar la generacion de asientos contables automáticos?",
                                    text: "Esto afectara a las transacciones de inventario, venta, compra, gastos, Ctas. x pagar y cobrar.",
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: "#DD6B55",
                                    confirmButtonText: "Si, activar!",
                                    cancelButtonText: "No, cancelar",
                                    closeOnConfirm: false,
                                    closeOnCancel: true
                                },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        ajaxStart('Verificando previa configuracion');
                                        $.ajax({
                                            url: '/verificar_configuracion_cuentas',
                                            type: 'post',
                                            dataType: 'json',
                                            success: function (result) {
                                                if (result.success == true) { // Falta configurar algunas cuentas
                                                    var mensaje = 'La configuracion de estas cuentas esta vacia: *';
                                                    $.each(result.message, function (i, value) {
                                                        mensaje += i + '=> ' + value + '. *';
                                                    });
                                                    swal({
                                                            title: "Advertencia",
                                                            text: mensaje,
                                                            type: "warning",
                                                            showCancelButton: true,
                                                            confirmButtonColor: "#DD6B55",
                                                            confirmButtonText: "Activar de todos modos!",
                                                            cancelButtonText: "No, cancelar",
                                                            closeOnConfirm: false,
                                                            closeOnCancel: true
                                                        },
                                                        function (isConfirm) {
                                                            if (isConfirm) {
                                                                $.ajax({
                                                                    url: '/activar_asientos_automaticos',
                                                                    type: 'post',
                                                                    data: { opcion: checket },
                                                                    success: function (result) {
                                                                        if (result == true){
                                                                            swal('Generacion de Asientos Contables Activados','','success');
                                                                        }
                                                                    }
                                                                });
                                                            }else{
                                                                //$('#asiento').filter(':checkbox').prop('checked',false);
                                                                $('#asiento').prop('checked',false)
                                                            }
                                                        });
                                                }
                                                ajaxStop();
                                            }
                                        });
                                    }else{
                                        $('#asiento').prop('checked',false)
                                    }
                                });
                        } else {
                            // Hacer algo si el checkbox ha sido deseleccionado
                            checket = 0;
                            swal({
                                    title: "Esta seguro de desactivar los asientos automaticos?",
                                    text: 'Si ya tiene registros contables puede ocacionar inconcistencia en sus reportes.',
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: "#DD6B55",
                                    confirmButtonText: "Si, Desactivar!",
                                    cancelButtonText: "No, cancelar",
                                    closeOnConfirm: false,
                                    closeOnCancel: true
                                },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        $.ajax({
                                            url: '/activar_asientos_automaticos',
                                            type: 'post',
                                            data: { opcion: checket },
                                            success: function (result) {
                                                if (result == true){
                                                    swal('Generacion de Asientos Contables Desactivados','','success');
                                                }
                                            }
                                        });
                                    }else{
                                        //$('#asiento').filter(':checkbox').prop('checked',true);
                                        $('#asiento').prop('checked',false)
                                    }
                                });
                        }
                    break;                 



                    }

                case 2:
                    Materialize.toast('Usuario o Password Incorrecto', 3000, 'rounded');
                    break;                 
            }  
    });
});




$("#cerrarAcceso").click(function () {
    if (URLactual == 'configuracionGeneral') {
       if ($('#asiento').prop('checked') == true) {
        $('#asiento').prop('checked',false);
       } else {
        $('#asiento').prop('checked',true);
       }         
    } 
});