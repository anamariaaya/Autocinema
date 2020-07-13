<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

//controladores 
use App\sala;

class SalaController extends Controller
{
    public function index() {

        $arrSalas = array();
        $sala = sala::select( 'sala.nombre' , 'sala.capacidad' , 'sala.id' )
        ->get();

        foreach ( $sala as $salas ){
            $arrSalas[] = [
                'nombreSala'  => $salas["nombre"],
                'capacidad'   => $salas["capacidad"],
                'idSala'      => $salas["id"]
            ];
        }
        $arrSalas = ( empty( $arrSalas ) ) ? 'No hay salas creadas ' : $arrSalas;     
        $data = [
            'code'    => 200,
            "status"  => "success",
            "salas"   => $arrSalas
        ];

        return response()->json($data, $data['code']);

    }
    public function store( Request $request ) {
        $params_array = [
            'nombreSala'  => $request['nombreSala'],
            'capacidad'   => $request['capacidad']
        ];

        if ( !empty( $params_array ) ){
            $validate = \Validator::make( $params_array, [
                'nombreSala' => 'required|string',
                'capacidad'  => 'required|integer'
            ]);

            if ( $validate->fails() ){
                $data = [
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {
                /** Pregunta sobre la insercion de los asientos */
                $salas = new sala();
                $salas->nombre    = $params_array["nombreSala"];
                $salas->capacidad = $params_array["capacidad"];
                $resSalas = $salas->save();
                if ( $resSalas ) {
                    $respuesta = 'Se creo la sala correctamente con el id: ' . $salas->id;
                } else {
                    $respuesta = 'Hubo un error al crear la sala';
                }

                $data = [
                    'code'      => 200,
                    'status'    => 'success',
                    'respuesta' => $respuesta
                ];
                

            }


        } else {
            $data = [
                'code'      => 400,
                "status"    => "error",
                "message"   => "Data not fonund"
            ];
        }

        return response()->json($data, $data['code']);

        
    }
    public function update($idSala , Request $request ) {
        $params_array = [
            'nombreSala' => $request["nombreSala"],
            'capacidad'  => $request["capacidad"]
        ];

        if ( !empty( $params_array ) ){
            $validate = \Validator::make( $params_array , [
                'nombreSala'  => 'required|string',
                'capacidad'   => 'required|integer'
            ] );

            if ( $validate->fails() ){

                $data = array(
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );

            } else {
                $data = array( 'code' => 200 );
                $salas = sala::where('sala.id' , $idSala)->update([ 'sala.nombre' => $params_array["nombreSala"] , 'sala.capacidad' => $params_array["capacidad"] ]);
                
                $respuesta = ( $salas ) ? 'Se actualizo correctamente la sala' : 'Hubo un error al actualizar la sala';
                $data = [
                    'code'      => 200,
                    'status'    => 'succes',
                    'respuesta' => $respuesta
                ];

            }

        } else {
            $data = array(
                'code'    => 400,
                'status'  => 'error',
                'message' =>"Data not found"
            );
        }

        return response()->json($data, $data['code']);
    }
    public function show( $idSala ) {
        
        $sala = sala::select( 'sala.nombre' , 'sala.capacidad' , 'sala.created_at' ,'sala.updated_at' )
        ->where('sala.id' , $idSala)
        ->get();

        foreach ( $sala as $salas ){
            $arrSala = [
                'nombreSala'  => $salas["nombre"],
                'capacidad'   => $salas["capacidad"],
                'created_at'  => $salas["created_at"],
                'updated_at'  => $salas["updated_at"]
            ];
        }

        $arrSala = ( isset( $arrSala ) )? $arrSala : 'No hay datos correspondientes al id' ;

        $data = [ 
            'code'   =>  200,
            'status' =>'success',
            'salas'  => $arrSala
        ];

        
        return response()->json($data,$data['code']);

    }
}
