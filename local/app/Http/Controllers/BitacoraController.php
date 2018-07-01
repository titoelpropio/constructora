<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Bitacora;
use App\Http\Requests;
use Auth;
use Session;
class BitacoraController extends Controller {

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
       $result= DB::select('select * from bitacora where idobjeto='.$request['idObjeto']);
       if (count($result) ==0) {
        $cantidad=1;
           DB::table('bitacora')->insert(['cantidad' => $cantidad,
            'iduser' => Session::get('idusuario'),
            'idobjeto' => $request['idObjeto']
        ]);
       }else{
         $cantidad=$result[0]->cantidad+1;
         $actua = DB::table('bitacora')->where('idobjeto', $request['idObjeto'])->update([
            'cantidad' => $cantidad
        ]);
       }
        
        return response()->json($cantidad);
    }

// 
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
        $dato = Bitacora::find($id);
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
        $actua = DB::table('Bitacora')
                ->where('id', $id)
                ->update(['nombre' => $request->nombre,
           'fecha_nac' => $request->fechaNacimiento,
            'apellido' => $request->apellido,
            'genero' => $request->genero,
            'celular' => $request->celular,
            'docIdentidad' => $request->docIdentidad]);
        return response()->json(["actualizado" => $request->all()]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $actua = DB::table('Bitacora')->where('id', $id)->update(['eliminado' => 1]);
        $unsuario = DB::table('usuario')->where('idBitacora', $id)->update(['eliminado' => 1]);
        return response()->json(["mensaje" => "listo"]);
    }

    public function listarBitacoras() {
        $otro = DB::table('Bitacora')->select( 'Bitacora.nombre', 'Bitacora.genero', 'Bitacora.docidentidad',  'Bitacora.id')
                ->where('Bitacora.eliminado', 0)
                ->get('nombre', 'genero', 'docIdentidad', 'id');
        return response()->json($otro);
    }

//    public function listarBitacorasresporte() {
//        $otro = $results = DB::select("SELECT id,nombre from Bitacora WHERE Bitacora.eliminado=0 and Bitacora.nombre<> 'admin'
// ");
//        return response()->json($otro);
//    }

    public function listarBitacorasresporte() {
        $otro = $results = DB::select("SELECT id,nombre from Bitacora,usuario WHERE Bitacora.eliminado=0
            AND Bitacora.id = usuario.idBitacora
 ");
        return response()->json($otro);
    }

    

}
