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
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {

                $peliculas = pelicula::selectRaw('pelicula.titulo, pelicula.id, date_format(proyeccion.horario_inicio, "%Y-%m-%d") horario')
                ->join("proyeccion", "proyeccion.pelicula_id" , '=' , 'pelicula.id')
                ->whereRaw("proyeccion.horario_inicio >= now()")
                ->groupBy('pelicula.titulo' , 'horario', 'pelicula.id')
                ->orderBy('horario', 'asc' , 'pelicula.titulo')
                ->limit( $params_array["cantidad"] )
                ->get();
                $ultimapelicula = '';
                $ultimoHorario = '';    
                foreach ( $peliculas as $pelicula ){

                    $result = $this->formatoFecha($pelicula->horario);
                    $horas = proyeccion::select('proyeccion.horario_inicio')
                    ->whereRaw("date_format(proyeccion.horario_inicio , '%Y-%m-%d' ) ='$result' and proyeccion.pelicula_id = $pelicula->id")
                    ->get();
                    $cantidad = sizeof($horas);
                    // echo $horas . "<br>";
                    $arrFunciones = array();
                    foreach ( $horas as $horaProyeccion ){
                        $horario_inicio = $horaProyeccion->horario_inicio;
                        $arrFunciones[] = date('H:i',strtotime($horaProyeccion->horario_inicio));
                    }
                    $proyecciones[]= array(
                        "titulo" => $pelicula->titulo,
                        "fechaProyeccion" => date('Y-m-d' ,strtotime($horario_inicio)),
                        "idPelicula" => $pelicula->id,
                        "funciones" => $arrFunciones
                    );
                }

                $data = array(
                    "code" => 200,
                    "status" => "success",
                    "proyecciones" => $proyecciones
                );


            }

        } else {
            $data = [
                'code'    => 400,
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
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {
                $fecha = $this->formatoFecha($params_array["fechaProyeccion"], 'Y-m-d');
                /** 
                 * $hora = date('H:i');
                *  echo $hora;
                *  die();
                **/
                $peliculas = proyeccion::selectRaw('pelicula.titulo, proyeccion.horario_inicio, proyeccion.id as idProyeccion,
                case when count(asientos.id) = count(asientos_ocupados.asientos_id) then false else true end disponibilidadAsientos,
                case when ADDTIME( proyeccion.horario_inicio, "00:30:00" ) > now() then true else false end disponibilidadHora ')
                ->join('pelicula' , 'pelicula.id' , '=' , 'proyeccion.pelicula_id')
                ->join('sala' , 'sala.id' , '=' , 'proyeccion.sala_id' )
                ->join('asientos' , 'asientos.sala_id' , '=' , 'sala.id' )
                ->leftJoin('asientos_ocupados' , 'asientos_ocupados.asientos_id' , '=' , 'asientos.id')
                ->whereRaw("date_format(proyeccion.horario_inicio , '%Y-%m-%d' ) = '$fecha'")
                ->groupBy('pelicula.titulo' , 'proyeccion.horario_inicio', 'idProyeccion')
                ->get();
                
                foreach ( $peliculas as $pelicula ){
                    if ( $pelicula->disponibilidadAsientos == 1 ) {
                        if ( $pelicula->disponibilidadHora == 1 ) {
                            $disponibilidad = true;
                        }else{
                            $disponibilidad = false;
                        }
                    } else {
                        $disponibilidad = false;
                    }
                    $dataPeliculas[] = [
                        'titulo'         => $pelicula->titulo,
                        'idProyeccion'   => $pelicula->idProyeccion,
                        'funcion'        => date( 'H:i' , strtotime( $pelicula->horario_inicio ) ),
                        'disponibilidad' => $disponibilidad
                    ];
                }
                $dataPeliculas = ( empty($dataPeliculas) ) ? 'No hay Proyecciones para esa fecha' : $dataPeliculas;
                $data = [
                    'code'   => 200,
                    "status" => "success",
                    "proyecciones_data" =>  $dataPeliculas
                ];
                
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

    public function getResumen( Request $request ) {
        $params_array = [
            "idBoleta" => $request["idBoleta"]
        ];
        if ( !empty($params_array ) ){
            $validate = \Validator::make($params_array,[
        		"idBoleta" => 'required|integer'
            ]);

            if( $validate->fails() ){
                $data = [
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {               
                $resumen = boleta::selectRaw('boleta.asiento, productos.nombre, productos.costo, boleta_productos.cantidad,productos.costo * boleta_productos.cantidad total,
                proyeccion.horario_inicio, pelicula.titulo')
                ->join('boleta_productos', 'boleta.id',  '=' , 'boleta_productos.boleta_id')
                ->join('productos' , 'productos.id' , '=' ,'boleta_productos.producto_id')
                ->join('proyeccion', 'proyeccion.id', '=' , 'boleta.proyeccion_id')
                ->join('pelicula' , 'pelicula.id' , '=' , 'proyeccion.pelicula_id')
                ->where('boleta_id' , $params_array["idBoleta"])
                ->get();
                foreach ( $resumen as $datos ) {
                    $arrConfiteria[] = [
                        'nombreProducto'  => $datos->nombre,
                        'precio'          => $datos->costo,
                        'cantidad'        => $datos->cantidad,
                        'totalProducto'   => $datos->total
                    ];
                    $arrResumen ['resumen']= [
                        'pelicula'   =>  $datos->titulo,
                        'fecha'      =>  date('Y-m-d' , strtotime( $datos->horario_inicio ) ),
                        'funcion'    =>  date('H:i' , strtotime( $datos->horario_inicio ) ),
                        'puesto'     => $datos->asiento,
                        'confiteria' => $arrConfiteria
                    ];
                }

                $data = [
                    'code'   => 200,
                    "status" => "success",
                    "proyecciones" => $arrResumen
                ];
            }            

        } else {
            $data = [
                'code'    => 400,
                'status'  => 'error',
                'message' => 'Data not fonund'
            ];
        }

        return response()->json($data,$data["code"]);
    }

    // Funciones personalizadas
    private function formatoFecha( $fecha ){
        $date = new DateTime( $fecha );
        return $result = $date->format('Y-m-d');
    }
}
