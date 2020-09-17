<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use DateTime;

// Modelos
use App\proyeccion;
use App\pelicula;
use App\Boleta;

class ProyeccionController extends Controller
{
    

    public function getProyecciones( Request $request ) {
        $params_array = [
            "cantidad" => $request["cantidad"]
        ];
        if (  !empty( $params_array ) ) {
            $validate = \Validator::make($params_array , [
                "cantidad" => "required|integer"
            ]);
            if ( $validate->fails() ) {
                $data = [
                    'code'    => 400,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {
                $peliculas = pelicula::selectRaw('pelicula.id, pelicula.titulo, pelicula.imagen, date(pr.horario_inicio) fechaFuncion, time(pr.horario_inicio) horaFuncion, adddate(pr.horario_inicio, interval 15 minute)  hora_inicio, (select count(*) from boleta where proyeccion_id = pr.id) boletasVendidas, s.capacidad ')
                ->join("proyeccion as pr", "pr.pelicula_id" , '=' , 'pelicula.id')
                ->join("sala as s", "s.id","=","pr.sala_id")
                ->whereRaw('pr.horario_inicio >= now()')
                ->limit($params_array["cantidad"])
                ->get();
                
                foreach ( $peliculas as $pelicula ){
                    $funcionDisponible = '';
                    if ($pelicula->boletasVendidas >= $pelicula->capacidad || strtotime($pelicula->hora_inicio) <= strtotime(date("d-m-Y H:i:00",time()))) {
                        $funcionDisponible = 'Función no tiene asientos disponibles';
                    }
                    $proyecciones[]= array(
                        "idPelicula"        => $pelicula->id,
                        "titulo"            => $pelicula->titulo,
                        "fechaProyeccion"   => $pelicula->fechaFuncion,
                        "horaFuncion"       => $pelicula->horaFuncion,
                        "imagen"            => $pelicula->imagen,
                        'funcionDisponible' => $funcionDisponible
                    );
                }
                if (!isset($proyecciones)) {
                    $data = array(
                        "code" => 200,
                        "status" => "success",
                        "message" => "No hay proyecciones disponibles"
                    );
                } else{
                    $data = array(
                        "code" => 200,
                        "status" => "success",
                        "message" => "Proyecciones disponibles",
                        "proyecciones" => $proyecciones
                    );
                }



            }

        } else {
            $data = [
                'code'    => 404,
                'status'  => 'error',
                'message' => 'Data not fonund'
            ];
        }

        
        return response()->json($data,$data["code"]);

    }

    public function getProyeccion ( Request $request ) {
        $params_array = [
            'fechaProyeccion' => $request['fechaProyeccion']
        ];
        if( !empty( $params_array ) ){
            $validate = \Validator::make($params_array,[
        		"fechaProyeccion" => 'required|date'
            ]);
            if( $validate->fails() ){
                $data = [
                    'code'    => 400,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {

                $peliculas = pelicula::selectRaw('pelicula.id, pelicula.titulo, pelicula.imagen, date(pr.horario_inicio) fechaFuncion, time(pr.horario_inicio) horaFuncion, adddate(pr.horario_inicio, interval 15 minute)  hora_inicio, (select count(*) from boleta where proyeccion_id = pr.id) boletasVendidas, s.capacidad ')
                ->join("proyeccion as pr", "pr.pelicula_id" , '=' , 'pelicula.id')
                ->join("sala as s", "s.id","=","pr.sala_id")
                ->whereDate('pr.horario_inicio', $params_array["fechaProyeccion"])
                ->get();
                
                foreach ( $peliculas as $pelicula ){
                    $funcionDisponible = '';
                    if ($pelicula->boletasVendidas >= $pelicula->capacidad || strtotime($pelicula->hora_inicio) <= strtotime(date("d-m-Y H:i:00",time()))) {
                        $funcionDisponible = 'Función no disponible';
                    }
                    $proyecciones[]= array(
                        "idPelicula"        => $pelicula->id,
                        "titulo"            => $pelicula->titulo,
                        "fechaProyeccion"   => $pelicula->fechaFuncion,
                        "horaFuncion"       => $pelicula->horaFuncion,
                        "imagen"            => $pelicula->imagen,
                        'funcionDisponible' => $funcionDisponible 
                    );
                }
                if (!isset($proyecciones)) {
                    $data = array(
                        "code" => 200,
                        "status" => "success",
                        "message" => "No hay proyecciones disponibles"
                    );
                } else{
                    $data = array(
                        "code" => 200,
                        "status" => "success",
                        "message" => "Proyecciones disponibles",
                        "proyecciones" => $proyecciones
                    );
                }
            }


        } else { 
            $data = array(
                'code'    => 400,
                'status'  => 'error',
                'message' =>"Data not found"
            );
        }

        return response()->json($data,$data["code"]);

    }

    // Funciones personalizadas
    private function formatoFecha( $fecha ){
        $date = new DateTime( $fecha );
        return $result = $date->format('Y-m-d');
    }
}
