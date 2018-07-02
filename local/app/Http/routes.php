
<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
//mano de obra obra

Route::resource('MdoObra','MdoObraController');
Route::get('listarMdoObra/{id}','MdoObraController@listarMdoObra');
//Herramienta Obra

Route::resource('HerraObra','HerraObraController');
Route::get('listarHerraObra/{id}','HerraObraController@listarHerraObra');
//Equipo Obra

Route::resource('EquiObra','EquiObraController');
Route::get('listarEquiObra/{id}','EquiObraController@listarEquiObra');

//Herramienta

Route::resource('Herramienta','HerramientaController');
Route::get('listarHerramienta','HerramientaController@listarHerramienta');
//Equipo

Route::resource('ManoObra','ManoObraController');
Route::get('listarManoObra','ManoObraController@listarManoObra');

//Equipo

Route::resource('Equipo','EquipoController');
Route::get('listarEquipo','EquipoController@listarEquipo');

//Material Obra
Route::resource('MaterialObra','MaterialObraController');
Route::get('listarMaterialObra/{id}','MaterialObraController@listarMaterialObra');
//Equipo

Route::resource('Material','MaterialController');
Route::get('listarMaterial','MaterialController@listarMaterial');

//obra

Route::resource('Obra','ObraController');
Route::get('listarobra','ObraController@listarObra');
Route::get('listardetalleobra/{id}','ObraController@listardetalleobra');

//cliente
Route::resource('cliente','ClienteController');
Route::get('buscarCliente/{ci}','ClienteController@buscarCliente');
Route::get('cargarModalCliente/{id}','ClienteController@cargarModalCliente');
Route::get('verificarCarnet/{ci}','ClienteController@verificarCarnet');


//lote
Route::get('cargar_lote/{punto}','LoteController@cargar_lote');
Route::get('buscarLote/{point}','LoteController@buscarLote');



Route::resource('Lote','LoteController');
Route::get('guardarLote','LoteController@storeLote');
Route::get('ModificarLote/{id}','LoteController@updateLote');



Route::get('reservas/lotes','ReservaController@reserva_lotes');
//busca por fecha
Route::get('buscar_reserva/{fecha}','ReservaController@buscar_reserva');
Route::get('buscar_reserva_ci/{ci}','ReservaController@buscar_reserva_ci');
Route::resource('anularReserva','ReservaController@anularReserva');
// Route::get('buscar_lote/{nro_lote}/{nro_manzano}','ReservaController@buscar_lote');


//seccion
Route::get('seccion1/{opcion}','PreReservaController@seccion1');//opcion1 = reserva opcion2=registro lote opcion3=venta lote
Route::get('seccion2/{opcion}','PreReservaController@seccion2');//opcion1 = reserva opcion2=registro lote opcion3=venta lote
Route::get('seccion3/{opcion}','PreReservaController@seccion3');//opcion1 = reserva opcion2=registro lote opcion3=venta lote
Route::get('seccion1b/{opcion}','PreReservaController@seccion1b');

//
Route::resource('reserva','ReservaController');
Route::get('listarperfilobjeto/{id}', 'PerfilobjetoController@listarperfilobjeto');

Route::resource('Perfilobjeto', 'PerfilobjetoController');

//manzano
Route::resource('manzano','ManzanoController');
Route::get('cargar_manzano/{id}','ManzanoController@cargar_manzano');


//usuario 
Route::resource('Usuario','UsuarioController');



//DescuentoVenta 
/*Route::resource('descuentoVenta','DescuentoVentaController');
Route::get('verificarDescuento/{dato}/{id}','DescuentoVentaController@verificarDescuento');*/

Route::get('listarempleados', 'EmpleadoController@listarempleados');

Route::get('listarusuario/{id}', 'UsuarioController@listarusuario');
Route::get('listarempleadosreporte', 'EmpleadoController@listarempleadosresporte');
//ventas
Route::get('listarobjeto', 'ObjetoController@listarobjeto');

Route::resource('Modulo', 'ModuloController');


Route::resource('venta_reserva','VentaController@store_venta_reserva');
Route::resource('lista/ventas','VentaController');
Route::resource('venta_lote','VentaController');
Route::get('vender','VentaController@vender');
    Route::get('AddEmpleado', 'FrontController@nuevoempleado');

Route::get('ObtenerVenta/{idVenta}','VentaController@ObtenerVenta');
Route::get('obtenerModulo/{modulo}', 'ConfiguracionController@obtenerModulo');
Route::resource('Objeto', 'ObjetoController');
Route::resource('Cliente', 'ClienteController');
    Route::get('Gestionarcliente', 'FrontController@GestionarTipoCliente');
//perfil
Route::resource('Perfil', 'PerfilController');
//bitagora
Route::get('Bitacora', 'BitacoraController@store');
// Route::get('vender_lote/{opcion}','VentaController@vender_lote');
//empleado
 Route::get('Gestionarempresa', 'FrontController@Gestionarempresa');
    Route::get('Empleados', 'FrontController@vistaempleado');
//seguridad
Route::resource('Empleado','EmpleadoController');

Route::get('Gestionarturno', 'FrontController@Gestionarturno');
Route::get('GestionarModulo', 'FrontController@Gestionarmodulo');
Route::get('GestionarObjeto', 'FrontController@Gestionarobjeto');
Route::get('GestionarPerfil', 'FrontController@Gestionarperfil');
Route::get('Autorizaciones', 'FrontController@Autorizaciones');
Route::get('GestionarProveedor', 'FrontController@GestionarProveedor');
Route::get('GestionarPerfilObjeto/{id}', 'FrontController@Gestionarperfilobjeto');
Route::get('Gestionarcompras', 'FrontController@Gestionarcompras');
Route::post('get_perfil_id', 'PerfilController@show');
Route::get('listaperfil', 'PerfilController@listaperfil');
    Route::get('Gestionarusuario/{id}', 'FrontController@Gestionarusuario');
//TasaInteres
Route::resource('tasaInteres','TasaInteresController');
Route::get('cargarModalTasaInteres/{id}','TasaInteresController@cargarModalTasaInteres');

//Plazo
Route::resource('plazo','PlazoController');
Route::get('cargarModalPlazo/{id}','PlazoController@cargarModalPlazo');

//TiempoEspera
Route::resource('tiempoespera','TiempoEsperaController');
Route::get('cargarModalTiempoEspera/{id}','TiempoEsperaController@cargarModalTiempoEspera');

Route::get('libro_mayor','AsientoController@libro_mayor');

Route::resource('libro_diario','AsientoController@libro_diario');
//reportes de los balances
Route::get('reporte_libro_diario/{fecha1}/{fecha2}','AsientoController@reporte_libro_diario');
Route::get('reporte_libro_mayor/{fecha1}/{fecha2}','AsientoController@reporte_libro_mayor');

//login
Route::resource('/', 'LoginController');
Route::resource('index', 'TestController');
Route::resource('Login', 'LoginController@store');
Route::resource('Logout', 'LoginController@logout');
Route::get('listarmodulo', 'ModuloController@listarmodulo');

//------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------  FIN MODULO CONTABLE  ---------------------------------------------------------//
//------------------------------------------------------------------------------------------------------------------------------//