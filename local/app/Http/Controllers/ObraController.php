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
  $result=DB::select('select nombre,idobra  as id,sum(subtotal) as presupuesto,duracion,descripcion from presupuesto
group by presupuesto.nombre,idobra,duracion,descripcion');
  return response()->json($result);
}
public function destroy($id){
  $Obra=Obra::find($id);
  $Obra->delete();
  return response()->json(["mensaje" => "Eliminado Correctamente"]);
}
public function listardetalleobra($id){  
  $herra_obra=DB::Select('select  (herra_obra.precio*herra_obra.cantidad) as subtotal ,herra_obra.precio,herra_obra.cantidad,herramienta.nombre from herramienta,herra_obra
where  herramienta.id=herra_obra.id_herramienta and herra_obra.deleted_at IS NULL  and herra_obra.id_obra='.$id);
  $equi_obra=DB::select('select  (equi_obra.precio*equi_obra.cantidad) as subtotal ,equi_obra.precio,equi_obra.cantidad,equipo.nombre from equipo,equi_obra
where  equipo.id=equi_obra.id_equipo and equi_obra.deleted_at IS NULL  and equi_obra.id_obra='.$id);
    $mano_obra=DB::select('select  (mdo_obra.precio*mdo_obra.cantidad) as subtotal ,mdo_obra.precio,mdo_obra.cantidad,mano_de_obra.nombre from mano_de_obra,mdo_obra
where  mano_de_obra.id=mdo_obra.id_mano_de_obra and mdo_obra.deleted_at IS NULL and mdo_obra.id_obra='.$id);
        $mat_obra=DB::select('select  (mat_obra.precio*mat_obra.cantidad) as subtotal ,mat_obra.precio,mat_obra.cantidad,material.nombre from material,mat_obra
where  material.id=mat_obra.id_material and mat_obra.deleted_at IS NULL and mat_obra.id_obra='.$id);
  return response()->json(['herra_obra'=>$herra_obra,'equi_obra'=>$equi_obra,'mano_obra'=>$mano_obra,'mat_obra'=>$mat_obra]);

}
}
