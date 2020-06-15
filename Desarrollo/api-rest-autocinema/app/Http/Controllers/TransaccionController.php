<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

// modelos
use App\cliente;
use App\cliente_productos;
use App\boleta;
use App\asientos_ocupados;

class TransaccionController extends Controller
{
    public function setResumen( Request $request ) {

        // $arr[] = [
        //     "idProyeccion"=> 1,
        //     "boleta" => [
        //         "asiento" => "A3",
        //         "tipoAsiento" => 1
        //     ],
        //     "asientos" => [
        //         "idAsiento" => 1
        //     ],
        //     "confiteria" => [
        //         ["idProducto" =>1 , "cantidad" => 2],
        //         ["idProducto" =>2 , "cantidad" => 1]
        //     ],
        //     "cliente" => [
        //         "nombre" => "Andres Felipe Lopez Manrique",
        //         "cedula" => 1024580021,
        //         "direccion" => "Crr 10 # 11-59 sur",
        //         "correo" => "andres.lopezma@hotmail.com",
        //         "placa" => "ALD234",
        //         "telefono" => 7751904
        //     ]
        // ];
        
        // foreach ( $arr as $arreglo ){
        //     echo $arreglo["idProyeccion"] ."<br>";
        //     foreach( $arreglo["asientos"] as $key => $asiento ){
        //         echo "asientos: " . $asiento . "<br>";
        //     }
        //     foreach( $arreglo["confiteria"] as $keyConfi => $confiteria ){
        //         echo "id Producto: " . $confiteria["idProducto"] . " Cantidad: " . $confiteria["cantidad"] . "<br>";
        //     }
        //     echo "nombre: " . $arreglo["cliente"]["nombre"] . "<br>";
        //     echo "Cedula: " . $arreglo["cliente"]["cedula"] ."<br>";
        //     echo "direccion: " . $arreglo["cliente"]["direccion"] ."<br>";
        //     echo "correo: " . $arreglo["cliente"]["correo"] ."<br>";
        //     echo "placa: " . $arreglo["cliente"]["placa"] ."<br>";
        //     echo "telefono: " . $arreglo["cliente"]["telefono"] . "<br>";
        // }
        var_dump($request["confiteria"] );
        $params_array = [
            "idProyeccion" => $request["idProyeccion"],
            "boleta" => json_decode( $request["boleta"] , true ),
            "asientos" => $request["asientos"],
            "confiteria" => json_decode( $request["confiteria"] , true ),
            "cliente" => json_decode( $request["cliente"] , true )
        ];
        var_dump($params_array);
        die();
    }
}




