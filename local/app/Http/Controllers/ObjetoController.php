<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Objeto;
use DB;
use Session;
use Redirect;
use App\Http\Requests;

class ObjetoController extends Controller {
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
        DB::table('objeto')->insert(['nombre' => $request->nombre,
            'tipoobjeto' => $request->tipoObjeto,
            'urlobjeto' => $request->urlObjeto,
            'estado' => $request->habilitado,
            'eliminado' =>0,
            'visiblemenu' => $request->visibleEnMenu,
            'idmodulo' => $request->modulo
        ]);
        $ultimo = DB::table('objeto')->select('id')->orderby('id', 'DESC')->take(1)->get('id');
        $objeto;
        foreach ($ultimo as $ultimo) {
            $objeto = $ultimo->id;
        }
        $perfiles = DB::table('perfil')->select('id')->where('eliminado', 0)->get('id');
        foreach ($perfiles as $perfiles) {
            $perfiles = $perfiles->id;
            DB::table('perfilobjeto')->insert(['idperfil' => $perfiles,
                'idobjeto' => $objeto,
                'puedeguardar' => 1,
                'puedemodificar' => 1,
                'puedeeliminar' => 1,
                'puedelistar' => 1,
                'puedeverreporte' => 1]);
        }
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
    public function edit($id) {
        $dato = Objeto::find($id);
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
        $actua = DB::table('objeto')->where('id', $id)->update(['nombre' => $request->nombre, 'tipoobjeto' => $request->tipoObjeto, 'urlobjeto' => $request->urlObjeto, 'estado' => $request->habilitado, 'visiblemenu' => $request->visibleEnMenu, 'idmodulo' => $request->modulo]);
        return response()->json(["mensaje" => "listo"]);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $actua = DB::table('objeto')->where('id', $id)->update(['eliminado' => 1]);
        DB::table('perfilobjeto')->where('idobjeto', $id)->delete();
        return response()->json(["mensaje" => "listo"]);
    }

    public function listarobjeto() {
        $actua = DB::table('objeto')->select('objeto.id', 'objeto.estado','objeto.nombre', 'objeto.tipoobjeto', 'modulo.nombre as nommodulo','visiblemenu')
                        ->join('modulo', 'modulo.id', '=', 'objeto.idmodulo')->get('id', 'nombre', 'tipoObjeto', 'habilitado', 'visiblemenu', 'nommodulo','estado');

        return response()->json($actua);
    }

}
