<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\ManoObraRequest;
use DB;
use App\ManoObra;
use Session;
use Redirect;
class ManoObraController extends Controller
{ 
 
function index(){
     return view('ManoObra.ManoObra');
	}
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('ManoObra.create');		
  }
    else{
       return redirect('/ManoObra')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        ManoObra::create([
          'nombre' => $request['nombre'],
          'pago' => $request['pago']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $ManoObra= ManoObra::find($id);
    $ManoObra->fill([
      'nombre' => $request['nombre'],
          'pago' => $request['pago']
    ]);
    $ManoObra->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from mano_de_obra where id='.$id);
      return response()->json($result);
  }

function listarManoObra()
{
  $result=DB::select('select*from mano_de_obra where deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $ManoObra=ManoObra::find($id);
      $ManoObra->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
