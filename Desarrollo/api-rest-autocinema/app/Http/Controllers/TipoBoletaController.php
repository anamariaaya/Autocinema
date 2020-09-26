<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\tipo_boleta;

class TipoBoletaController extends Controller
{
    public function getTipoBoleta()
    {
    	$tipoBoleta = tipo_boleta::all();

    	return response()->json([
    		'code' => 200,
    		'status' => 'success',
    		'tiposBoleta' => $tipoBoleta
    	],200);
    }
}
