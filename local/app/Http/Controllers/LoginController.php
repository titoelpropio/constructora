<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\User;
use Auth;
use Session;
use Redirect;
use DB;
use Crypt;
use Illuminate\Contracts\Encryption\DecryptException;

class LoginController extends Controller {

    function index() {
        if (Session::get('user')!=null) {
        return view('index');
    
       }else{
        return view('Layouts.Log');}
    }

    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

        $email= strtolower($request['email']);
        $password= strtolower($request['password']);
        $users=DB::select("select empleado.nombre,empleado.apellido,empleado.id as idEmpleado, perfil.id as idperfil, perfil.nombre as nombreperfil from empleado,users,perfil where  empleado.id=users.idempleado and users.idperfil=perfil.id and empleado.deleted_at IS NULL and users.email='$email'");

//         $users = DB::table('users')
//  ->select('empleado.nombre','empleado.apellido','empleado.id as idEmpleado','perfil.id as idPerfil','perfil.nombre as nombreperfil')
//  ->join('empleado', 'empleado.id', '=', 'users.idEmpleado')
//     ->join('perfil', 'perfil.id', '=', 'users.idPerfil')
//  ->where('users.email',$email,'empleado.deleted_at')
// ->get();
        foreach ($users as $user) {
          $nombre=$user->nombre;
          $idempleado=$user->idempleado;
          $idPerfil=$user->idperfil;
          $nombreperfil=$user->nombreperfil;
          $apellido=$user->apellido;
        }

    if ($users== null){

        Session::flash('message',count($users));
       return    redirect('/');
        }
        else{

        Session::put('user', $users);   

        Session::put('nombre', $nombre);
        Session::put( 'apellido',$apellido);
       
        Session::put('idEmpleado', $idempleado);
        Session::put('idPerfil', $idPerfil);
        Session::put('nombrePerfil', $nombreperfil);
        }
        
        if (Auth::attempt(['email' =>$email, 'password' =>$password])) {
           return    redirect('/Empleados');
         
        }
//        $sesion=Auth::user();
//        Session::flash('message-error', 'Datos Incorrectos');
              Session::put('user', null); 
        Session::flash('message', 'Datos Incorrectos');
        return Redirect::to('/Empleado');
//        return response()->json(['messaje', $password]);
//        if($sesion!=null){
//          return response()->json(['messaje','no es null']);  
//        }
// else {return response()->json(['messaje','no es null']); }
//          $email= $request['email'];
//        $password= $request['password'];
//        if (Auth::loginUsingId(1)==false) {
////            return Redirect::to('galpon');
//            return response()->json(['messaje',Auth::loginUsingId(1)]);
//        }
      
    }

    public function logout() {
          Session::put('user', null);  
        return Redirect::to('/');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

}
