<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\EquipoRequest;
use DB;
use App\Equipo;
use Session;
use Redirect;
class EquipoController extends Controller
{ 
 
function index(){
     return view('Equipo.Equipo');
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('Equipo.create');		
  }
    else{
       return redirect('/Equipo')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        Equipo::create([
          'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion'],
          'precio_uso' => $request['preciouso']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $Equipo= Equipo::find($id);
    $Equipo->fill([
      'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion'],
          'precio_uso' => $request['precio_uso']
    ]);
    $Equipo->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from equipo where id='.$id);
      return response()->json($result);
  }

function listarEquipo()
{
  $result=DB::select('select*from equipo where deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $Equipo=Equipo::find($id);
      $Equipo->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
