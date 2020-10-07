<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;

// modelos
use App\cliente;
use App\acompanante;
use App\boletas_productos;
use App\boleta;

class TransaccionController extends Controller
{
    private $clientId;
    private $secretKey;
    private $errores = [
        101 => "No fue posible crear el cliente",
        102 => "No fue posible crear la boleta",
        103 => "No fue posible agregar los acompanantes",
        104 => "No fue posible registrar los productos",
        105 => "No fue posible almacenar la transacción"
    ];

    function __construct()
    {
        $this->clientId = '';
        $this->secretKey = '';
    }

    public function setTransaccion(Request $request)
    {
        
    }
    public function setResumen( Request $request ) {

        $params_array = [
            "idProyeccion" => $request["idProyeccion"],
            "tipoBoleta"   => $request["tipoBoleta"],
            "cliente"      => json_decode( $request["cliente"] , true ),
            "productos"    => json_decode( $request["productos"] , true ),
            "acompanantes" => json_decode( $request["acompanantes"] , true )
        ];
        if ( !empty( $params_array ) ){ 
            $validate = \Validator::make( $params_array , [
                "idProyeccion" => 'required',
                "tipoBoleta"   => 'required',
                "cliente"      => 'required',
                "productos"    => 'required',
                "acompanantes" => 'required'
            ] );
            if ( $validate->fails() ){
                $data = [
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];

            } else {
                try {
                    //CREAMOS CLIENTE Y RETORNAMOS SU ID
                    $cliente_id = $this->crearCliente($params_array["cliente"]);
                    //CREAMOS LA BOLETA
                    $boleta_id = $this->crearBoleta( $cliente_id , $params_array["idProyeccion"] , $params_array["tipoBoleta"] );
                    //AGREGAR LOS ACOMPAÑANTES DEL CLIENTE
                    $this->crearAcompanante($boleta_id, $params_array["acompanantes"]);
                    //AGREGAR LOS PRODUCTOS COMPRADOS POR EL CLIENTE
                    $this->agregarProductos( $boleta_id , $params_array["productos"] );
                    //CREAR LA TRANSACCION
                    $transaccion_id= $this->agregarTransaccion($boleta_id);
                    $signature =  $this->generarSignature($transaccion_id);

                    $data = array(
                        'code'      =>200,
                        'status'    =>'success',
                        'respuesta' =>'Se finalizo el proceso de comprar con exito'
                    );
                    
                } catch (\Exception $e) {
                    $data = array(
                        'code' => 500,
                        'status' => 'Internal Server Error',
                        'message' => $e->getMessage()
                    );
                }

            }

        } else {
            $data = array(
                'code'    => 400,
                'status'  => 'error',
                'message' => "Data not found"
            );
        }
        // RETORNAR LA TRANSACCION CON EL SIGNATURE
        return response()->json($data,$data["code"]);
    }

    private function crearCliente ( $arrCliente ) {
        
        $clientes = cliente::where('cedula', $arrCliente["cedula"])->get();
        if (count($clientes) != 0) {
            foreach ($clientes as $cliente) {
                $cliente_id = $cliente->id;
            }
        } else{
            $cliente = new cliente();
            $cliente->nombre    = $arrCliente["nombre"];
            $cliente->cedula    = $arrCliente["cedula"];
            $cliente->direccion = $arrCliente["direccion"];
            $cliente->email     = $arrCliente["correo"];
            $cliente->placa     = $arrCliente["placa"];
            $cliente->telefono  = $arrCliente["telefono"];
            
            if (!$cliente->save()) {
                throw new \Exception($this->errores[101], 101);
            }
            $cliente_id = $cliente->id;

        }
        
        return $cliente_id;

    }

    private function crearAcompanante($boleta_id, $acompanantes)
    {
        foreach ($acompanantes as $acompanante) {
            $nuevoAcompanante  =  new acompanante();
            $nuevoAcompanante->nombres = $acompanante["nombres"];
            $nuevoAcompanante->cedula = $acompanante["cedula"];
            $nuevoAcompanante->telefono = $acompanante["telefono"];
            $nuevoAcompanante->boleta_id = $boleta_id;

            if (!$nuevoAcompanante->save()) {
                throw new \Exception($this->errores[103], 103);
            }
        }
        
    }

    private function crearBoleta ( $cliente_id, $idProyeccion, $tipoBoleta ) {
        
        $boleta = new boleta();
        $boleta->cliente_id    = $cliente_id;
        $boleta->proyeccion_id = $idProyeccion;
        $boleta->tipo_boleta_id = $tipoBoleta;
        $boleta->estadoBoleta = 'Procesando Pago';
        
        if (!$boleta->save()) {
            throw new \Exception($this->errores[102], 102);
        }

        return $boleta->id;

    }

    private function agregarProductos ( $boleta_id, $arrProductos ){
        foreach ( $arrProductos as $producto  ) {
            $cantidad   = $producto["cantidad"];
            $idProducto = $producto["idProducto"];
            $producto =  new boletas_productos();
            $producto->productos_id = $idProducto;
            $producto->cantidad = $cantidad;
            $producto->boleta_id = $boleta_id;
            
            if (!$producto->save()) {
                throw new \Exception($this->errores[104], 104);
            }
        }
    }

    private function agregarTransaccion($boleta_id)
    {
        //METODO PENDIENTE DE LA INTEGRACION CON EL FORMULARIO PARA LA CREACIÓN CORRECTA DE LA TABLA DE TRANSACCIONES
        return true;
    }
    private function generarSignature($transaccion_id)
    {
        $signature = null;
        return $signature;   
    }
}




