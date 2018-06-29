<?php

namespace App;

namespace App\Http\Controllers;

use App\ConfiguracionGeneral;
use Illuminate\Http\Request;
use DB;
use Mockery\Exception;
use Session;
use Redirect;
use App\Http\Requests;

class ConfiguracionController extends Controller
{

    public function index()
    {
        //
    }

    public function create()
    {
        //
    }

    public function indexdash()
    {
        $tabla = DB::select("select * from configuracion limit 3");
        return view("configuracion.dashboard", compact('tabla'));
    }

    public function actualizar_config_compra_conta(Request $data)
    {
        if ($data->cc_mercaderia_transito_id != "") {
            DB::table('configuracion')->where('tipo', "CC Mercaderia Transito")->update(['cantidad' => $data->cc_mercaderia_transito_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Mercaderia Transito")->update(['cantidad' => 0]);
        }
        if ($data->cc_devolucion_compra_id != "") {
            DB::table('configuracion')->where('tipo', "CC Devolucion Compra")->update(['cantidad' => $data->cc_devolucion_compra_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Devolucion Compra")->update(['cantidad' => 0]);
        }
        if ($data->cc_cf_dev_compra_id != "") {
            DB::table('configuracion')->where('tipo', "CC cf Devolucion Compra")->update(['cantidad' => $data->cc_cf_dev_compra_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC cf Devolucion Compra")->update(['cantidad' => 0]);
        }
        if ($data->cc_descuento_compra_id != "") {
            DB::table('configuracion')->where('tipo', "CC Descuento Compra")->update(['cantidad' => $data->cc_descuento_compra_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Descuento Compra")->update(['cantidad' => 0]);
        }
        return json_encode($result = array('success' => true));
    }

    public function configuracion_compra_impuestos(Request $data){
        if ($data->impuesto_credito_id != "") {
            DB::table('configuracion')->where('tipo', "Credito Fiscal")->update(['cantidad' => $data->impuesto_credito_id]);
        } else {
            DB::table('configuracion')->where('tipo', "Credito Fiscal")->update(['cantidad' => 0]);
        }
        return json_encode($result = array('success' => true));
    }

    public function obtenerListaPrecio()
    {
        $result = DB::select("SELECT listaprecio.id,listaprecio.nombre FROM listaprecio WHERE listaprecio.id = (SELECT cantidad FROM configuracion WHERE tipo='listaprecio')");
        return response()->json($result);
    }

    public function cargarMultiL()
    {
        $result = DB::select("select empresa.multiListaPrecio from empresa");
        return response()->json($result);
    }

    public function updateListaPrecio(Request $request, $listaprecio)
    {
        $multiLsita = $request->multiLista;
        $m;
        if ($multiLsita == "true") {
            $m = 1;
        }
        if ($multiLsita == "false") {
            $m = 0;
        }


        $consulta = DB::select("select multiListaPrecio from empresa");
        $config = $consulta[0]->multiListaPrecio;
//        dd($config);    //0
//        dd($m);
        if ($config == 1) {     //Multilista de precio
            if ($m == 0) {
                DB::table('configuracion')->where('tipo', $listaprecio)->update(['cantidad' => $request->idlistaprecio]);
                return response()->json(['mensaje' => 'listo']);
            } else {
                DB::table('configuracion')->where('tipo', $listaprecio)->update(['cantidad' => $request->idlistaprecio]);
                return response()->json(['mensaje' => 'listo']);
            }
        } else {
            //Unilista de presio

            if ($m == 0) {
                return response()->json(['mensaje' => 'error']);
            } else {
                DB::table('configuracion')->where('tipo', $listaprecio)->update(['cantidad' => $request->idlistaprecio]);
                return response()->json(['mensaje' => 'listo']);
            }
        }

//        DB::table('configuracion')->where('tipo', $listaprecio)->update(['cantidad' => $request->idlistaprecio]);
//        return response()->json(['mensaje' => 'listo']);
    }

    public function updateProductosFavoritos(Request $request)
    {
        $multiLsita = $request->multiLista;
        $m;
        if ($multiLsita == "true") {
            $m = 1;
            $u = 0;
        }
        if ($multiLsita == "false") {
            $m = 0;
            $u = 1;
        }

        $consulta = DB::select("select multiListaPrecio from empresa");
        $config = $consulta[0]->multiListaPrecio;

        if ($config == 1) {     //Multilista de precio
            if ($m == 0) {
                return response()->json(['mensaje' => 'error']);
            } else {
                DB::table('configuracion')->where('tipo', "productos favoritos")->update(['cantidad' => $request->top]);
                return response()->json(['mensaje' => 'listo']);
            }
        } else {                //Unilista de presio
            if ($m == 0) {
                DB::table('configuracion')->where('tipo', "productos favoritos")->update(['cantidad' => $request->top]);
                return response()->json(['mensaje' => 'listo']);
            } else {
                DB::table('configuracion')->where('tipo', "productos favoritos")->update(['cantidad' => $request->top]);
                DB::table('empresa')->update(['multiListaPrecio' => 1]); //multilista
                return response()->json(['mensaje' => 'listo']);
            }
        }
    }

    public function updatecategoriafavorito(Request $request)
    {
        DB::table('configuracion')->where('tipo', "ver categoria venta")->update(['cantidad' => $request->categoriafavorito]);
        return response()->json(['mensaje' => 'listo']);
    }

    public function updateConfiguracionIventario(Request $request)
    {
//        echo json_encode($request);
        try {
            DB::beginTransaction();
            $result['success'] = DB::table('configuracion')->where('tipo', "registrarProductoCodBarras")->update(['cantidad' => $request->sin_codigo]);
            $result['success'] = DB::table('configuracion')->where('tipo', "CC Ajuste Inventario")->update(['cantidad' => $request->cc_ajuste]);
            $result['success'] = DB::table('configuracion')->where('tipo', "CC Ingreso Sobrante")->update(['cantidad' => $request->cc_ingreso]);
            $result['success'] = DB::table('configuracion')->where('tipo', "CC Egreso Faltante")->update(['cantidad' => $request->cc_egreso]);
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();
            $result['success'] = false;
        }
        return json_encode($result);
    }

    public function updateModulo(Request $request, $modulo)
    {
        DB::table('configuracion')->where('tipo', $modulo)->update(['cantidad' => $request->cantidad]);
        return response()->json(['mensaje' => 'listo']);
    }

    public function productosFavoritos()
    {
        $result = DB::select("SELECT cantidad FROM configuracion WHERE tipo='productos favoritos'");
        return response()->json($result);
    }

    public function verCategoriaVenta()
    {
        $result = DB::select("SELECT cantidad FROM configuracion WHERE tipo='ver categoria venta'");
        return response()->json($result);
    }

    public function obtenerProductoCodBarras()
    {
        $result = DB::select("SELECT cantidad FROM configuracion WHERE tipo='registrarProductoCodBarras'");
        return response()->json($result);
    }

    public function obtenerModulo($modulo)
    {
        // $result = DB::select("SELECT cantidad FROM configuracion WHERE tipo=?", [$modulo]);
        // return response()->json($result);
    }

    //contabilidad
    public function ajusteinventario($id, $cantidad)
    {
        $actua = DB::table('configuracion')->where('id', $id)->update(['cantidad' => $cantidad]);
        return response()->json(["mensaje" => "listo"]);
    }

    public function muestracontable()
    {

        $tabla = DB::select("SELECT * FROM configuracion ");
        return response()->json($tabla);
    }

    public function top($sucursal, $top)
    {
        $result = DB::select("SELECT 
producto.id,
producto.nombre AS nombre,
SUM((detalleventa.Cantidad)) AS Cantidadvendida,
            producto.precioVenta,
            producto.imagen,
(SELECT `v_stockalmacensucursal`.`stock`
            FROM `v_stockalmacensucursal` WHERE v_stockalmacensucursal.`idproducto` = producto.id AND `v_stockalmacensucursal`.`idalmacen` = ?
)AS stock        
FROM
  detalleventa
INNER JOIN
  producto ON detalleventa.idproducto = producto.id INNER JOIN venta ON detalleventa.idVenta=venta.id
 INNER JOIN puntoventa ON venta.idPuntoVenta=puntoventa.id
 WHERE puntoventa.idSucursal=$sucursal
GROUP BY
  producto.id
 ORDER BY Cantidadvendida DESC
LIMIT ?
", [$sucursal, $top]);
        return response()->json($result);
    }

    public function configuracion_contabilidad_venta(Request $data)
    {
        if ($data->cc_ingreso_ventas_cuenta_id != "") {
            DB::table('configuracion')->where('tipo', "CC Ingreso por Ventas")->update(['cantidad' => $data->cc_ingreso_ventas_cuenta_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Ingreso por Ventas")->update(['cantidad' => 0]);
        }
        if ($data->cc_ingreso_servicio_cuenta_id != "") {
            DB::table('configuracion')->where('tipo', "CC Ingreso por Servicios")->update(['cantidad' => $data->cc_ingreso_servicio_cuenta_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Ingreso por Servicios")->update(['cantidad' => 0]);
        }
        if ($data->cc_costo_venta_cuenta_id != "") {
            DB::table('configuracion')->where('tipo', "CC Costo de Venta")->update(['cantidad' => $data->cc_costo_venta_cuenta_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Costo de Venta")->update(['cantidad' => 0]);
        }
        if ($data->cc_dev_venta_cuenta_id != "") {
            DB::table('configuracion')->where('tipo', "CC Dev. En Ventas")->update(['cantidad' => $data->cc_dev_venta_cuenta_id]);
        } else {
            DB::table('configuracion')->where('tipo', "CC Dev. En Ventas")->update(['cantidad' => 0]);
        }
        return json_encode($result = array('success' => true));
    }

    public function configuracion_impuestos_venta(Request $data){
        if ($data->impuesto_it_id != "") {
            DB::table('configuracion')->where('tipo', "Impuesto IT")->update(['cantidad' => $data->impuesto_it_id]);
        } else {
            DB::table('configuracion')->where('tipo', "Impuesto IT")->update(['cantidad' => 0]);
        }
        if ($data->impuesto_it_pagar_id != "") {
            DB::table('configuracion')->where('tipo', "Impuesto IT por Pagar")->update(['cantidad' => $data->impuesto_it_pagar_id]);
        } else {
            DB::table('configuracion')->where('tipo', "Impuesto IT por Pagar")->update(['cantidad' => 0]);
        }
        if ($data->impuesto_debito_id != "") {
            DB::table('configuracion')->where('tipo', "Debito Fiscal")->update(['cantidad' => $data->impuesto_debito_id]);
        } else {
            DB::table('configuracion')->where('tipo', "Debito Fiscal")->update(['cantidad' => 0]);
        }
        return json_encode($result = array('success' => true));
    }
    public function verificar_configuracion_cuentas(){
        $result = array(
            'success' => false,
            'message' => null,
        );
        try{
            // Verificar que los campos de las cuentas en la configuracion
            // esten seteadas
            $data = DB::table('configuracion')
                ->join('modulo', 'configuracion.idmodulo', '=', 'modulo.id')
                ->where('configuracion.tipoparametro','contable')->where('configuracion.tipo','!=','asiento automatico')
                ->select('configuracion.tipo', 'modulo.nombre','configuracion.cantidad')
                ->get();
            $cuentas_faltantes = [];
            foreach ($data as $row){
                if ($row->cantidad == 0){
                    $cuentas_faltantes[$row->tipo] = $row->nombre;
                }
            }
            $result['success'] = true;
            $result['message'] = $cuentas_faltantes;
        }catch (Exception $error){
            $result['message'] = 'Error: '.$error;
        }
        return json_encode($result);
    }

    public function activar_asientos_automaticos(Request $data){
        $response = DB::table('configuracion')->where('tipo','asiento automatico')->update(['cantidad'=> $data->opcion]);
        $data_config_conta = DB::table('configuracion')->where('tipo','asiento automatico')->get();
        Session::put('asientos_contables',$data_config_conta[0]->cantidad);
        return json_encode($response);
    }

    public function configuracion_descuento_inventario(Request $request) {
        $response = DB::table('configuracion')->where('tipo','Descontar Inventario')->update(['cantidad' => $request->valor]);
        return json_encode($request);
    }
}
