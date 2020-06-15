<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\sala;
use App\asientos;
use App\asientos_ocupados;
use App\productos;
use App\restaurante;

class PruebasController extends Controller
{

    public function testOrm(){
        // $sala = sala::all();
        
        // foreach ( $sala as $item ){
        //     echo '<h1>' . $item->nombre . '</h1>';
        //     foreach( $item->asientos as $itemAsientos){
        //         echo '<h4>' . $itemAsientos->descripcion . '</h4>';
        //         foreach( $itemAsientos->asientos_ocupados as $itemOcupados ){
        //             echo '<h5>Hola ' . $itemOcupados->proyeccion_id . '</h5>';
        //         }
        //     }
        // }
        // var_dump($sala);
         
        // $restaurantes =  restaurante::all();
        // foreach ($restaurantes as $restaurante) {
        //     echo "<h1>".$restaurante->descripcion."</h1>";
        //     foreach ($restaurante->productos as $producto) {
        //         echo "<h2>".$producto->descripcion."</h2>";
        //         echo "<h3>".$producto->costo."</h3>";
        //     }
        // }
        // 
        /*
        $restaurantes =  restaurante::all();
        foreach ($restaurantes as $restaurante) {
            echo "<h1>".$restaurante->descripcion."</h1>";
            foreach ($restaurante->productos as $producto) {
                echo "<h2>".$producto->descripcion."</h2>";
                echo "<h3>".$producto->costo."</h3>";
                foreach ( $producto->combos as $combo ){
                    echo "Este producto esta incluido en el combo # " . $combo->descripcion . " con le id: " . $combo->id . " - " ;
                }
            }
        }
        */
        die();
    }

}
