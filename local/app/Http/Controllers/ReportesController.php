<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\CategoriaRequest;
use App\CategoriaCuenta;
use DB;
class ReportesController extends Controller
{

    public function __construct(Request $request) {
        $this->middleware('auth');
        $this->middleware('admin');
        $this->middleware('auth', ['only' => 'admin']);
    }

    //retorna las vistas
    
    function libro_venta(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.libro_venta', compact('gestion'));
    }

    function libro_compra(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.libro_compra', compact('gestion'));
    }

    function libro_diario(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.libro_diario', compact('gestion'));
    }

    function libro_mayor(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.libro_mayor', compact('gestion'));
    }

    function sumas_saldos(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.sumas_saldos', compact('gestion'));
    }

    function estado_resultado(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.estado_resultado', compact('gestion'));
    }

    function balance_general(Request $request) {
        $gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('modulocontable.reportes.balance_general', compact('gestion'));
    }
    
    //retorna los reportes

    function reporte_libro_venta($fecha1, $fecha2, Request $request) {
        $resultado = DB::select('SELECT * fROM libroventa WHERE fecha_factura BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY fecha_factura, id');
        
        return response()->json($resultado);
    }

    function reporte_libro_compra($fecha1, $fecha2, Request $request) {
        $resultado = DB::select('SELECT * fROM librocompra WHERE fecha_factura_DUI BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY fecha_factura_DUI, id');
        
        return response()->json($resultado);
    }
    function flujoCaja(){
        return view('reportes.reportevista.reporte_flujo_caja');

    }

    function reporte_libro_diario($fecha1, $fecha2, Request $request) {
        $resultado = DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento, asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento,
            detalle.nro_detalle');
        
        return response()->json($resultado);
    }
    
    function reporte_libro_mayor($fecha1, $fecha2, Request $request) {
        $libro_mayor = array();
        $resultado = DB::select('select * from cuenta where utilizable=1 ORDER BY codigo ');
        $count = 0;
        foreach ($resultado as $key => $value) {
            $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento , asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');
            if (count($verificar)!=0) {
                $libro_mayor[$count] = $verificar;
                $count++;
            }
        }
        return response()->json($libro_mayor);
    }

    function reporte_sumas_saldos($fecha1, $fecha2, Request $request) {
        $sumas_saldos = array();
        $resultado = DB::select('select * from cuenta where utilizable=1 ORDER BY codigo ');
        $count = 0;
        foreach ($resultado as $key => $value) {
            $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento , asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');
            if (count($verificar)!=0) {
                $sumas_saldos[$count] = $verificar;
                $count++;
            }
        }
        return response()->json($sumas_saldos);
    }
    
    function reporte_estado_resultado($fecha1, $fecha2, Request $request) {
        $gasto=DB::select('SELECT left(codigo,1) as codigo FROM cuenta where nombre = "GASTOS" limit 1');
        $ingreso=DB::select('SELECT left(codigo,1) as codigo FROM cuenta where nombre = "INGRESOS" limit 1');
        
        $estado_resultado_gasto = array();
        $estado_resultado_ingreso = array();

        if (count($gasto) == 1) {

            $resultado = DB::select('select * from cuenta where left(codigo,1) = '.$gasto[0]->codigo.' and utilizable = 1 ORDER BY codigo');

            $count = 0;
            foreach ($resultado as $key => $value) {

                $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento ,asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');

                if (count($verificar)!=0) {
                    $estado_resultado_gasto[$count] = $verificar;
                    $count++;
                }
            }
        }
        
        if (count($ingreso) == 1) {

            $resultado = DB::select('select * from cuenta where left(codigo,1) = '.$ingreso[0]->codigo.' and utilizable = 1 ORDER BY codigo');

            $count = 0;
            foreach ($resultado as $key => $value) {

                $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento ,asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');

                if (count($verificar)!=0) {
                    $estado_resultado_ingreso[$count] = $verificar;
                    $count++;
                }
            }
        }
        
        return response()->json( array('Gastos' => $estado_resultado_gasto, 'Ingresos' => $estado_resultado_ingreso) );
    }

    function reporte_balance_general($fecha1, $fecha2, Request $request) {
        $activo=DB::select('SELECT left(codigo,1) as codigo FROM cuenta where nombre = "ACTIVO" limit 1');
        $pasivo=DB::select('SELECT left(codigo,1) as codigo FROM cuenta where nombre = "PASIVO" limit 1');
        $patrimonio=DB::select('SELECT left(codigo,1) as codigo FROM cuenta where nombre = "PATRIMONIO" limit 1');
        
        $balance_general_activo = array();
        $balance_general_pasivo = array();
        $balance_general_patrimonio = array();

        if (count($activo) == 1) {

            $resultado = DB::select('select * from cuenta where left(codigo,1) = '.$activo[0]->codigo.' and utilizable = 1 ORDER BY codigo');

            $count = 0;
            foreach ($resultado as $key => $value) {

                $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento ,asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');

                if (count($verificar)!=0) {
                    $balance_general_activo[$count] = $verificar;
                    $count++;
                }
            }
        }
        
        if (count($pasivo) == 1) {

            $resultado = DB::select('select * from cuenta where left(codigo,1) = '.$pasivo[0]->codigo.' and utilizable = 1 ORDER BY codigo');

            $count = 0;
            foreach ($resultado as $key => $value) {

                $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento ,asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');

                if (count($verificar)!=0) {
                    $balance_general_pasivo[$count] = $verificar;
                    $count++;
                }
            }
        }

        if (count($patrimonio) == 1) {

            $resultado = DB::select('select * from cuenta where left(codigo,1) = '.$patrimonio[0]->codigo.' and utilizable = 1 ORDER BY codigo');

            $count = 0;
            foreach ($resultado as $key => $value) {

                $verificar=DB::select('SELECT asiento.tipo as tipo_asiento, asiento.nro_asiento ,asiento.fecha_transaccion, asiento.glosa, cuenta.codigo, cuenta.nombre, detalle.tipo as tipo_detalle, detalle.nro_detalle, detalle.montoSus, detalle.montoBs fROM cuenta, detalle, asiento WHERE cuenta.id=detalle.id_cuenta and detalle.id_asiento=asiento.id and cuenta.id='.$value->id.' and asiento.fecha_transaccion BETWEEN "'.$fecha1.'" AND "'.$fecha2.'" ORDER BY asiento.fecha_transaccion, asiento.nro_asiento');

                if (count($verificar)!=0) {
                    $balance_general_patrimonio[$count] = $verificar;
                    $count++;
                }
            }
        }
        
        return response()->json( array('Activo' => $balance_general_activo, 'Pasivo' => $balance_general_pasivo, 'Patrimonio' => $balance_general_patrimonio) );
    }

    public function reporteVendedor(){
         //$gestion=DB::select('SELECT * FROM gestion where estado=1');
        return view('reportes.reportevista.reporte_vendedores');
    }
    public function reporteVendedoresDadaFecha(Request $request){
        $resultado=DB::select("select CONCAT(empleado.nombre,' ' ,empleado.apellido) as vendedor,concat(cliente.nombre,' ',cliente.apellidos ) cliente,lote.nroLote,
lote.manzano,proyecto.nombre,venta.fecha as fechaVenta,prereserva.fecha fechaReserva,venta.tipoVenta,
venta.precio,venta.descuento,
venta.precio-(venta.precio*venta.descuento/100) as precioDescuentoSus,
(venta.precio-(venta.precio*venta.descuento/100))* 0.10 as diezPorciento
from cliente,lote,prereserva,venta,empleado,detalleprereserva,proyecto,cuotaminima
where lote.id=venta.idLote and detalleprereserva.idLote=lote.id and 
detalleprereserva.idPreReserva=prereserva.id and empleado.id=prereserva.idEmpleado 
AND venta.idCliente=cliente.id and detalleprereserva.idLote=venta.idLote and proyecto.id=lote.idProyecto  
AND venta.fecha BETWEEN  '$request->fechaIni' AND DATE_SUB('$request->fechaFin',INTERVAL -1 DAY) and cuotaminima.idProyecto=proyecto.id");
        return response()->json(array('resultado'=>$resultado));

    }
}

