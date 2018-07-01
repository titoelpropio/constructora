<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\MaterialObraRequest;
use DB;
use App\MaterialObra;
use Session;
use Redirect;
class MaterialObraController extends Controller
{ 
 
function index(){
	$material = DB::select('select *from material where deleted_at IS NULL');      
	$obra = DB::select('select *from obra where deleted_at IS NULL');      
     return view('MaterialObra.MaterialObra',compact('material','obra'));
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('MaterialObra.create');		
  }
    else{
       return redirect('/MaterialObra')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        MaterialObra::create([
          'id_obra' => $request['obra'],
          'id_material' => $request['material'],
          'cantidad' => $request['cantidad'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $MaterialObra= MaterialObra::find($id);
    $MaterialObra->fill([
      'id_obra' => $request['obra'],
      'id_material' => $request['material'],
      'cantidad' => $request['cantidad'],
      'precio' => $request['precio']
    ]);
    $MaterialObra->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from mat_obra where id='.$id);
      return response()->json($result);
  }

function listarMaterialObra($id)
{
  $result=DB::select('select mat_obra.id, material.nombre as material, obra.nombre as obra, mat_obra.precio, mat_obra.cantidad from mat_obra,material,obra where mat_obra.id_obra=obra.id and material.id=mat_obra.id_material and   mat_obra.deleted_at IS NULL and obra.id='.$id);
  return response()->json($result);
}
  public function destroy($id){
      $MaterialObra=MaterialObra::find($id);
      $MaterialObra->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
  public function show($id){
      $material = DB::select('select *from material where deleted_at IS NULL');      
  $obra = DB::select('select *from obra where id='.$id);      
   return view('MaterialObra.MaterialObra',compact('material','obra'));
  }
}
