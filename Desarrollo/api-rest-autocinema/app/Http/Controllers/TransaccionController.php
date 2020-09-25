<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

// modelos
use App\cliente;
use App\clientes_productos;
use App\boleta;

class TransaccionController extends Controller
{
    public function setResumen( Request $request ) {

        $params_array = [
            "idProyeccion" => $request["idProyeccion"],
            "boleta"       => json_decode( $request["boleta"] , true ),
            "asientos"     => json_decode( $request["asientos"] , true ),
            "confiteria"   => json_decode( $request["confiteria"] , true ),
            "cliente"      => json_decode( $request["cliente"] , true )
        ];
        if ( !empty( $params_array ) ){ 
            $validate = \Validator::make( $params_array , [
                'idProyeccion' => 'required',
                'boleta'       => 'required',
                'asientos'     => 'required',
                'confiteria'   => 'required',
                'cliente'      => 'required'
                // 'boleta.asiento' => 'required|integer'
            ] );
            if ( $validate->fails() ){
                $data = [
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];

            } else {
                $cliente_id    = $this->crearCliente( $params_array["cliente"] );
                $resBoleta     = $this->crearBoleta( $cliente_id , $params_array["idProyeccion"] , $params_array["boleta"] );
                $resConfiteria = $this->confiteria( $cliente_id , $params_array["confiteria"] );
                $resAsiento    = $this->confirmarAsiento( $params_array["idProyeccion"] , $params_array["asientos"] );
                if ( $cliente_id ){
                    if ( $resBoleta == true and $resConfiteria == true and $resAsiento == true ){
                        $data = array(
                            'code'      =>200,
                            'status'    =>'success',
                            'respuesta' =>'Se finalizo el proceso de comprar con exito'
                        );
                    } else {
                        $data = array(
                            'code'      =>404,
                            'status'    =>'error',
                            'respuesta' =>'Hubo un error al finalizar el proceso de compra'
                        );
                    }
                }

            }

        } else {
            $data = array(
                'code'    => 400,
                'status'  => 'error',
                'message' => "Data not found"
            );
        }
        
        return response()->json($data,$data["code"]);
    }

    private function crearCliente ( $arrCliente ) {
        
        $cliente = new cliente();
        $cliente->nombre    = $arrCliente["nombre"];
        $cliente->cedula    = $arrCliente["cedula"];
        $cliente->direccion = $arrCliente["direccion"];
        $cliente->email     = $arrCliente["correo"];
        $cliente->placa     = $arrCliente["placa"];
        $cliente->telefono  = $arrCliente["telefono"];
        $cliente->save();

        return $cliente->id;
    }

    private function crearBoleta ( $cliente_id, $idProyeccion, $arrBoleta ) {
        
        $boleta = new boleta();
        $boleta->cliente_id    = $cliente_id;
        $boleta->proyeccion_id = $idProyeccion;
        $boleta->asiento       = $arrBoleta["asiento"];
        $boleta->tipo_id       = $arrBoleta["tipoAsiento"];
        
        return $boleta->save();

    }

    private function confiteria ( $cliente_id, $arrConfiteria ){

        foreach ( $arrConfiteria as $confiteria  ) {
            $cantidad   = $confiteria["cantidad"];
            $idProducto = $confiteria["idProducto"];
            $confiteria =  new clientes_productos();
            $confiteria->producto_id = $idProducto;
            $confiteria->cantidad    = $cantidad;
            $confiteria->cliente_id  = $cliente_id;
            $resConfiteria = $confiteria->save();
        }
        return $resConfiteria;       
    }

    private function confirmarAsiento( $idProyeccion, $asiento ) {

        return asientos_ocupados::where('proyeccion_id' , $idProyeccion)->where('asientos_id' , $asiento["idAsiento"])->update(["reservado" =>  true ]);

    }
}




