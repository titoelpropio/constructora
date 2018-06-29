<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\ObraRequest;
use DB;
use App\Obra;
use Session;
use Redirect;
class ObraController extends Controller
{ 
 
  function index(){
   return view('Obra.Obra');
 }
 
 public function create(){
  if ($this->puedeGuardar==1) {
    return view('Obra.create');		
  }
  else{
   return redirect('/Obra')->with('message-error','No tiene privilegios para guardar');  
 }
}

public function store(Request $request){
  Obra::create([
    'nombre' => $request['nombre'],
    'descripcion' => $request['descripcion'],
    'presupuesto' => $request['presupuesto'],
    'duracion' => $request['duracion']
  ]);
  return response()->json(["mensaje" => "listo"]);
  
}
public function update(Request $request,$id){
  $Obra= Obra::find($id);
  $Obra->fill([
    'nombre' => $request['nombre'],
    'descripcion' => $request['descripcion'],
    'presupuesto' => $request['presupuesto'],
    'duracion' => $request['duracion']
  ]);
  $Obra->save();
  return response()->json(["mensaje" => "listo"]);
}

public function edit($id){
 $result=DB::select('select *from obra where id='.$id);
 return response()->json($result);
}

function listarObra()
{
  $result=DB::select('select*from obra where deleted_at IS NULL');
  return response()->json($result);
}
public function destroy($id){
  $Obra=Obra::find($id);
  $Obra->delete();
  return response()->json(["mensaje" => "Eliminado Correctamente"]);
}
}
