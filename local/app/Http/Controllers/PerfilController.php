<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Perfil;
use DB;
use Session;
use Redirect;
use App\Http\Requests;

class PerfilController extends Controller {

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
        $perfil_id = DB::table('perfil')->insertGetId([
            'nombre' => $request->nombre,
            'eliminado' => 0
        ]);

//        $objetos = DB::table('objeto')->select('id')->where('eliminado', 0)->get('id');
//        foreach ($objetos as $objeto) {
//            $idobjeto = $objeto->id;
//            DB::table('perfilobjeto')->insert(['idPerfil' => $perfil_id,
//                'idObjeto' => $idobjeto,
//                'puedeGuardar' => 1,
//                'puedeModificar' => 1,
//                'puedeEliminar' => 1,
//                'puedeListar' => 1,
//                'puedeVerReporte' => 1,
//                'puedeImprimir' => 1]);
//        }
        return response()->json($perfil_id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $data) {
        $perfil = Perfil::where('id','=',$data->id_perfil)->first();
        return ($perfil);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $dato = Perfil::find($id);
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
        $actua = DB::table('perfil')->where('id', $id)->update([
            'nombre' => $request->nombre
        ]);
        return response()->json(["mensaje" => "listo"]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $actua = DB::table('perfil')->where('id', $id)->update(['eliminado' => 1]);
        return response()->json(["mensaje" => "listo"]);
    }

    public function listaperfil() {
        $actua = DB::table('perfil')->select('id', 'nombre')->where('eliminado', 0)->get('id', 'nombre');
        return response()->json($actua);
    }

}
