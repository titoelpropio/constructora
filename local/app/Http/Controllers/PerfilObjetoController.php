<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Perfilobjeto;
use App\Http\Requests;

class PerfilobjetoController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        DB::table('perfilobjeto')->insert(['idperfil' => $request->idperfil, 'idobjeto' => $request->idobjeto, 'puedeguardar' => $request->guardar, 'puedemodificar' => $request->modificar, 'puedeeliminar' => $request->eliminar, 'puedelistar' => $request->listar, 'puedeverreporte' => $request->verreporte]);
        //, 'nombre', 'tipoObjeto', 'urlObjeto', 'habilitado', 'visibleEnMenu', 'idModulo',
        return response()->json($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id) {
//        $dato=Perfilobjeto::find($id);
        $dato = DB::select("SELECT perfilobjeto.id,
                        (SELECT objeto.nombre
                            FROM objeto
                            where objeto.id= perfilobjeto.idObjeto) as nombre,
                        perfilobjeto.idObjeto,
                        perfilobjeto.idperfil,
                        perfilobjeto.puedeEliminar,
                        perfilobjeto.puedeGuardar,
                        perfilobjeto.puedeListar,
                        perfilobjeto.puedeModificar,
                        perfilobjeto.puedeVerReporte
                    FROM perfilobjeto
                    WHERE perfilobjeto.id = ?
                   ", [$id]);
        return response()->json($dato);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $actua = DB::table('perfilobjeto')->where('id', $id)->update(['puedeguardar' => $request->guardar, 'puedemodificar' => $request->modificar, 'puedeeliminar' => $request->eliminar, 'puedelistar' => $request->listar, 'puedeverreporte' => $request->verreporte]);
        return response()->json(["actualizado" => $request->all()]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $actua = DB::table('perfilobjeto')->where('id', $id)->delete();

        return response()->json(["mensaje" => "listo"]);
    }

    public function listarperfilobjeto($id) {
        /*$perfilobjeto = DB::table('perfilobjeto')->select('perfilobjeto.id as idper', 'perfilobjeto.idPerfil as id', 'perfilobjeto.idObjeto as ids', 'objeto.nombre', 'perfilobjeto.puedeGuardar', 'perfilobjeto.puedeModificar', 'perfilobjeto.puedeEliminar', 'perfilobjeto.puedeListar', 'perfilobjeto.puedeVerReporte', 'perfilobjeto.puedeImprimir')
            ->join('objeto', 'objeto.id', '=', 'perfilobjeto.idObjeto')
            ->where('perfilobjeto.idPerfil', $id)
            ->get('idper', 'id', 'ids', 'nombre', 'puedeGuardar', 'puedeModificar', 'puedeEliminar', 'puedeListar', 'puedeVerReporte', 'puedeImprimir');*/
        $perfilobjeto = DB::table('perfilobjeto')->select('perfilobjeto.id as idper', 'perfilobjeto.idperfil as id', 'perfilobjeto.idobjeto as ids', 'objeto.nombre', 'perfilobjeto.puedeguardar', 'perfilobjeto.puedemodificar', 'perfilobjeto.puedeeliminar', 'perfilobjeto.puedelistar', 'perfilobjeto.puedeverreporte')
                ->join('objeto', 'objeto.id', '=', 'perfilobjeto.idobjeto')
                ->join('modulo', 'modulo.id', '=', 'objeto.idmodulo')
                ->where('perfilobjeto.idperfil', $id)
                ->get('idper', 'id', 'ids', 'nombre', 'puedeGuardar', 'puedeModificar', 'puedeEliminar', 'puedeListar', 'puedeverreporte');      
                      
        return response()->json($perfilobjeto);
    }

}
