<?php

namespace App;

namespace App\Http\Controllers;

use App\ConfiguracionGeneral;
use Illuminate\Http\Request;
use DB;
use Mockery\Exception;
use Session;
use Redirect;
use App\Http\Requests;

class ConfiguracionController extends Controller
{

    public function index()
    {
       return view('Configuracion.Configuracion');
    }

    public function create()
    {
        //
    }
    public function actualizartema($tema)
    {
          $actua= DB::table('configuracion')->update(['tema' =>$tema]);
           return response()->json(["mensaje" => "listo"]);
    }



}
