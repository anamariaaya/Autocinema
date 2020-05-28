<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class pelicula extends Model
{
    protected $table = 'pelicula';

    protected $fillable = [
        'sinopsis' , 'trailer' , 'portada' , 'descripcion' , 'titulo' , 'duracion'
    ];

    public function proyecciones() {
        return $this->hasMany('App\proyeccion');
    }

    public function genero() {
        return $this->belongsTo('App\genero', 'genero_id');
    }

    public function clasificacion(){
        return $this->belongsTo('App\clasificacion' , 'clasificacion_id');
    }
}
