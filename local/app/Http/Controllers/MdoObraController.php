<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\MdoObraRequest;
use DB;
use App\MdoObra;
use Session;
use Redirect;
class MdoObraController extends Controller
{ 
 
function index(){
	$mano_de_obra = DB::select('select *from mano_de_obra where deleted_at IS NULL');      
	$obra = DB::select('select *from obra where deleted_at IS NULL');      
     return view('MdoObra.MdoObra',compact('mano_de_obra','obra'));
	}
  
	public function create(){
        if ($this->puedeGuardar==1) {
    return view('MdoObra.create');		
  }
    else{
       return redirect('/MdoObra')->with('message-error','No tiene privilegios para guardar');  
    }
  }

  public function store(Request $request){
        MdoObra::create([
          'id_obra' => $request['obra'],
          'id_mano_de_obra' => $request['manoobra'],
          'cantidad' => $request['cantidad'],
          'precio' => $request['precio']
        ]);
       return response()->json(["mensaje" => "listo"]);
        
  }

  public function update(Request $request,$id){
    $MdoObra= MdoObra::find($id);
    $MdoObra->fill([
      'id_obra' => $request['obra'],
      'id_mano_de_obra' => $request['manoobra'],
      'cantidad' => $request['cantidad'],
      'precio' => $request['precio']
    ]);
    $MdoObra->save();
     return response()->json(["mensaje" => "listo"]);
  }

  public function edit($id){
     $result=DB::select('select *from mdo_obra where id='.$id);
      return response()->json($result);
  }

function listarMdoObra($id)
{
  $result=DB::select('select mdo_obra.id, mano_de_obra.nombre as mano_de_obra, obra.nombre as obra, mdo_obra.precio, mdo_obra.cantidad from mdo_obra,mano_de_obra,obra where mdo_obra.id_obra=obra.id and mano_de_obra.id=mdo_obra.id_mano_de_obra and   mdo_obra.deleted_at IS NULL and obra.id='.$id);
  return response()->json($result);
}
  public function destroy($id){
      $MdoObra=MdoObra::find($id);
      $MdoObra->delete();
      return response()->json(["mensaje" => "Eliminado Correctamente"]);
  }
  public function show($id){
      $manoobra = DB::select('select *from mano_de_obra where deleted_at IS NULL');      
  $obra = DB::select('select *from obra where id='.$id);      
   return view('MdoObra.MdoObra',compact('manoobra','obra'));
  }
}
