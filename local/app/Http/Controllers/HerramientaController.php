<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\HerramientaRequest;
use DB;
use App\Herramienta;
use Session;
use Redirect;
class HerramientaController extends Controller
{ 
 
function index(){
     return view('Herramienta.Herramienta');
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('Herramienta.create');		
  }
    else{
       return redirect('/Herramienta')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        Herramienta::create([
          'nombre' => $request['nombre'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $Herramienta= Herramienta::find($id);
    $Herramienta->fill([
      'nombre' => $request['nombre'],
          'precio' => $request['precio']
    ]);
    $Herramienta->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from herramienta where id='.$id);
      return response()->json($result);
  }

function listarHerramienta()
{
  $result=DB::select('select*from herramienta where deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $Herramienta=Herramienta::find($id);
      $Herramienta->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
