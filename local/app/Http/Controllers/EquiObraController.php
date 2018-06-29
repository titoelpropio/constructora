<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\EquiObraRequest;
use DB;
use App\EquiObra;
use Session;
use Redirect;
class EquiObraController extends Controller
{ 
 
function index(){
	$equipo = DB::select('select *from equipo where deleted_at IS NULL');      
	$obra = DB::select('select *from obra where deleted_at IS NULL');      
     return view('EquiObra.EquiObra',compact('equipo','obra'));
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('EquiObra.create');		
  }
    else{
       return redirect('/EquiObra')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        EquiObra::create([
          'id_obra' => $request['obra'],
          'id_equipo' => $request['equipo'],
          'cantidad' => $request['cantidad'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $EquiObra= EquiObra::find($id);
    $EquiObra->fill([
      'id_obra' => $request['obra'],
      'id_equipo' => $request['equipo'],
      'cantidad' => $request['cantidad'],
      'precio' => $request['precio']
    ]);
    $EquiObra->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from equi_obra where id='.$id);
      return response()->json($result);
  }

function listarEquiObra()
{
  $result=DB::select('select equi_obra.id, equipo.nombre as equipo, obra.nombre as obra, equi_obra.precio, equi_obra.cantidad from equi_obra,equipo,obra where equi_obra.id_obra=obra.id and equipo.id=equi_obra.id_equipo and   equi_obra.deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $EquiObra=EquiObra::find($id);
      $EquiObra->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
