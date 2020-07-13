<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;
// resource para proyecciones
Route::get('/', function () {
    return view('welcome');
});

Route::post('/proyecciones' , 'ProyeccionController@getProyecciones');
Route::post('/proyeccion' , 'ProyeccionController@getProyeccion');
Route::post('/productos' , 'ProductosController@getProductos');
Route::post('/asientos' , 'AsientosController@getAsientos');
Route::post('/resumen' , 'TransaccionController@setResumen');

// dejar los asiento reservados
Route::post('/reservarAsiento' , 'AsientosController@reservarAsientos');
Route::post('/agregarasientos', 'AsientosController@crearAsientos');

// sala
Route::resource('salas', 'SalaController');

// pelicula
Route::resource('pelicula', 'PeliculaController');