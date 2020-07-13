<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

//modelos
use App\proyeccion;
use App\asientos;
use App\asientos_ocupados;

class AsientosController extends Controller
{
    public function getAsientos( Request $request ) {
        $this->eliminiarReservas();
        $params_array = [
            'idProyeccion' => $request['idProyeccion'],
        ];
        if ( !empty($params_array) ){
            $validate = \Validator::make($params_array,[
        		"idProyeccion" => 'required|integer'
        	]);

            if ( $validate->fails() ){

                $data = array(
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );

            } else {
                $asientos = proyeccion::selectRaw('asientos.descripcion, sala.nombre, asientos_ocupados.asientos_id, asientos.id')
                ->join('sala' , 'sala.id' , '=' , 'proyeccion.sala_id')
                ->join('asientos','asientos.sala_id' , '=' , 'sala.id')
                ->LeftJoin('asientos_ocupados' , 'asientos_ocupados.asientos_id' , '=' , 'asientos.id')
                ->where('proyeccion.id', $params_array["idProyeccion"])
                ->get();
                $dataAsientos = array();
                foreach ( $asientos as $asiento ) {
                    
                    if ( $asiento->asientos_id){
                        $estado = true;
                    } else {
                        $estado = false;
                    }
                    $dataAsientos[] = [
                        "nombre_asiento" => $asiento->descripcion,
                        "asiento_id"     => $asiento->id,
                        "estado"         => $estado
                    ];
                }
                $data = array(
                    'code'   =>200,
                    'status' =>'success',
                    'asientos' =>$dataAsientos
                );
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

    public function reservarAsientos ( Request $request ) {
 
        $params_array = [ 
            "idProyeccion" => $request["idProyeccion"],
            "idAsiento"    => json_decode($request["idAsiento"], true)
        ];

        if( !empty( $params_array ) ){

            $validate = \Validator::make( $params_array, [
                "idProyeccion" => "required|integer",
                "idAsiento"    => "required"
            ]);

            if ( $validate->fails() ){

                $data = array(
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );

            } else {
                $guardado = [];
                foreach( $params_array["idAsiento"] as $asientos ) {
                    $asientosReservados =  new asientos_ocupados();
                    $asientosReservados->proyeccion_id = $params_array["idProyeccion"];
                    $asientosReservados->asientos_id = $asientos;
                    $asientosReservados->reservado = false;
                    $guardado[] = ( $asientosReservados->save() ) ? $asientos : null ;
                    
                }
                if ( !empty($guardado) ){
                    $data = array(
                        'code'   =>200,
                        'status' =>'success',
                        'respuesta' =>'Se reservo con extio el asiento '
                    );
                } else {
                    $data = array(
                        'code'   =>404,
                        'status' =>'error',
                        'respuesta' =>'Hubo un error al reservar el asiento'
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

    public function crearAsientos ( Request $request ){
        
        $params_array = [
            'columnas'  => $request["columnas"] ,
            'filas'     => $request["filas"] ,
            'idsala'    => $request["idsala"]
        ];
        if ( !empty( $params_array ) ){
            $validate = \Validator::make($params_array , [
                'columnas' => 'required|string',
                'filas'    => 'required|integer',
                'idsala'   => 'required|integer'
            ] );

            if ( $validate->fails() ){

                $data = array(
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );

            } else {
                // Validar la capacidad de la sala
                for ( $i=1 ; $i <= $request["filas"] ; $i++ ){
                    $datosGuardar[] = [
                        'sala_id'     => $request["idsala"],
                        'descripcion' => strtoupper($request["columnas"]).$i,
                        'created_at'  => date('Y-m-d H:i'),
                        'update_at'   => date('Y-m-d H:i')
                    ];
                }
                
                $asientos =  asientos::insert($datosGuardar);
                $respuesta = ( $asientos ) ? 'Se guardo los asientos con exito' : 'Hubo un error al guardar los asientos';
                $data = array(
                    'code'      =>200,
                    'status'    =>'success',
                    'respuesta' => $respuesta
                );
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

    private function eliminiarReservas (  ) {
        // se eliminan todas las reservas que tengas mas de 10 minutos en transacion
        $asientosReservados = asientos_ocupados::whereRaw('asientos_ocupados.reservado = false and TIMESTAMPDIFF(MINUTE, asientos_ocupados.created_at, now() ) >= 10' )
        ->delete();
        // if( $asientosReservados ) {
        //     echo 'eliminado correctamente';
        // } else {
        //     echo 'hubo un error al elimininar las reservas';
        // }
    }
}
