<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\MaterialRequest;
use DB;
use App\Material;
use Session;
use Redirect;
class MaterialController extends Controller
{ 
 
function index(){
     return view('Material.Material');
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('Material.create');		
  }
    else{
       return redirect('/Material')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        Material::create([
          'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $Material= Material::find($id);
    $Material->fill([
      'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion'],
          'precio' => $request['precio']
    ]);
    $Material->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from material where id='.$id);
      return response()->json($result);
  }

function listarMaterial()
{
  $result=DB::select('select*from material where deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $Material=Material::find($id);
      $Material->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
