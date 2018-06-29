<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\HerraObraRequest;
use DB;
use App\HerraObra;
use Session;
use Redirect;
class HerraObraController extends Controller
{ 
 
function index(){
	$herramienta = DB::select('select *from herramienta where deleted_at IS NULL');      
	$obra = DB::select('select *from obra where deleted_at IS NULL');      
     return view('HerraObra.HerraObra',compact('herramienta','obra'));
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('HerraObra.create');		
  }
    else{
       return redirect('/HerraObra')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        HerraObra::create([
          'id_obra' => $request['obra'],
          'id_herramienta' => $request['herramienta'],
          'cantidad' => $request['cantidad'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $HerraObra= HerraObra::find($id);
    $HerraObra->fill([
      'id_herramienta' => $request['herramienta'],
      'id_obra' => $request['obra'],
      'cantidad' => $request['cantidad'],
      'precio' => $request['precio']
    ]);
    $HerraObra->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from herra_obra where id='.$id);
      return response()->json($result);
  }

function listarHerraObra()
{
  $result=DB::select('select herra_obra.id, herramienta.nombre as herramienta, obra.nombre as obra, herra_obra.precio, herra_obra.cantidad from herra_obra,herramienta,obra where herra_obra.id_obra=obra.id and herramienta.id=herra_obra.id_herramienta and   herra_obra.deleted_at IS NULL');
  return response()->json($result);
}
  public function destroy($id){
      $HerraObra=HerraObra::find($id);
      $HerraObra->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
}
