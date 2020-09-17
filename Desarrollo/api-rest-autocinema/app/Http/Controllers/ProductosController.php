<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

//modelos
use App\productos;
use App\categoria_producto;

class ProductosController extends Controller
{
    public function getProductos (Request $request) {
        
        $params_array = [
            'idCategoria' => $request['idCategoria'],
            'cantidad'   => $request['cantidad'],
        ];
        
        if (!empty($params_array)) {
        	$validate = \Validator::make($params_array,[
        		"idCategoria" => 'required|integer',
        		"cantidad" => 'required|integer'
        	]);

        	if ($validate->fails()) {
        		$data = array(
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );	
        	} else{
        		$productos = productos::select('productos.id', 'productos.descripcion as desProducto' , 'productos.costo' , 'sc.descripcion as subCategoria' ,'c.descripcion as categoria ')
                ->join('subCategoria as sc' , 'sc.id' , '=' , 'productos.subCategoria_id')
		        ->join('categoria_producto as c' , 'sc.categoria_producto_id' , '=' , 'c.id')
		        ->where('c.id', $params_array["idCategoria"])
		        ->limit( $params_array["cantidad"] )
		        ->get();

		    	$data = array(
                    'code'   =>200,
                    'status' =>'success',
                    'orders' =>$productos
                );
        	}
        }else{
        	$data = array(
                'code'    => 400,
                'status'  => 'error',
                'message' =>"Data not found"
            );
        }
        return response()->json($data,$data["code"]);
    }
}
