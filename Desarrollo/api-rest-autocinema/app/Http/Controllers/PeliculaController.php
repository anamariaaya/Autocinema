<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

// controladores
use App\pelicula;

class PeliculaController extends Controller
{
    // listar todas las peliculas
    public function index () {
        $arrPelicula = array();
        $pelicula = pelicula::selectRaw('pelicula.*, genero.descripcion , clasificaion.descripcion clasificacion')
        ->join('genero' , 'genero.id' , '=' , 'pelicula.genero_id')
        ->join('clasificaion' , 'clasificaion.id' , '=' , 'pelicula.clasificacion_id')
        ->get(); 

        foreach ( $pelicula as $peliculas ) {
            $arrPelicula[] = [
                'idpelicula'      => $peliculas["id"],
                'titulo'          => $peliculas["titulo"],
                'sinopsis'        => $peliculas["sinopsis"],
                'imagen'          => $peliculas["imagen"],
                'trailer'         => $peliculas["trailer"],
                'portada'         => $peliculas["portada"],
                'genero'          => $peliculas["descripcion"],
                'clasificacion'   => $peliculas["clasificacion"],
                'clasificacionid' => $peliculas["clasificacion_id"],
                'duracion'        => $peliculas["duracion"]
            ];
        }
        $data = array(
            'code'      => 200,
            'status'    => 'success',
            'respuesta' => $arrPelicula
        );
        return response()->json($data,$data["code"]);
    }

    // listar solamente una pelicula
    public function show ( $idpelicula ) {
        $arrPelicula = array();
        $params_array = [
            'idpelicula' => $idpelicula
        ];
        if ( !empty( $params_array ) ) {
            $validate = \Validator::make( $params_array , [
                "idpelicula" => 'required|integer'
            ] );
            if ( $validate->fails() ){
                $data = [
                    'code'    => 405,
                    'status'  => 'Bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                ];
            } else {
                $pelicula = pelicula::selectRaw('pelicula.*, genero.descripcion , clasificaion.descripcion clasificacion')
                ->join('genero' , 'genero.id' , '=' , 'pelicula.genero_id')
                ->join('clasificaion' , 'clasificaion.id' , '=' , 'pelicula.clasificacion_id')
                ->where('pelicula.id', $params_array["idpelicula"])
                ->get(); 
                foreach ( $pelicula as $peliculas ) {
                    $arrPelicula[] = [
                        'idpelicula'      => $peliculas["id"],
                        'titulo'          => $peliculas["titulo"],
                        'sinopsis'        => $peliculas["sinopsis"],
                        'imagen'          => $peliculas["imagen"],
                        'trailer'         => $peliculas["trailer"],
                        'portada'         => $peliculas["portada"],
                        'genero'          => $peliculas["descripcion"],
                        'clasificacion'   => $peliculas["clasificacion"],
                        'clasificacionid' => $peliculas["clasificacion_id"],
                        'duracion'        => $peliculas["duracion"]
                    ];
                }
                $arrPelicula = ( empty( $arrPelicula ) ) ? 'No existe una pelicula con es id' : $arrPelicula ; 
                $data = array(
                    'code'      => 200,
                    'status'    => 'success',
                    'respuesta' => $arrPelicula
                );
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

    // crear peliculas
    public function store ( Request $request ) {
 
        $validate = \Validator::make( $request->all(),[
            'imagen'       => 'required|image|mimes:jpg,jpeg,png,gif',
            'titulo'       => 'required|string',
            'trailer'      => 'required|string',
            'portada'      => 'required|string',
            'descripcion'  => 'required|string',
            'idgenero'     => 'required|integer',
            'calificacion' => 'required|integer',
            'duracion'     => 'required|integer',
            'sinopsis'     => 'required|string'

        ]);
        if( $validate->fails() ){
            $data = array(
                'code'    => 405,
                'status'  => 'Bad request',
                'message' => 'Data Invalid',
                'errors'  => $validate->errors()
            );
        } else {
            $file = $request->file('imagen');
            $name = time().$file->getClientOriginalName();
            $file->move(public_path()."/imagenes/" , $name );

            $pelicula = new pelicula();
            $pelicula->imagen           = $name;
            $pelicula->titulo           = $request["titulo"];
            $pelicula->trailer          = $request["trailer"];
            $pelicula->portada          = $request["portada"];
            $pelicula->descripcion      = $request["descripcion"];
            $pelicula->genero_id        = $request["idgenero"];
            $pelicula->clasificacion_id = $request["calificacion"];
            $pelicula->duracion         = $request["duracion"];
            $pelicula->sinopsis         = $request["sinopsis"];
            $respuesta = ( $pelicula->save() )? 'Se guardo con exito la pelicula' : 'Hubo un error al guardar la pelicula';
            
            $data = array(
                'code'      => 200,
                'status'    => 'success',
                'respuesta' => $respuesta
            );

        }
        return response()->json($data,$data["code"]);
    }

    // modificar peliculas
    public function update ( $idPelicula, Request $request ){
        
        $validate = \Validator::make( $request->all(),[
            'imagen'       => 'required|image|mimes:jpg,jpeg,png,gif',
            'titulo'       => 'required|string',
            'trailer'      => 'required|string',
            'portada'      => 'required|string',
            'descripcion'  => 'required|string',
            'idgenero'     => 'required|integer',
            'calificacion' => 'required|integer',
            'duracion'     => 'required|integer',
            'sinopsis'     => 'required|string'

        ]);
        if( $validate->fails() ){
            $data = array(
                'code'    => 405,
                'status'  => 'Bad request',
                'message' => 'Data Invalid',
                'errors'  => $validate->errors()
            );
        } else {
            $file = $request->file('imagen');
            $name = time().$file->getClientOriginalName();
            $file->move(public_path()."/imagenes/" , $name );

            
            $pelicula = pelicula::where('pelicula.id' , $idPelicula)
            ->update([ 
                'imagen'          => $request['imagen'] , 
                'titulo'          => $request['titulo'] , 
                'trailer'         => $request['trailer'] ,
                'portada'         => $request['portada'] ,
                'descripcion'     => $request['descripcion'],
                'genero_id'       => $request['idgenero'],
                'calificacion_id' => $request['calificacion'],
                'duracion'        => $request['duracion'],
                'sinopsis'        => $request['sinopsis']
                ]);
                
            $respuesta = ( $pelicula ) ? 'Se actualizo correctamente la pelicula' : 'Hubo un error al actualizar la pelicula';
            $data = [
                'code'      => 200,
                'status'    => 'succes',
                'respuesta' => $respuesta
            ];

        }
        return response()->json($data,$data["code"]);
    }

    // Eliminar una pelicula
    public function destroy ( $idPelicula ) {
        // Eliminar la pelicula o dejarla como deshabilitada?
        // agregar un columna estado default 1 ( true ) con todos los deletes
        $pelicula = pelicula::where('pelicula.id' , $idPelicula)->delete();

        $respuesta = ( $pelicula ) ? 'Se elimino correctamente la pelicula' : 'Hubo un erro al eliminar la pelicula';
        $data = [
            'code'      => 200,
            'status'    => 'succes',
            'respuesta' => $respuesta
        ];
        return response()->json($data,$data["code"]);
    }
}
