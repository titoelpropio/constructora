<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests;
use App\Http\Requests\UserCreateRequest;
use App\Http\Requests\UserUpdateRequest;
use Session;
use Redirect;
use DB;
use Hash;

class UsuarioController extends Controller
{    
	/*public function __construct() {
         $this->middleware('auth');
         $this->middleware('admin');
        $this->middleware('auth',['only'=>'admin']);
    }*/

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::paginate(5);
        return view('usuario.index',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('usuario.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
        DB::table('users')->insert(['idempleado'=>$request['id'],'idperfil'=>$request['perfils'],'email'=>$request['email'],'password'=>$request['password'],'password'=>Hash::make($request['password'])]);
        //        DB:table('users')->insert(['name'=>$request->name,'email'=>$request->email,'password'=>Hash::make($request->password)]);
 return response()->json(['mensaje'=>'USUARIO CREADO CORRECTAMENTE']);
      //  return Redirect::to('Empleado');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user=User::find($id);
        return view('usuario.edit',['user'=>$user]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UserUpdateRequest $request, $id)
    {
        $this->user->fill($request->all());
        $this->user->save();
        Session::flash('message','USUARIO ACTUALIZADO CORRECTAMENTE');
        return Redirect::to('/usuario');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
          $user = User::find($id);
          $user->delete();
          User::destroy($id);
          return response()->json($id); 
          /*Session::flash('message','USUARIO ELIMINADO CORRECTAMENTE');
          return Redirect::to('/usuario'); */
    }
    public function listarusuario($id)
    {
        $productos = DB::table('users')->select( 'users.email', 'users.password',
            'users.urlfoto', 'perfil.id as perfil',
            'empleado.nombre as empleado')
            ->join('empleado', 'empleado.id', '=', 'users.idempleado')
            ->join('perfil', 'perfil.id', '=', 'users.idperfil')
            ->where('users.idempleado', $id)->first("email", "email", "password", "urlFoto", "fechainicio", "fechafin",  "perfil", "empleado");
        return response()->json($productos);
    }
}
