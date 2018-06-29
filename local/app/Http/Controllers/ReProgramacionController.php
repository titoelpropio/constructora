<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use Redirect;
use DB;
use Hash;

class ReProgramacionController extends Controller {

    public function __construct() {
//        $this->middleware('auth');
//        $this->middleware('admin');
//        $this->middleware('auth', ['only' => 'admin']);
    }

    function index() {
 $resultado2=array();
        $resultado=DB::select("SELECT cliente.expedido,venta.id as idVenta,DATE_FORMAT(venta.fecha,'%d/%m/%Y %H:%i:%s') AS fecha,venta.totalaPagar,venta.precio,venta.estado as estado_venta, empleado.ci as ci_empleado,CONCAT(empleado.nombre,' ',empleado.apellido)as empleado,cliente.nombre as nombreCliente,cliente.apellidos as apellidoCliente,cliente.ci as ci_cliente,cliente.celular,cliente.celular_ref,proyecto.nombre as nombreProyecto, categorialote.categoria,categorialote.descripcion, lote.nroLote,lote.manzano,lote.superficie,lote.uv,lote.matricula,lote.estado as estado_lote, preciocategoria.precio as precio_categoria from venta,empleado,cliente,lote,categorialote,proyecto,preciocategoria WHERE venta.idEmpleado=empleado.id AND venta.idCliente=cliente.id AND lote.id=venta.idLote AND categorialote.id=lote.idCategoriaLote AND venta.estado='r' and proyecto.id=categorialote.idProyecto and venta.fecha and  preciocategoria.idCategoria=categorialote.id AND preciocategoria.deleted_at IS NULL order by venta.fecha ");
        for ($i=0; $i <count($resultado) ; $i++) { 
            $resultado2[$i]=DB::select("SELECT (Cuotas.TotalCuotas-sum(detallecuota.monto)) debe,Cuotas.TotalCuotas,sum(detallecuota.monto) as montoTotal, (sum(detallecuota.monto) + venta.totalaPagar) as total,  cliente.expedido,venta.id as idVenta,DATE_FORMAT(venta.fecha,'%d/%m/%Y %H:%i:%s') AS fecha,venta.totalaPagar as cuotaInicial,venta.precio,venta.estado as estado_venta, empleado.ci as ci_empleado,CONCAT(empleado.nombre,' ',empleado.apellido)as empleado,cliente.nombre as nombreCliente,cliente.apellidos as apellidoCliente,cliente.ci as ci_cliente,cliente.celular,cliente.celular_ref,proyecto.nombre as nombreProyecto, categorialote.categoria,categorialote.descripcion, lote.nroLote,lote.manzano,lote.superficie,lote.uv,lote.matricula,lote.estado as estado_lote, preciocategoria.precio as precio_categoria
from cuotas,detallecuota,plandepago,venta,empleado,cliente,lote,categorialote,proyecto,preciocategoria,(select sum(cuotas.monto) as TotalCuotas, sum(detallecuota.monto) as montoTotal,venta.id as idVentaC
 from cuotas,detallecuota,plandepago,venta
 where venta.id=plandepago.idVenta and plandepago.id=cuotas.idPlandePago and cuotas.id=detallecuota.idCuota and DATE_FORMAT(venta.fecha,'%Y-%m-%d') >= DATE_FORMAT(NOW(),'%Y-%m-%d')  and   venta.id=".$resultado[$i]->idVenta.")  Cuotas
WHERE venta.id=plandepago.idVenta and plandepago.id=cuotas.idPlandePago and cuotas.id=detallecuota.idCuota and venta.idEmpleado=empleado.id AND venta.idCliente=cliente.id AND lote.id=venta.idLote AND categorialote.id=lote.idCategoriaLote and proyecto.id=categorialote.idProyecto AND  preciocategoria.idCategoria=categorialote.id   and venta.id=".$resultado[$i]->idVenta." AND preciocategoria.deleted_at IS NULL order by venta.fecha limit 20");

        }

        return view('reprogramacion.index', compact('resultado2', $resultado2));
    }

    public function create() {
  
    }

    public function store(Request $request) {

      

    }

    public function edit($id) {

       
    }

  
    public function update($id,Request $request) {

    }

    public function destroy($id) {

   
    }
    public function listaVentaRevertida($fechaInicio,$fechaFin){
        $resultado2=array();
        $resultado=DB::select("SELECT cliente.expedido,venta.id as idVenta,DATE_FORMAT(venta.fecha,'%d/%m/%Y %H:%i:%s') AS fecha,venta.cuotaInicial,venta.precio,venta.estado as estado_venta, empleado.ci as ci_empleado,CONCAT(empleado.nombre,' ',empleado.apellido)as empleado,cliente.nombre as nombreCliente,cliente.apellidos as apellidoCliente,cliente.ci as ci_cliente,cliente.celular,cliente.celular_ref,proyecto.nombre as nombreProyecto, categorialote.categoria,categorialote.descripcion, lote.nroLote,lote.manzano,lote.superficie,lote.uv,lote.matricula,lote.estado as estado_lote, preciocategoria.precio as precio_categoria from venta,empleado,cliente,lote,categorialote,proyecto,preciocategoria WHERE venta.idEmpleado=empleado.id AND venta.idCliente=cliente.id AND lote.id=venta.idLote AND categorialote.id=lote.idCategoriaLote AND venta.estado='r' and proyecto.id=categorialote.idProyecto and venta.fecha BETWEEN DATE_FORMAT('".$fechaInicio."','%d/%m/%Y') AND DATE_SUB('".$fechaFin."',INTERVAL -1 DAY)   AND  preciocategoria.idCategoria=categorialote.id AND preciocategoria.deleted_at IS NULL order by venta.fecha limit 20");
        for ($i=0; $i <count($resultado) ; $i++) { 
            $resultado2[$i]=DB::select("SELECT sum(detallecuota.monto) as montoTotal, (sum(detallecuota.monto) + plandepago.cuotaInicialUsd) as total,  cliente.expedido,venta.id as idVenta,DATE_FORMAT(venta.fecha,'%d/%m/%Y %H:%i:%s') AS fecha,venta.cuotaInicial,venta.precio,venta.estado as estado_venta, empleado.ci as ci_empleado,CONCAT(empleado.nombre,' ',empleado.apellido)as empleado,cliente.nombre as nombreCliente,cliente.apellidos as apellidoCliente,cliente.ci as ci_cliente,cliente.celular,cliente.celular_ref,proyecto.nombre as nombreProyecto, categorialote.categoria,categorialote.descripcion, lote.nroLote,lote.manzano,lote.superficie,lote.uv,lote.matricula,lote.estado as estado_lote, preciocategoria.precio as precio_categoria ,plandepago.cuotaInicialBs
from cuotas,detallecuota,plandepago,venta,empleado,cliente,lote,categorialote,proyecto,preciocategoria,(select sum(detallecuota.monto) as montoTotal,venta.id as idVentaC from cuotas,detallecuota,plandepago,venta where venta.id=plandepago.idVenta and plandepago.id=cuotas.idPlandePago and cuotas.id=detallecuota.idCuota)  Cuotas
WHERE venta.id=plandepago.idVenta and plandepago.id=cuotas.idPlandePago and cuotas.id=detallecuota.idCuota and venta.idEmpleado=empleado.id AND venta.idCliente=cliente.id AND lote.id=venta.idLote AND categorialote.id=lote.idCategoriaLote and proyecto.id=categorialote.idProyecto AND  preciocategoria.idCategoria=categorialote.id and venta.id=".$resultado[$i]->idVenta." AND preciocategoria.deleted_at IS NULL order by venta.fecha limit 20");

        }

        return response()->json($resultado2);
    }

    public function reprogramar($idVenta){
        $resultado=DB::select('select venta.idCliente, venta.id,(sum(detallecuota.monto)+plandepago.cuotaInicialUsd),plandepago.id as idPlanpago from plandepago,venta,cuotas,detallecuota where venta.id=plandepago.idVenta and plandepago.id=cuotas.idPlandePago
and detallecuota.idCuota=cuotas.id and venta.id='.$idVenta);
         return view('reprogramacion.venta', compact('resultado2', $resultado2));
        
    }
   
}
