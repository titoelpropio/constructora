<?php

namespace App\Http\Controllers;

use App\Empleado;
use App\Producto;
use Illuminate\Http\Request;
use App\TipoProducto;
use App\Unidadmedida;
use App\Marca;
use App\Origen;
use App\Http\Requests;
use DB;
use Session;
use Carbon\Carbon;

class FrontController extends Controller
{
//    use Funciones_cuentas;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view("PanelAdmin.index");
    }

    public function AperturaCaja()
    {
        $idPuntoVenta = Session::get('idpuntoventa');
        if ($idPuntoVenta == null) {
            return view("inicio");
        }
        $empleados = DB::table('empleado')->select('empleado.comision', 'empleado.nombre', 'empleado.genero', 'empleado.docIdentidad', 'cargo.nombre as cargo', 'empleado.id')
            ->join('cargo', 'cargo.id', '=', 'empleado.idCargo')
            ->where('empleado.eliminado', 0)
            ->get('nombre', 'id');
        $tipo_ingresos = DB::table('tipoingreso')->where('eliminado', get_state('ACTIVO'))->get();
        $date = Carbon::now();
        $fecha = $date->toDateString();
        // Verificamos si el usuario que tiene permiso para apertura de caja ya abrio la caja
        $consulta = DB::table("ingreso")->where("ingreso.idPuntoVenta", $idPuntoVenta)->where('cierreCaja', '=', 0)->first();
        if (!is_null($consulta)){
            if ($consulta->cierreCaja == 0){
                Session::put('id_ingreso_apertura_caja',$consulta->id);
                // el usuario no ha cerrado caja y me voy a inicio
                return redirect('index');
            }else{
                return view("caja.apertura", compact(['empleados', 'tipo_ingresos']));
            }
        }else{
            return view("caja.apertura", compact(['empleados', 'tipo_ingresos']));
        }
    }

    public function CierreCaja()
    {
        $empleados = DB::table('empleado')->select('empleado.nombre', 'cargo.nombre as cargo', 'empleado.id')
            ->join('cargo', 'cargo.id', '=', 'empleado.idCargo')
            ->where('empleado.eliminado', 0)
            ->get('nombre', 'id');
        $tipo_egresos = DB::table('tipoegreso')->where('eliminado', get_state('ACTIVO'))->get();

//        return view('Caja.cierre', ['configuracion_caja' => 0, 'empleados' => $empleados, 'tipo_egresos' => $tipo_egresos, 'comprobante' => $comprobante]);
    }

    static function calcular_datos_cierre($idUsuarioCC){
        // Comprobar si el usuario ya hizo cierre de caja
        $id_ingreso_apertura_caja = Session::get('id_ingreso_apertura_caja');
        $apertura = DB::table('ingreso')->where('id', $id_ingreso_apertura_caja)->first();
        if ($apertura->cierreCaja == 1){
            return redirect('/');
        }


        // Obtener los datos de las ventas, productos vendidos y dinero ingresado
        $comprobante = array();

        //$comprobante['monto_inicial'] = $apertura->importe;

        $comprobante['fecha_apertura'] = $apertura->fecha . ' ' . $apertura->hora;
        $id_punto_venta = $apertura->idPuntoVenta;

        // Cantidad facturas
        $comprobante['facturas'] = DB::table('factura')
            ->join('puntoventa', 'factura.idPuntoVenta', '=', 'puntoventa.id')
            ->where('factura.fecha', '>=', $apertura->fecha)
            ->where('factura.hora', '>=', $apertura->hora)
            ->where('factura.eliminado', get_state('activo'))
            ->where('puntoventa.id', '=', $idUsuarioCC)->count(); //$id_punto_venta 

        // Cantidad de productos
        $result = DB::table('detalleventa')
            ->select(DB::raw('SUM(detalleventa.cantidad) as total_productos'))
            ->join('venta', 'detalleventa.idVenta', '=', 'venta.id')
            ->join('puntoventa', 'venta.idPuntoVenta', '=', 'puntoventa.id')
            ->where('venta.fecha', '>=', $apertura->fecha)
            ->where('venta.hora', '>=', $apertura->hora)
            ->where('venta.eliminado', get_state('activo'))
            ->where('puntoventa.id', '=', $idUsuarioCC)->first();
        $comprobante['productos'] = $result->total_productos;




        // Total efectivo Ventas y Pago inicial de ventas a credito
/*        $result_efectivo = DB::table('detalleviacobroventa')
            ->select(DB::raw('SUM(detalleviacobroventa.importe) as total_efectivo'))
            ->join('venta', 'detalleviacobroventa.idVenta', '=', 'venta.id')
            ->join('puntoventa', 'venta.idPuntoVenta', '=', 'puntoventa.id')
            ->where('venta.fecha', '>=', $apertura->fecha)
            ->where('venta.hora', '>=', $apertura->hora)
            ->where('venta.eliminado', get_state('activo'))
            ->where('puntoventa.id', '=', $idUsuarioCC)
            ->where('detalleviacobroventa.viaCobro', '=', 1)->get();*/
        $result_efectivo = DB::select("SELECT 'Venta'AS Tipo,v.id,v.fecha,v.hora,e.nombre AS empleado,ROUND(IFNULL(SUM(IF(vvcv.idMoneda = 2, (vvcv.importe*v.tipoCambio), vvcv.importe)),0),2)AS total_efectivo
  FROM venta v,detalleviacobroventa vvcv,puntoventa pv,empleado e,sucursal
  WHERE v.id=vvcv.idVenta AND v.idPuntoVenta=pv.id AND pv.idEmpleado=e.id AND vvcv.viaCobro=1 AND v.fecha>='".$apertura->fecha."' AND v.hora>='".$apertura->hora."' AND v.eliminado=0 AND v.estado=1 AND pv.idSucursal=sucursal.id AND pv.id=".$idUsuarioCC);    
        $comprobante['total_efectivo'] = $result_efectivo[0]->total_efectivo;


//Total efectivo pago credito
        $result_efectivo_credito = DB::select("SELECT 'Pago Creditos'AS Tipo,v.id,v.fecha,v.hora,e.nombre AS empleado,
ROUND(IFNULL(SUM(IF(dvccv.idMoneda = 2, (dvccv.importe*v.tipoCambio), dvccv.importe)),0),2)AS total_efectivo_credito
  FROM venta v, detalleviacobrocreditoventa dvccv, cobrocuota, cuentacobrar, puntoventa pv, empleado e,sucursal
  WHERE v.id=cuentacobrar.idVenta AND cuentacobrar.id=cobrocuota.idCuentaCobrar AND cobrocuota.id=dvccv.idCredito AND dvccv.idPuntoVenta=pv.id AND pv.idEmpleado=e.id AND dvccv.viaCobro=1 AND v.fecha>='".$apertura->fecha."' AND v.hora>='".$apertura->hora."' AND v.eliminado=0 AND v.estado=1 AND v.etapa='credito' AND pv.idSucursal=sucursal.id AND pv.id=".$idUsuarioCC);    
        $comprobante['total_efectivo_credito'] = $result_efectivo_credito[0]->total_efectivo_credito;





        // Total Tarjeta
/*        $result_tarjeta = DB::table('detalleviacobroventa')
            ->select(DB::raw('SUM(detalleviacobroventa.importe) as total_tarjeta'))
            ->join('venta', 'detalleviacobroventa.idVenta', '=', 'venta.id')
            ->join('puntoventa', 'venta.idPuntoVenta', '=', 'puntoventa.id')
            ->where('venta.fecha', '>=', $apertura->fecha)
            ->where('venta.hora', '>=', $apertura->hora)
            ->where('puntoventa.id', '=', $idUsuarioCC)
            ->where('venta.eliminado', get_state('activo'))
            ->where('detalleviacobroventa.viaCobro', '=', 4)->get();
        $comprobante['total_tarjeta'] = $result_tarjeta[0]->total_tarjeta;*/

        // Total Ingreso
        $result_ingreso = DB::select("SELECT tipoingreso.nombre as Tipo, ingreso.id, ingreso.fecha, ingreso.hora, empleado.nombre as empleado,ROUND(IFNULL(SUM(IF(ingreso_caja.monto_sus = 0, ingreso_caja.monto_bs, ((ingreso.tipoCambio*ingreso_caja.monto_sus)+ingreso_caja.monto_bs))),0),2)AS importe,sucursal.nombre as sucursal, 'Ingreso' as IngresoEgreso
FROM ingreso,ingreso_caja,tipoingreso,puntoventa,empleado,sucursal
WHERE ingreso.id=ingreso_caja.ingreso_id AND ingreso.idTipoIngreso=tipoingreso.id AND ingreso.idPuntoVenta=puntoventa.id AND puntoventa.idEmpleado=empleado.id AND ingreso.eliminado=0 AND ingreso.fecha >='".$apertura->fecha."' AND ingreso.hora >='".$apertura->hora."' AND puntoventa.idSucursal=sucursal.id AND puntoventa.id=".$idUsuarioCC);
        $comprobante['total_ingreso'] = $result_ingreso[0]->importe;



        $comprobante['total'] = $comprobante['total_efectivo'] + $comprobante['total_ingreso'] + $comprobante['total_efectivo_credito'];
        
        return $comprobante;
    }

    public function ReportVentasporusuario()
    {
        return view("ReporteListado.ReportVentasporusuario");
    }

    public function ReporteKardexInventario()
    {
        return view("ReporteListado.ReporteKardexInventario");
    }

    public function Reporttodousurios()
    {
        return view("ReporteListado.Reporttodousurios");
    }

    public function Reportporusuario()
    {
        return view("ReporteListado.Reportporusuario");
    }

    public function Reportflujousuario()
    {
        return view("ReporteListado.Reportflujousuario");
    }

    public function Reportflujocompleto()
    {
        return view("ReporteListado.Reportflujocompleto");
    }

    public function Reportflujoporusuario()
    {
        return view("ReporteListado.Reportflujoporusuario");
    }

    public function ReportEgreso()
    {
        return view("ReporteListado.ReportEgreso");
    }

    public function ReportIngreso()
    {
        return view("ReporteListado.ReportIngreso");
    }

    public function cambiarpasswordusuario($id)
    {
        $idempleado = $id;
        $nombreempleado;
        $empleado = DB::table('empleado')
            ->select('nombre')
            ->where('eliminado', 0)
            ->where('id', $id)
            ->lists('nombre');
        foreach ($empleado as $key => $value) {
            $nombreempleado = $value;
        }
        return view('Empleado.Cambiarpassword', compact(['nombreempleado', 'idempleado']));
    }

    public function login()
    {
        return view('inicio');
    }

    public function Categoria()
    {
        return view('Categoria.Categoria');
    }

    public function producto()
    {
        $tipo_producto = DB::table('tipoproducto')->select('nombre', 'id')->where('eliminado', 0)->get();
        return view('Producto.Productos', compact('tipo_producto'))->with('codigo_barras', Session::get('registrarProductoCodBarras'));
    }

    public function nuevoproducto()
    {
        $title = 'Registro de Producto';
        $categorias = DB::table('tipoproducto')->select('nombre', 'id')->where('eliminado', 0)->get();
        $marcas = Marca::where('eliminado', get_state('activo'))->get();
        $origenes = Origen::where('eliminado', get_state('activo'))->get();
        $esconder = '';
        return view('Producto.Addproductos', compact(['esconder', 'title', 'categorias', 'marcas', 'origenes']))->with('codigo_barras', Session::get('registrarProductoCodBarras'));
    }

    public function editar_producto($id_producto)
    {
        $title = 'Edicion de Producto';
        $categorias = DB::table('tipoproducto')->select('nombre', 'id')->where('eliminado', 0)->get();
        $marcas = Marca::where('eliminado', get_state('activo'))->get();
        $origenes = Origen::where('eliminado', get_state('activo'))->get();
        $producto = Producto::find($id_producto);
        $esconder = '';
        if ($producto->tipoproducto == 'comida' || $producto->tipoproducto == 'ingrediente') {
            $esconder = 'hidden';
        }
        return view('Producto.editarProducto', compact(['esconder', 'title', 'categorias', 'marcas', 'origenes', 'producto']))->with('codigo_barras', Session::get('registrarProductoCodBarras'));
    }

    public function Gestionarasientocontable()
    {
        return view('Contabilidad.asientoContable');
    }

    public function Unidadmedida()
    {
        return view('Unidadmedida.Unidadmedida');
    }

    public function Marca()
    {
        return view('Marca.Marca');
    }

    public function Origen()
    {
        return view('Origen.Origen');
    }

    public function liingredientes()
    {
        return view('Ingrediente.Ingredientes');
    }

    public function vistacargo()
    {
        return view('Cargo.Cargoempleado');
    }

    public function vistaempleado()
    {
        return view('Empleado.vistaEmpleado');
    }

    public function nuevoempleado()
    {
        return view('Empleado.Addempleado');
    }

    public function vistadeventa()
    {
        return view('Ventas.VerVenta');
    }

    public function venta($idventaultimo)
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $estado = DB::table('venta')->select('idMoneda', 'idListaPrecio', 'etapa', 'estado', 'idAlmacen', 'idPuntoVenta')->where('id', $idventaultimo)->get();
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'nombre')->lists('nombre', 'id');
        $listaprecio = DB::table('listaprecio')->select('id', 'nombre')->where('eliminado', 0)->lists('nombre', 'id');

        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $actual = "";
        $idCliente = null;
        $estados = $estado[0]->estado;
        $idalmacen = $estado[0]->idAlmacen;
        $puntoventa = $estado[0]->idPuntoVenta;
        $etapa = $estado[0]->etapa;
        $idMoneda = $estado[0]->idMoneda;
        $idListaPrecio = $estado[0]->idListaPrecio;
        $query_almacen = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $nombre_almacen = $query_almacen[0]->nombre;
        $query_config = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $multi_almacen = $query_config[0]->ventamultialmacen;
        if ($estados == 1) {
            $actual = "Cobrado";
            return redirect('/listadeventa');
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
            return redirect('/listadeventa');
        }
        if ($estados == 4) {
            $actual = "Proforma";
        }
        if ($estados == 5) {
            $actual = "Credito";
            return redirect('/listadeventa');
        }
        $razon;
        $nit;
        $nombre;
        $nombre = null;
        $razon = null;
        $nit = null;
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->join('usuario', 'empleado.id', '=', 'usuario.idEmpleado')
            ->where('empleado.eliminado', 0)
            ->where('puntoventa.puedevender', 0)
            ->lists('empleado.nombre', 'puntoventa.id');

        $listaPrecio = DB::table('listaprecio')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');

        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda,multiListaPrecio from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        $multiLista = $consulta[0]->multiListaPrecio;
        if ($multiLista == 0) {       //Unilista
            $consulta = DB::select("select configuracion.cantidad as id from configuracion where tipo = 'listaprecio'");
            $idlistaConfiguracion = $consulta[0]->id;
            $listaPrecio = DB::table('listaprecio')->select('nombre', 'id')->where('eliminado', 0)->where('id', $idlistaConfiguracion)->lists('nombre', 'id');
        }
        $almacenes = DB::table('almacen')->whereNotNull('idcuenta')->where('eliminado', get_state('ACTIVO'))->get();
        $accounts = get_accounts_by_user();
        $cajas = $accounts['cajas'];
        $cuenta_banco = $accounts['cuenta_banco'];
        $cuenta_cheque = $accounts['cuenta_cheque'];
        $cuenta_tdebito = $accounts['cuenta_tdebito'];
        $cuenta_tcredito = $accounts['cuenta_tcredito'];
        $cuentas_cobrar = DB::table('tipocuentacobrar')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $configuracion_empleado = get_configuracion_empleado();

        $puntosdeventaactual = DB::select("SELECT empleado.nombre,puntoventa.id FROM puntoventa,empleado WHERE empleado.id=puntoventa.idEmpleado AND puntoventa.id=".Session::get('idpuntoventa'));


        return view('Ventas.Ventas', compact(['cuentas_cobrar', 'cajas', 'cuenta_banco', 'cuenta_cheque', 'cuenta_tdebito',
            'cuenta_tcredito', 'almacenes', 'listaPrecio', 'idMoneda', 'idListaPrecio', 'puntosdeventa', 'etapa', 'multi_almacen',
            'nombre_almacen', 'idalmacen', 'nombre', 'nit', 'razon', 'idm', 'Ciudad', 'idventaultimo', 'fecha', 'mesa', 'actual',
            'clientes', 'idCliente', 'tipocliente', 'moneda1', 'bs', 'descuento', 'listaprecio', 'bimoneda', 'monedaBase', 'multiLista', 'configuracion_empleado','puntosdeventaactual']));
    }

    public function editarventas($id)
    {
        $estado = DB::table('venta')->select('idListaPrecio', 'etapa', 'estado', 'fecha', 'idMoneda', 'idCliente', 'idAlmacen', 'idPuntoVenta')->where('id', $id)->get();
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit, cliente.razonSocial
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        //0=guardado 1=cobrado  2=anulado Gestionarfactura
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'nombre')->lists('nombre', 'id');
        $listaprecio = DB::table('listaprecio')->select('id', 'nombre')->where('eliminado', 0)->lists('nombre', 'id');
        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $estados;
        $actual;
        $fecha;
        $idCliente = null;
        $nombre;
        $idalamcen;
        $puntoventa;
        $etapa;
        $idMoneda;
        $idListaPrecio;
        foreach ($estado as $key => $value) {
            $estados = $value->estado;
            $fecha = $value->fecha;
            $idCliente = $value->idCliente;
            $idalmacen = $value->idAlmacen;
            $puntoventa = $value->idPuntoVenta;
            $etapa = $value->etapa;
            $idMoneda = $value->idMoneda;
            $idListaPrecio = $value->idListaPrecio;
        }
        $query_almacen = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $nombre_almacen = $query_almacen[0]->nombre;
        $query_config = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $multi_almacen = $query_config[0]->ventamultialmacen;
        if ($estados == 1) {
            $actual = "Cobrado";
            return redirect('/listadeventa');
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
            return redirect('/listadeventa');
        }
        if ($estados == 4) {
            $actual = "Proforma";
        }
        if ($estados == 5) {
            $actual = "Credito";
            return redirect('/listadeventa');
        }
        $razon = null;
        $nit = null;
        $cliente = DB::table('cliente')->select('nombre', 'NIT', 'razonSocial')->where('id', $idCliente)->get();
        foreach ($cliente as $key => $value) {
            $nombre = $value->nombre;
            $razon = $value->razonSocial;
            $nit = $value->NIT;
        }
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');

        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id', 'puntoventa.ver_efectivo',
            'puntoventa.ver_banco', 'puntoventa.ver_cheque', 'puntoventa.ver_debito', 'puntoventa.ver_credito')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->join('usuario', 'empleado.id', '=', 'usuario.idEmpleado')
            ->where('empleado.eliminado', 0)
            ->where('puntoventa.puedevender', 0)
            ->lists('empleado.nombre', 'puntoventa.id');

        $puntosdeventaactual = DB::select("SELECT empleado.nombre,puntoventa.id FROM puntoventa,empleado WHERE empleado.id=puntoventa.idEmpleado AND puntoventa.id=".$puntoventa);



        $listaPrecio = DB::table('listaprecio')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');

        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda,multiListaPrecio from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        $multiLista = $consulta[0]->multiListaPrecio;
        if ($multiLista == 0) {       //Unilista
            $consulta = DB::select("select configuracion.cantidad as id from configuracion where tipo = 'listaprecio'");
            $idlistaConfiguracion = $consulta[0]->id;
            $listaPrecio = DB::table('listaprecio')->select('nombre', 'id')->where('eliminado', 0)->where('id', $idlistaConfiguracion)->lists('nombre', 'id');
        }
        $almacenes = DB::table('almacen')->whereNotNull('idcuenta')->where('eliminado', get_state('ACTIVO'))->get();
        $accounts = get_accounts_by_user();
        $cajas = $accounts['cajas'];
        $cuenta_banco = $accounts['cuenta_banco'];
        $cuenta_cheque = $accounts['cuenta_cheque'];
        $cuenta_tdebito = $accounts['cuenta_tdebito'];
        $cuenta_tcredito = $accounts['cuenta_tcredito'];
        $cuentas_cobrar = DB::table('tipocuentacobrar')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $configuracion_empleado = get_configuracion_empleado();
        return view('Ventas.EditarVentas', compact('cuentas_cobrar', 'almacenes', 'cajas', 'cuenta_banco',
            'cuenta_cheque', 'cuenta_tdebito', 'cuenta_tcredito', 'idListaPrecio', 'listaPrecio', 'puntosdeventa', 'etapa',
            'multi_almacen', 'nombre_almacen', 'idalmacen', 'nit', 'razon', 'Ciudad', 'id', 'mesa', 'actual', 'fecha', 'idCliente',
            'nombre', 'clientes', 'tipocliente', 'moneda1', 'bs', 'descuento', 'idm', 'listaprecio', 'bimoneda', 'monedaBase', 'idMoneda', 'multiLista', 'configuracion_empleado','puntosdeventaactual'));
    }

    public function Gestionarturno()
    {
        return view('Turno.Gestionarturno');
    }

    public function Gestionarmodulo()
    {
        return view('Seguridad.GestionModulo');
    }

    public function Gestionarobjeto()
    {
        return view('Seguridad.GestionObjeto');
    }

    public function Gestionarperfil()
    {
        return view('Seguridad.GestionPerfil');
    }

    public function Gestionarpuntoventa()
    {
        return view('Sucursal.Puntoventa');
    }

    public function GestionarPais()
    {
        return view('Sucursal.Pais');
    }

    public function gestionarinventario()
    {
        return view('Inventario.GestionarInventario');
    }

    public function gestionaralmacen()
    {
        $sucursal = DB::table('sucursal')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $empleado = DB::table('empleado')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $cuentas = h_cuentas_contables();
        return view('Inventario.Almacen', compact('sucursal', 'empleado', 'cuentas'));
    }

    public function gestionarmotivo()
    {
        $cuentas_contables = h_cuentas_contables();
        return view('Inventario.Motivo', compact('cuentas_contables'));
    }

    public function SinPermiso()
    {
        return view("errors.SinPermiso");
    }

    public function Gestionarempresa()
    {
        return view('Empresa.Gestionarempresa');
    }

    public function Gestionarfactura()
    {
        return view('Motivo.ListaFactura');
    }

    public function nuevoinventario($id_inventario)
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $idalmacen;
        $idalmacendestino;
        $estado = DB::table('inventario')->select('idAlmacen', 'idAlmacenDestino')->where('id', $id_inventario)->get();
        foreach ($estado as $key => $value) {
            $idalmacen = $value->idAlmacen;
            $idalmacendestino = $value->idAlmacenDestino;
        }
        $Almacen = DB::table('almacen')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $unidad = DB::table('unidadmedida')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $motivos = DB::table('motivomovimiento')->where('eliminado', 0)->get();
        $producto = DB::table('producto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->get();
        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        return view('Inventario.addinventario', compact(['centro_costos', 'idalmacendestino', 'idalmacen', 'id_inventario', 'fecha', 'Almacen', 'unidad', 'motivos', 'producto', 'bimoneda', 'monedaBase']));
    }

    public function editarinventario($id_inventario)
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $Almacen = DB::table('almacen')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $idalmacen;
        $idalmacendestino;
        $estado = DB::table('inventario')->select('idAlmacen', 'idAlmacenDestino')->where('id', $id_inventario)->get();
        foreach ($estado as $key => $value) {
            $idalmacen = $value->idAlmacen;
            $idalmacendestino = $value->idAlmacenDestino;
        }
        $unidad = DB::table('unidadmedida')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $motivo = DB::table('motivomovimiento')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $producto = DB::table('producto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->get();
        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        return view('Inventario.editarinventario', compact(['centro_costos', 'idalmacendestino', 'idalmacen', 'id_inventario', 'fecha', 'Almacen', 'unidad', 'motivo', 'producto', 'bimoneda', 'monedaBase']));
    }

    public function GestionarTipoEgreso()
    {
        $cuentas_contables = h_cuentas_contables();
        return view('EgresoIngreso.tipoegreso', compact('cuentas_contables'));
    }

    public function GestionarTipoIngreso()
    {
        $cuentas_contables = h_cuentas_contables();
        return view('EgresoIngreso.tipoingreso', compact('cuentas_contables'));
    }

    public function GestionarEgreso()
    {
        $sucursal = DB::table('tipoegreso')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $proveedor = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $date = Carbon::now();
        $fecha = $date->toDateString();

        $concepto = DB::table('concepto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('EgresoIngreso.egreso', compact(['sucursal', 'proveedor', 'fecha', 'concepto']));
    }

    public function GestionarIngreso()
    {
        $sucursal = DB::table('tipoingreso')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $date = Carbon::now();
        $fecha = $date->toDateString();

        $concepto = DB::table('concepto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('EgresoIngreso.ingreso', compact('sucursal', 'fecha', 'concepto'));
    }

    public function FacturaEgresoController()
    {
        return view('EgresoIngreso.egresoFactura');
    }
//    public function nuevacompra($idventaultimo) {
//        $date = Carbon::now();
//        $fecha = $date->toDateString();
//        $proveedor = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->orderBy('nombre', 'asc')->lists('nombre', 'id');
//        $unidad = DB::table('unidadmedida')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
//        $almacen = DB::table('almacen')->select('nombre', 'id')->where('eliminado', 0)->orderBy('nombre', 'asc')->lists('nombre', 'id');
//        return view('Compras.addCompras', compact(['idventaultimo', 'fecha', 'proveedor', 'unidad', 'almacen']));
//    }

    public function nuevacompra($id_compra)
    {
        $proveedores = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->get();
        $almacenes = DB::table('almacen')->select('nombre', 'id')->where('eliminado', 0)->get();
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_moneda = DB::select("select e.bimoneda,e.idMoneda as moneda_base, m.nombre as nombre_moneda 
          from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_impuesto = DB::table('configuracion')->join('impuesto', 'configuracion.cantidad', '=', 'impuesto.id')
            ->where('configuracion.tipo', '=', 'Credito Fiscal')->get();
        $ciudades = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_compra = null;
        $result = DB::select("SELECT c.id ,c.fecha, c.idMoneda, m.abreviatura, m.nombre as moneda
                FROM moneda m, compra c
                WHERE m.id = c.idMoneda and c.id = ? AND c.eliminado = 0", [$id_compra]);
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;

        $fecha = $result[0]->fecha;
        $moneda_id = $result[0]->idMoneda;
        $abreviatura = $result[0]->abreviatura;
        $nombre_moneda = $result[0]->moneda;
        $accounts = get_accounts_by_user();
        $cajas = $accounts['cajas'];
        $cuenta_banco = $accounts['cuenta_banco'];
        $cuenta_cheque = $accounts['cuenta_cheque'];
        $cuenta_tdebito = $accounts['cuenta_tdebito'];
        $cuenta_tcredito = $accounts['cuenta_tcredito'];
        $configuracion_empleado = get_configuracion_empleado();
        return view('Compras.addCompras', compact(['data_compra', 'id_compra', 'proveedores', 'almacenes', 'monedas',
            'data_moneda', 'centro_costos', 'data_impuesto', 'ciudades', 'abreviatura', 'cajas', 'cuenta_banco',
            'cuenta_cheque', 'cuenta_tdebito', 'cuenta_tcredito', 'configuracion_empleado']));
    }

    public function editarcompra($id_compra)
    {
        $proveedores = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->get();
        $almacenes = DB::table('almacen')->select('nombre', 'id')->where('eliminado', 0)->get();
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_moneda = DB::select("select e.bimoneda,e.idMoneda as moneda_base, m.nombre as nombre_moneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_impuesto = DB::table('impuesto')->where('id', '=', 1)->get(); // El egreso siempre sera credito fiscal
        $ciudades = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->get();
        $data_compra = DB::table('compra')->where('id', $id_compra)->first();
        $result = DB::select("SELECT c.id ,c.fecha, c.idMoneda, m.abreviatura, m.nombre as moneda
                FROM moneda m, compra c
                WHERE m.id = c.idMoneda and c.id = ? AND c.eliminado = 0", [$id_compra]);
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;

        $fecha = $result[0]->fecha;
        $moneda_id = $result[0]->idMoneda;
        $abreviatura = $result[0]->abreviatura;
        $nombre_moneda = $result[0]->moneda;
        $accounts = get_accounts_by_user();
        $cajas = $accounts['cajas'];
        $cuenta_banco = $accounts['cuenta_banco'];
        $cuenta_cheque = $accounts['cuenta_cheque'];
        $cuenta_tdebito = $accounts['cuenta_tdebito'];
        $cuenta_tcredito = $accounts['cuenta_tcredito'];
        $configuracion_empleado = get_configuracion_empleado();
        // Detalle formas de pago y credito
        $data_pagos = DB::table('detalleviapagocompra')->where('compra_id','=',$id_compra)->get();
        $efectivo = array();
        $banco = array();
        $cheque = array();
        $tarjeta = array();
        foreach ($data_pagos as $value){
            // Verificamos la moneda
            if ($value->idmoneda == 1){ // bs o moneda base

            }else{ // $us o extranjera

            }
        }
        return view('Compras.addCompras', compact(['data_compra', 'id_compra', 'proveedores', 'almacenes', 'monedas',
            'data_moneda', 'centro_costos', 'data_impuesto', 'ciudades', 'abreviatura', 'cajas', 'cuenta_banco',
            'cuenta_cheque', 'cuenta_tdebito', 'cuenta_tcredito', 'configuracion_empleado']));
    }

    public function GestionarProveedor()
    {
        $sucursal = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $cuentas_pagar = DB::table('tipocuentapagar')->select('nombre', 'id')->where('eliminado', '0')->lists('nombre', 'id');
        return view('Compras.Proveedor', compact('sucursal', 'cuentas_pagar'));
    }

    public function Gestionarcompras()
    {
        return view('Compras.compra');
    }

    public function Gestionarlibroorden()
    {
        $sucursal = DB::table('sucursal')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Seguridad.Gestionarlibroorden', compact('sucursal'));
    }

    public function Nuevolibroorden()
    {
        $sucursal = DB::table('sucursal')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Seguridad.Nuevolibroorden', compact('sucursal'));
    }

    public function Addproveedor()
    {
        $sucursal = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $cuentas_pagar = DB::table('tipocuentapagar')->select('nombre', 'id')->where('eliminado', '0')->lists('nombre', 'id');
        return view('Compras.Addproveedor', compact('sucursal', 'cuentas_pagar'));
    }

    public function addingreso()
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $tipo_ingreso = DB::table('tipoingreso')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();
        return view('EgresoIngreso.addingreso', compact('monedas', 'tipo_ingreso', 'fecha', 'centro_costos', 'bimoneda', 'monedaBase'));
    }

    public function addegreso()
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $tipo_egreso = DB::table('tipoegreso')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $centro_costos = DB::table('centrocosto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $proveedor = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();

        return view('EgresoIngreso.addegreso', compact('monedas', 'tipo_egreso', 'proveedor', 'fecha', 'bimoneda', 'monedaBase', 'centro_costos', 'creditos'));
    }

    public function Gestionarusuario($id_empleado)
    {
        $empleado = DB::select("select * from empleado where eliminado = 0 and id = ?", [$id_empleado]);

        $caja_seleccionada =
        $perfil = DB::table('perfil')->select('nombre', 'id')->where('eliminado', 0)->get();
        return view('Empleado.Usuario', compact(['empleado', 'id_empleado' ,'perfil']));
    }

    public function GestionarSucursal()
    {
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $empresa = DB::table('empresa')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Sucursal.Sucursal', compact('Ciudad', 'empresa'));
    }

    public function Gestionarperfilobjeto($id)
    {
        $idproducto = $id;
        $producto;
        $nombre = DB::table('perfil')->select('nombre')->where('id', $id)->lists('nombre');
        foreach ($nombre as $key => $value) {
            $producto = $value;
        }
        //$objeto = DB::table('objeto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $objeto = DB::table('objeto')->select('objeto.nombre', 'objeto.id')
                ->join('modulo','modulo.id','=','objeto.idmodulo')
                  ->orderby('objeto.nombre')->lists('objeto.nombre', 'objeto.id');        
        return view('Seguridad.Gestionperfilobjeto', compact(['idproducto', 'producto', 'objeto']));
    }

    public function vistaingrediente($id)
    {
        $idproducto = $id;
        $producto;
        $nombre = DB::table('producto')->select('nombre')->where('id', $id)->where('eliminado', 0)->lists('nombre');
        foreach ($nombre as $key => $value) {
            $producto = $value;
        }
        $unidads = DB::select("SELECT unidadmedida.abreviatura, unidadmedida.id FROM unidadmedida WHERE unidadmedida.eliminado = 0");
        $unidad = DB::table('unidadmedida')->select('abreviatura', 'id')->where('eliminado', 0)->lists('abreviatura', 'id');
        $ingrediente = DB::select("SELECT producto.nombre, producto.id FROM producto WHERE producto.eliminado = 0 AND producto.tipoproducto = 'ingrediente'");
        return view('Producto.Ingpro', compact(['idproducto', 'producto', 'unidad', 'ingrediente', 'unidads']));
    }

    public function GestionarMesa()
    {
        $Sucursal = DB::table('sucursal')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Mesa.Mesa', compact('Sucursal'));
    }

    public function GestionarMapamesa()
    {
        return view('Mesa.Mapa');
    }

    public function Ingpoducto()
    {
        $producto = DB::table('producto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $ingrediente = DB::table('ingrediente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $unidad = DB::table('unidadmedida')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Producto.Ingpro', compact(['producto', 'ingrediente', 'unidad']));
    }

    public function composicionprodcuto($id)
    {
        $idproducto = $id;
        $nombreproducto;
        $nombre = DB::table('producto')
            ->select('nombre')
            ->where('id', $id)
            ->lists('nombre');
        foreach ($nombre as $key => $value) {
            $nombreproducto = $value;
        }
        $productos = DB::select("SELECT producto.nombre, producto.id FROM producto WHERE producto.eliminado = 0 AND producto.tipoproducto <> 'ingrediente' AND producto.tipoproducto <> 'servicio' ");
        return view('Producto.ActualizarCompo', compact(['productos', 'nombreproducto', 'idproducto']));
    }

    public function comboproducto($id)
    {
        $idproducto = $id;
        $nombreproducto;
        $nombre = DB::table('producto')
            ->select('nombre')
            ->where('id', $id)
            ->lists('nombre');
        foreach ($nombre as $key => $value) {
            $nombreproducto = $value;
        }
        $productos = DB::select("SELECT producto.nombre, producto.id FROM producto WHERE producto.eliminado = 0 AND producto.tipoproducto <> 'ingrediente' AND producto.tipoproducto <> 'servicio' ");
        return view('Producto.ActualizarCombo', compact(['productos', 'nombreproducto', 'idproducto']));
    }

    public function GestionarReporte()
    {
        return view('Reporte.Gestionarreporte');
    }

    public function reporte()
    {
        $productos = DB::table('producto')->select('nombre', 'id', 'precioVenta')->where('eliminado', 0)->get('nombre', 'id', 'precioVenta');
        $pdf = \PDF::loadView('Reporte.producto', compact('productos'));
        return $pdf->download('producto.pdf');
    }

    public function reporteusuario()
    {
        $productos = DB::table('empleado')->select('empleado.nombre', 'empleado.genero', 'empleado.docIdentidad', 'cargo.nombre as cargo', 'empleado.id')
            ->join('cargo', 'cargo.id', '=', 'empleado.idCargo')
            ->where('empleado.eliminado', 0)
            ->get('nombre', 'genero', 'docIdentidad', 'cargo', 'id');
        $pdf = \PDF::loadView('Reporte.usuario', compact('productos'));
        return $pdf->stream();
    }

    public function reportecompra()
    {
        return view('Reporte.Compra');
    }

    public function Autorizaciones()//$id)
    {
      
        $productos = DB::table('perfil')->select('perfilobjeto.puedeguardar', 'perfilobjeto.puedemodificar', 'perfilobjeto.puedeeliminar', 'perfilobjeto.puedelistar', 'perfilobjeto.puedeverreporte',  'objeto.urlobjeto')
            ->join('perfilobjeto', 'perfilobjeto.idperfil', '=', 'perfil.id')
            ->join('objeto', 'objeto.id', '=', 'perfilobjeto.idobjeto')
            ->join('modulo', 'modulo.id', '=', 'objeto.idmodulo')
            ->where('perfil.id', Session::get('idPerfil'))//$id)
            ->get();
        return response()->json($productos);
    }

    public function Descuentos()
    {
        return view("Descuento.Listadescuento");
    }

    public function Ventacruzada()
    {
        $producto = DB::table('producto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view("ReporteListado.ReporteVentaCruzada", compact('producto'));
    }

    public function ReportRaking()
    {
        return view("ReporteListado.ReporteRakingimporte");
    }

    public function vistadeventares()
    {
        $idempleado = Session::get('idempleado');
        $idpuntoventa = Session::get('idpuntoventa');
        $datos = DB::select("CALL listarventas(?,?)", [$idempleado, $idpuntoventa]);
        return view('Ventas.VerVentares', compact('datos'));
    }

    public function editarventasres($id)
    {
        $fechas;
        $estado = DB::table('venta')->select('etapa', 'estado', 'fecha', 'idCliente', 'idAlmacen', 'idPuntoVenta')->where('id', $id)->get();
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit, cliente.razonSocial
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        $listaprecio = DB::table('listaprecio')->select('id', 'nombre')->where('eliminado', 0)->lists('nombre', 'id');
        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $estados;
        $actual;
        $idCliente = null;
        $idalmacen;
        $puntoventa;
        $etapa;
        foreach ($estado as $key => $value) {
            $estados = $value->estado;
            $fechas = $value->fecha;
            $idCliente = $value->idCliente;
            $idalmacen = $value->idAlmacen;
            $puntoventa = $value->idPuntoVenta;
            $etapa = $value->etapa;
        }
        if ($estados == 1) {
            $actual = "Cobrado";
            return redirect('/listadeventares');
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
            return redirect('/listadeventares');
        }
        if ($estados == 3) {
            $actual = "Programado";
        }
        if ($estados == 5) {
            $actual = "Credito";
            return redirect('/listadeventares');
        }
        $nombre;
        $razon = null;
        $nit = null;
        $cliente = DB::table('cliente')->select('nombre', 'NIT', 'razonSocial')->where('id', $idCliente)->get();
        foreach ($cliente as $key => $value) {
            $nombre = $value->nombre;
            $razon = $value->razonSocial;
            $nit = $value->NIT;
        }
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $a;
        foreach ($alm as $key => $value) {
            $a = $value->nombre;
        }
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p;
        foreach ($punt as $key => $value) {
            $p = $value->ventamultialmacen;
        }
        $fecha = Carbon::parse($fechas)->format('d/m/Y');
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->where('empleado.eliminado', 0)->lists('empleado.nombre', 'puntoventa.id');
        $configuracion_empleado = DB::table('usuario')->select('perfil.id as perfil', 'puntoventa.ver_efectivo', 'puntoventa.ver_banco',
            'puntoventa.ver_cheque', 'puntoventa.ver_debito', 'puntoventa.ver_credito')
            ->join('empleado', 'empleado.id', '=', 'usuario.idEmpleado')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->join('perfil', 'perfil.id', '=', 'usuario.idPerfil')
            ->join('sucursal', 'sucursal.id', '=', 'puntoventa.idSucursal')
            ->join('cargo', 'empleado.idCargo', '=', 'cargo.id')
            ->where('usuario.idEmpleado', Session::get('idempleado'))->first();
        return view('Ventas.EditarVentares', compact('idm', 'puntosdeventa', 'idalmacen', 'etapa',
            'p', 'a', 'descuento', 'tipocliente', 'Ciudad', 'nit', 'razon', 'nombre', 'id', 'mesa', 'actual', 'fecha',
            'idCliente', 'clientes', 'listaprecio', 'configuracion_empleado'));
    }

    public function ventares($idventaultimo)
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $estado = DB::table('venta')->select('etapa', 'estado', 'idAlmacen', 'idPuntoVenta')->where('id', $idventaultimo)->get();
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $puntoventa;
        $estados;
        $actual;
        $idCliente = null;
        $idalmacen;
        $etapa;
        foreach ($estado as $key => $value) {
            $estados = $value->estado;
            $idalmacen = $value->idAlmacen;
            $puntoventa = $value->idPuntoVenta;
            $etapa = $value->etapa;
        }
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $a = null;
        foreach ($alm as $key => $value) {
            $a = $value->nombre;
        }
        if ($estados == 1) {
            $actual = "Cobrado";
            return redirect('/listadeventares');
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
            return redirect('/listadeventares');
        }
        if ($estados == 5) {
            $actual = "Credito";
            return redirect('/listadeventares');
        }
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p;
        foreach ($punt as $key => $value) {
            $p = $value->ventamultialmacen;
        }
        $razon;
        $nit;
        $nombre;
        $nombre = null;
        $razon = null;
        $nit = null;
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->where('empleado.eliminado', 0)->lists('empleado.nombre', 'puntoventa.id');
        $listaprecio = DB::table('listaprecio')->select('id', 'nombre')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Ventas.Ventasres', compact(['puntosdeventa', 'idalmacen', 'etapa', 'p', 'a', 'nombre', 'nit', 'razon', 'idm', 'Ciudad', 'idventaultimo', 'fecha', 'mesa', 'actual', 'clientes', 'idCliente', 'tipocliente', 'moneda1', 'bs', 'descuento', 'listaprecio']));
    }

    public function Reportelibroventa()
    {
        $sucursales = DB::table('sucursal')->select('nombre', 'id')->where('eliminado', 0)->orderBy('id', 'desc')->lists('nombre', 'id');
        return view("ReporteListado.ReporteLibroVenta", compact(['sucursales']));
    }

    public function Credito()
    {
        $consulta = DB::select("select bimoneda,idMoneda from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
//        if ($bimoneda == 1){
//            $bancos = DB::table('banco')->where('eliminado', 0)->get();
//            $cajas = DB::table('caja')->where('eliminado', 0)->get();
//        }else{
//            $bancos = null;
//            $cajas = null;
//        }
        return view('Credito.Credito', compact('bimoneda', 'monedaBase'));
    }

    public function listarproformas()
    {
        return view('Proforma.proforma');
    }

    public function listaralquiler()
    {
        return view('Alquiler.alquiler');
    }

    public function gestionarcontador()
    {
        return view("Sucursal.Contador");
    }

    public function CompraCredito()
    {
        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;
        $concepto = DB::table('concepto')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $tipo_egreso = DB::table('tipoegreso')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $proveedor = DB::table('Proveedor')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');

        return view("Compras.Listarcredito", compact('bimoneda', 'monedaBase'));
    }

    public function listarcreditocompra()
    {
        $idempleado = Session::get('idempleado');
        $idpuntoventa = Session::get('idpuntoventa');
/*        $datos = DB::select("SELECT c.id, c.fecha, c.hora, empleado.nombre,
              (SELECT SUM(pago.pagado) AS cuotasPagadas FROM (SELECT SUM(cu.importe) AS pagado, cc.compra_id FROM cobroacuota cu, cuentaacobrar cc
                                                              WHERE cu.idCuentaaCobrar = cc.id) AS pago WHERE pago.compra_id = c.id) AS pgado,
              c.total, proveedor.nombre AS cliente, c.saldoACobrar AS saldoacobrar, c.sumaFormaPago AS aCuenta, c.idMoneda, m.abreviatura
            FROM compra c INNER JOIN puntoventa pv INNER JOIN empleado INNER JOIN proveedor ON proveedor.id=c.idProveedor INNER JOIN moneda m on c.idMoneda = m.id
            WHERE c.idpuntoventa = pv.id AND pv.idEmpleado = empleado.id AND empleado.id = ? AND pv.id = ? AND c.eliminado=0
                  AND c.eliminado = 0 AND c.etapa = 'credito'
            GROUP BY c.id
            ORDER BY c.id DESC", [$idempleado, $idpuntoventa]);*/

        $datos = DB::select("SELECT id,fecha,hora,total,aCuenta,pagado,nombre,cliente,idMoneda,abreviatura FROM(
SELECT compra.id,compra.fecha,compra.hora,compra.total,compra.sumaFormaPago AS aCuenta,IFNULL(SUM(cobroacuota.totalBolivianos),0)AS pagado,empleado.nombre, proveedor.nombre AS cliente,compra.idMoneda,moneda.abreviatura
FROM compra,cuentaacobrar,cobroacuota,puntoventa,empleado,proveedor,moneda
WHERE compra.id=cuentaacobrar.compra_id AND cuentaacobrar.id=cobroacuota.idCuentaaCobrar AND compra.idPuntoventa=puntoventa.id AND puntoventa.idEmpleado=empleado.id AND compra.idProveedor=proveedor.id AND compra.idMoneda=moneda.id AND compra.eliminado=0 AND compra.etapa='credito' AND compra.estado!=0 
GROUP BY compra.id
UNION ALL
SELECT compra.id,compra.fecha,compra.hora,compra.total,compra.sumaFormaPago AS aCuenta,'0'AS pagado,empleado.nombre, proveedor.nombre AS cliente,compra.idMoneda,moneda.abreviatura
FROM compra,puntoventa,empleado,proveedor,moneda
WHERE compra.idPuntoventa=puntoventa.id AND puntoventa.idEmpleado=empleado.id AND compra.idProveedor=proveedor.id AND compra.idMoneda=moneda.id AND compra.eliminado=0 AND compra.etapa='credito' AND compra.estado!=0 
GROUP BY compra.id
) TOTAL GROUP BY id ORDER BY fecha DESC");
        return response()->json($datos);
    }

    public function EstadoInventario()
    {
        return view("ReporteListado.ReporteEstadoInventario");
    }

    public function Banco()
    {
        return view("Banco.Banco");
    }

    public function configuracionInventario()
    {
        $cuentas = DB::table('cuentacontable')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
        $cc_ajuste_inventario = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Ajuste Inventario'");
        $cc_ingreso_sobrante = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Ingreso Sobrante'");
        $cc_egreso_faltante = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Egreso Faltante'");
        $sin_codigo = DB::table('configuracion')->where('tipo', 'registrarProductoCodBarras')->get();
        return view('Configuracion.InventarioConfiguracion', compact('sin_codigo', 'cuentas', 'cc_ajuste_inventario', 'cc_ingreso_sobrante', 'cc_egreso_faltante'));
    }

    public function ConfiguracionCaja()
    {
        $cuenta = DB::table('cuentacontable')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
//        $cuenta = DB::table('tipo')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
        return view('Configuracion.cajaConfiguracion', compact('cuenta'));
    }

    public function ConfiguracionCompra()
    {
        $cuenta = DB::table('cuentacontable')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
        $mercaderia_transito = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Mercaderia Transito'");
        $devolucion_compra = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Devolucion Compra'");
        $cf_devolucion_compra = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC cf Devolucion Compra'");
        $descuento_compra = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Descuento Compra'");
        $impuestos = DB::table('impuesto')->where('eliminado', get_state('activo'))->get();
        $credito_fiscal = DB::select("select i.id, i.nombre as nombre_impuesto, i.valor
                                    from configuracion c, impuesto i
                                    where c.cantidad = i.id and i.eliminado = 0 and c.tipo = 'Credito Fiscal'");
        return view('Configuracion.compraConfiguracion', compact(['cuenta', 'mercaderia_transito', 'devolucion_compra', 'cf_devolucion_compra', 'descuento_compra', 'credito_fiscal', 'impuestos']));
    }

    public function CuentaBancaria()
    {
        $banco = DB::table('banco')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $cuenta_contable = DB::table('cuentacontable')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();

        return view('Banco.CuentaBancaria', compact('banco', 'cuenta_contable', 'monedas'));
    }

    public function configuracionGeneral()
    {
        $opciones = DB::table('configuracion')->where('tipo', 'asiento automatico')->where('tipoparametro', 'contable')->get();
        return view('Configuracion.GeneralConfiguracion', compact('opciones'));
    }

    public function Concepto()
    {
        return view('Banco.Concepto');
    }

    public function TipoCliente()
    {
        return view('TipoCliente.TipoCliente');
    }

    public function GestionarTipoCliente()
    {
   
        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!

        return view('Cliente.Cliente');
    }

    public function GestionarMoneda()
    {
        return view("Moneda.Moneda");
    }

    public function GestionarTipoDeCambio()
    {
        return view("Moneda.TipoDeCambio");
    }

    public function RegistroTipoCambio()
    {
        return view("Moneda.TipoDeCambioIndex");
    }

    public function CompraEfectivo()
    {
        return view("ReporteListado.CompraEfectivo");
    }

    public function CompraCredito1()
    {
        return view("ReporteListado.CompraCredito1");
    }

    public function ReporteMovimientoInventario()
    {
        return view("ReporteListado.ReportMovimientoInventario");
    }

    public function Reporttodousuriosporusuario()
    {
        return view("ReporteListado.Reporttodoporusurios");
    }

    public function ReportIngresoPorUsuario()
    {
        return view("ReporteListado.ReportIngresoPorUsuario");
    }

    public function ReportEgresoPorusuario()
    {
        return view("ReporteListado.ReportEgresoPorUsuario");
    }

    public function vistadeventaopt()
    {
        $idempleado = Session::get('idempleado');
        $idpuntoventa = Session::get('idpuntoventa');
        $datos = DB::select("CALL listarventas(?,?)", [$idempleado, $idpuntoventa]);
        return view('Ventas.VerVentasopt', compact('datos'));
    }

    public function editarventasopt($id)
    {
        $estado = DB::table('venta')->select('etapa', 'estado', 'fecha', 'idCliente', 'idAlmacen', 'idPuntoVenta')->where('id', $id)->get();
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit, cliente.razonSocial
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        //0=guardado 1=cobrado  2=anulado Gestionarfactura
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $estados;
        $actual;
        $fecha;
        $idCliente = null;
        $nombre;
        $idalamcen;
        $puntoventa;
        $etapa;
        foreach ($estado as $key => $value) {
            $estados = $value->estado;
            $fecha = $value->fecha;
            $idCliente = $value->idCliente;
            $idalmacen = $value->idAlmacen;
            $puntoventa = $value->idPuntoVenta;
            $etapa = $value->etapa;
        }
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $a;
        foreach ($alm as $key => $value) {
            $a = $value->nombre;
        }
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p;
        foreach ($punt as $key => $value) {
            $p = $value->ventamultialmacen;
        }
        if ($estados == 1) {
            $actual = "Cobrado";
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
        }
        if ($estados == 4) {
            $actual = "Proforma";
        }
        if ($estados == 5) {
            $actual = "Credito";
        }
        $razon = null;
        $nit = null;
        $nombre = null;
        $cliente = DB::table('cliente')->select('nombre', 'NIT', 'razonSocial')->where('id', $idCliente)->get();
        foreach ($cliente as $key => $value) {
            $razon = $value->razonSocial;
            $nit = $value->NIT;
            $nombre = $value->nombre;
        }
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');
        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->where('empleado.eliminado', 0)->lists('empleado.nombre', 'puntoventa.id');
        return view('Ventas.EditarVentaopt', compact('puntosdeventa', 'etapa', 'p', 'a', 'idalmacen', 'nit', 'razon', 'Ciudad', 'id', 'mesa', 'actual', 'fecha', 'idCliente', 'nombre', 'clientes', 'tipocliente', 'moneda1', 'bs', 'descuento', 'idm'));
    }

    public function ventaopt($idventaultimo)
    {
        $date = Carbon::now();
        $fecha = $date->toDateString();
        $mesa = DB::table('mesa')->select('numeromesa', 'id')->where('eliminado', 0)->lists('numeromesa', 'id');
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $estado = DB::table('venta')->select('etapa', 'estado', 'idAlmacen', 'idPuntoVenta')->where('id', $idventaultimo)->get();
        $moneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        foreach ($moneda as $key => $value) {
            $moneda1 = $value->moneda;
            $bs = $value->bs;
            $idm = $value->id;
        }
        $estados;
        $actual;
        $idCliente = null;
        $idalmacen;
        $puntoventa;
        $etapa;
        foreach ($estado as $key => $value) {
            $estados = $value->estado;
            $idalmacen = $value->idAlmacen;
            $puntoventa = $value->idPuntoVenta;
            $etapa = $value->etapa;
        }
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $a;
        foreach ($alm as $key => $value) {
            $a = $value->nombre;
        }
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p;
        foreach ($punt as $key => $value) {
            $p = $value->ventamultialmacen;
        }
        if ($estados == 1) {
            $actual = "Cobrado";
        }
        if ($estados == 0) {
            $actual = "Guardado";
        }
        if ($estados == 2) {
            $actual = "Anulado";
        }
        if ($estados == 5) {
            $actual = "Credito";
        }
        $nombre = null;
        $razon = null;
        $nit = null;
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $puntosdeventa = DB:: table('empleado')->select('empleado.nombre', 'puntoventa.id')
            ->join('puntoventa', 'puntoventa.idEmpleado', '=', 'empleado.id')
            ->where('empleado.eliminado', 0)->lists('empleado.nombre', 'puntoventa.id');
        return view('Ventas.Ventasopt', compact(['puntosdeventa', 'etapa', 'p', 'a', 'idalmacen', 'nombre', 'nit', 'razon', 'idm', 'Ciudad', 'idventaultimo', 'fecha', 'mesa', 'actual', 'clientes', 'idCliente', 'tipocliente', 'moneda1', 'bs', 'descuento']));
    }

    public function ReportVentasComisionActual()
    {
        return view("ReporteListado.ReportVentasPorComissionActual");
    }

    public function ReportVentasComisionPorUsuario()
    {
        return view("ReporteListado.ReportVentasPorComissionPorUsuario");
    }

    public function ReportGarantiaAlquilerActual()
    {
        return view("ReporteListado.ReportGarantiaAlquilerActual");
    }

    public function ReportGarantiaAlquilerPorUsuario()
    {
        return view("ReporteListado.ReportGarantiaAlquilerPorUsuario");
    }

    public function detallecomprasactual()
    {
        return view("ReporteListado.ReportDetalleCompraActual");
    }

    public function detallecomprasporusuario()
    {
        return view("ReporteListado.ReportDetalleCompraPorUsuario");
    }

    public function productoresto()
    {
        return view('Producto.ProductosResto');
    }

    public function nuevoproductoresto()
    {
        return view('Producto.Addproductosresto');
    }

    public function alquiler($idventaultimo)
    {
        $id = $idventaultimo;
        $estado = DB::table('venta')->select('etapa', 'estado', 'fecha', 'idCliente', 'idAlmacen', 'idPuntoVenta')->where('id', $id)->get();
        $etapa;
        $estados = $estado[0]->estado;
        $idalmacen = $estado[0]->idAlmacen;
        $puntoventa = $estado[0]->idPuntoVenta;
        $etapa = $estado[0]->etapa;
        $fecha = $estado[0]->fecha;
        $tipomoneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $moneda = $tipomoneda[0]->moneda;
        $bs = $tipomoneda[0]->bs;
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $almacen = $alm[0]->nombre;
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        $idCliente = null;
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p = $punt[0]->ventamultialmacen;
        return view('Alquiler.nuevoalquiler', compact('p', 'descuento', 'id', 'fecha', 'moneda', 'bs', 'almacen', 'idalmacen', 'clientes', 'idCliente', 'Ciudad', 'tipocliente'));
    }

    public function editaralquiler($idventaultimo)
    {
        $id = $idventaultimo;
        $estado = DB::table('venta')->select('etapa', 'estado', 'fecha', 'idCliente', 'idAlmacen', 'idPuntoVenta')->where('id', $id)->get();
        $etapa;
        $estados = $estado[0]->estado;
        $idalmacen = $estado[0]->idAlmacen;
        $puntoventa = $estado[0]->idPuntoVenta;
        $etapa = $estado[0]->etapa;
        $fecha = $estado[0]->fecha;
        $idCliente = $estado[0]->idCliente;
        $tipomoneda = DB::table('tipomoneda')->select('moneda', 'bs', 'id')->where('eliminado', 0)->get();
        $moneda = $tipomoneda[0]->moneda;
        $bs = $tipomoneda[0]->bs;
        $alm = DB::select("SELECT almacen.nombre FROM almacen WHERE almacen.id = ?", [$idalmacen]);
        $almacen = $alm[0]->nombre;
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        $razon = null;
        $nit = null;
        $nombre = null;
        $cliente = DB::table('cliente')->select('nombre', 'NIT', 'razonSocial')->where('id', $idCliente)->get();
        foreach ($cliente as $key => $value) {
            $razon = $value->razonSocial;
            $nit = $value->NIT;
            $nombre = $value->nombre;
        }
        $Ciudad = DB::table('ciudad')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $tipocliente = DB::table('tipocliente')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        $descuento = DB::table('tipodescuento')->select('id', 'descuento')->lists('descuento', 'id');
        $punt = DB::select("SELECT puntoventa.ventamultialmacen FROM puntoventa WHERE puntoventa.id = ?", [$puntoventa]);
        $p = $punt[0]->ventamultialmacen;
        return view('Alquiler.editaralquiler', compact('p', 'descuento', 'id', 'fecha', 'moneda', 'bs', 'almacen', 'idalmacen', 'clientes', 'idCliente', 'Ciudad', 'tipocliente'));
    }

//Danny Cambios
    public function GestionarGastoCompra()
    {
        $cuentas = h_cuentas_contables();
//        $proveedor = DB::table('Proveedor')->select('nombre', 'id')->where('eliminado', 0)->lists('nombre', 'id');
        return view('Compras.GastoCompra', compact(['cuentas']));
    }

    public function VistaGastoCompra($idrecepcioncompra) //26 estaba en formas_pago en g.idrecepcioncompra = 26
    {
        $formas_pago = DB::select("SELECT c.id, c.nombre
              FROM concepto c WHERE c.eliminado = 0 AND c.id!=5 and c.id not IN (SELECT gc.concepto_id FROM gasto_forma_pago_cuenta gc, gastocompra g
              WHERE gc.gasto_recepcion_id = g.idGastoCompra and g.idrecepcioncompra = 26
              UNION SELECT ge.concepto_id FROM gasto_forma_pago_efectivo ge, gastocompra g WHERE ge.gasto_recepcion_id = g.idGastoCompra
              and g.idrecepcioncompra = 26)");
        $recepcion = DB::select("SELECT r.id, r.idcompra, r.fecha, c.idMoneda, r.estado, r.total, a.nombre as almacen, p.id as proveedor_id, p.nombre as proveedor
                          FROM recepcioncompra r, compra c, almacen a, proveedor p
                          WHERE r.idcompra = c.id and c.eliminado = 0 and c.idProveedor = p.id
                          and c.idAlmacen = a.id and r.id = ?", [$idrecepcioncompra]);
        $gastos = DB::table('tipogastoscompra')->select('nombre', 'idTipoGasto')->where('eliminado', 0)->get();
        $proveedores = DB::table('proveedor')->select('nombre', 'id')->where('eliminado', 0)->get();
        $monedas = DB::table('moneda')->select('nombre', 'id')->where('eliminado', 0)->get();
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $moneda_base = $consulta[0]->idMoneda;
        $data_impuesto = DB::table('impuesto')->where('id', '=', 1)->get(); // El egreso siempre sera credito fiscal
        return view("Compras.planillaGastoCompra", compact(['data_impuesto', 'bimoneda', 'moneda_base', 'monedas', 'recepcion', 'idrecepcioncompra', 'formas_pago', 'gastos', 'proveedores']));
    }

    public function ReportVentasanuladasyeliminadas()
    {
        return view("ReporteListado.ReportVentasanuladasyeliminadas");
    }

    public function ReportVentaACredito()
    {
        $clientes = DB::select("SELECT cliente.nombre, cliente.id, cliente.nit
                FROM cliente WHERE cliente.eliminado = 0");
        return view("ReporteListado.ReportVentaACredito", compact(['clientes']));
    }

    public function cambiarContraseniaDeUsuario($id)
    {
        $idempleado = $id;
        $nombreempleado;
        $empleado = DB::table('empleado')
            ->select('nombre')
            ->where('eliminado', 0)
            ->where('id', $id)
            ->lists('nombre');
        foreach ($empleado as $key => $value) {
            $nombreempleado = $value;
        }
        return view('Empleado.cambiarContrasenia', compact(['nombreempleado', 'idempleado']));
    }

    public function reportflujoingresosegresos()
    {
        return view("ReporteListado.ReportFlujoIngresosEgresos");
    }

    public function ReportDetalleVentaBelleMarie()
    {
        return view("ReporteListado.ReportDetalleVentaBelleMarie");
    }

    public function page404()
    {
        return view("errors.page-404");
    }

    public function ReportTxNInventario()
    {
        return view("ReporteListado.ReportTxNInventario");
    }

    public function configuracionventa()
    {
        $cuentas = DB::table('cuentacontable')->where('tipoCuenta', 'cuenta')->where('eliminado', 0)->get();
        $cuenta_ventas = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Ingreso por Ventas'");
        $cuenta_servicios = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Ingreso por Servicios'");
        $costo_ventas = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Costo de Venta'");
        $devolucion_ventas = DB::select("select c.*, cu.nombre from configuracion c, cuentacontable cu where c.cantidad = cu.id and c.tipo = 'CC Dev. En Ventas'");
        $impuestos = DB::table('impuesto')->where('eliminado', get_state('activo'))->get();
        $impuesto_it = DB::select("select i.id, i.nombre as nombre_impuesto, i.valor
                                    from configuracion c, impuesto i
                                    where c.cantidad = i.id and c.tipo = 'Impuesto IT'");
        $impuesto_it_pagar = DB::select("select i.id, i.nombre as nombre_impuesto, i.valor
                                    from configuracion c, impuesto i
                                    where c.cantidad = i.id and i.eliminado = 0 and c.tipo = 'Impuesto IT por Pagar'");
        $debito_fiscal = DB::select("select i.id, i.nombre as nombre_impuesto, i.valor
                                    from configuracion c, impuesto i
                                    where c.cantidad = i.id and i.eliminado = 0 and c.tipo = 'Debito Fiscal'");
        $credito_fiscal = DB::select("select i.id, i.nombre as nombre_impuesto, i.valor
                                    from configuracion c, impuesto i
                                    where c.cantidad = i.id and i.eliminado = 0 and c.tipo = 'Credito Fiscal'");
        $descuento_inventario = DB::table('configuracion')->where('tipo', '=', 'Descontar Inventario')->get();
        $chequed = '';
        if ($descuento_inventario[0]->cantidad == 1) {
            $chequed = 'checked';
        }
        return view('Configuracion.VentaConfiguracion', compact(['chequed', 'cuentas', 'cuenta_ventas', 'cuenta_servicios', 'costo_ventas', 'devolucion_ventas', 'impuestos', 'impuesto_it', 'impuesto_it_pagar', 'debito_fiscal']));
    }

    public function configuracionMoneda()
    {
        return view('Configuracion.configuracionMoneda');
    }

    public function ListaPrecio()
    {
        //Tabla Empresa!!!!!!!!!!!!!!!!!!!!!
        $consulta = DB::select("select bimoneda,idMoneda from empresa");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;

        return view("ListaPrecio.listaPrecio", compact(['bimoneda', 'monedaBase']));
    }

    public function productosucursal()
    {
        $suacursal = DB::select("SELECT id FROM sucursal ORDER BY id ASC LIMIT 1");
        $idsucursal;
        foreach ($suacursal as $key => $value) {
            $idsucursal = $value->id;
        }
        $listaprecio = DB::select("SELECT id FROM listaprecio ORDER BY id ASC LIMIT 1");
        $idlistaprecio;
        foreach ($listaprecio as $key => $value) {
            $idlistaprecio = $value->id;
            return view('Producto.productosucursal', compact(['idsucursal', 'idlistaprecio']));
        }
        $idlistaprecio = "0";

        return view('Producto.productosucursal', compact(['idsucursal', 'idlistaprecio']));
    }

    public function ReportCostoProducto()
    {
        $suacursal = DB::select("SELECT id FROM  sucursal ORDER BY id ASC LIMIT 1");
        $idsucursal;
        foreach ($suacursal as $key => $value) {
            $idsucursal = $value->id;
        }
        $listaprecio = DB::select("SELECT id FROM listaprecio ORDER BY id ASC LIMIT 1");
        $idlistaprecio;
        foreach ($listaprecio as $key => $value) {
            $idlistaprecio = $value->id;
        }

        return view('ReporteListado.reportCostoProducto', compact(['idsucursal', 'idlistaprecio']));
    }

    public function GestionarCaja()
    {
        $cuentas_contables = h_cuentas_contables();
        $monedas = DB::table('moneda')->where('eliminado', 0)->get();
        return view("Caja.Caja", compact(['cuentas_contables', 'monedas']));
    }

    //recepcion compra
    ///////////////////
    public function vistarecepcioncompra($idcompra, $idrecepcion)
    {
        $result = DB::select("SELECT c.id ,c.fecha, p.id as proveedor_id,p.nombre, c.idMoneda, m.abreviatura, 
          m.nombre as moneda, cc.id as centro_costo_id, cc.nombre as centro_costo, c.con_factura, c.impuesto, a.id as id_almacen,
              a.nombre as almacen
            FROM moneda m, compra c, proveedor p, centrocosto cc, almacen a
            WHERE m.id = c.idMoneda and c.idProveedor = p.id and c.centro_costo_id = cc.id and c.idAlmacen = a.id and c.id = ? AND c.eliminado = 0", [$idcompra]);
        $consulta = DB::select("select e.bimoneda,e.idMoneda from empresa e, moneda m where e.idMoneda = m.id and m.eliminado = 0");
        $bimoneda = $consulta[0]->bimoneda;
        $monedaBase = $consulta[0]->idMoneda;

        $fecha = $result[0]->fecha;
        $proveedor = $result[0]->nombre;
        $moneda_id = $result[0]->idMoneda;
        $abreviatura = $result[0]->abreviatura;
        $nombre_moneda = $result[0]->moneda;
        $centro_costo = $result[0]->centro_costo;
        $centro_costo_id = $result[0]->centro_costo_id;
        $con_factura = $result[0]->con_factura;
        $aplica_impuesto = $result[0]->impuesto;
        $proveedor_id = $result[0]->proveedor_id;
        $nombre_alamacen = $result[0]->almacen;
        $id_almacen = $result[0]->id_almacen;

        return view('compras.recepcionCompra', compact(['idcompra', 'con_factura', 'aplica_impuesto', 'idrecepcion',
            'fecha', 'proveedor_id', 'proveedor', 'moneda_id', 'abreviatura', 'nombre_moneda', 'bimoneda', 'monedaBase',
            'centro_costo', 'centro_costo_id', 'nombre_alamacen', 'id_almacen']));
    }

    public function recepcionCompra()
    {
        return view('compras.listarOrdenCompra');
    }

    public function RecepcionUsuario()
    {
        return view('ReporteListado.reportDetalleRecepcionPorUsuario');
    }

    public function detallerecepcionporusuario()
    {
        return view('ReporteListado.reportDetalleRecepcionCualquierUsuario');
    }

    public function prueba_factura()
    {
//        $importe = 1506.45;
//        $monto_literal = new \EnLetras();
//        $literal = $monto_literal->ValorEnLetras($importe,' ');
//        echo $literal;
        return view('factura_prueba');
    }

    public function ver_lista_apertura(){
        $users = DB::table('empleado')
            ->select('empleado.id','empleado.nombre')
            ->join('usuario', 'empleado.id', '=','usuario.idEmpleado')
            ->where('empleado.eliminado', get_state('activo'))->get();
        return view('Reporte.lista_cierre_caja', compact('users'));
    }
}
