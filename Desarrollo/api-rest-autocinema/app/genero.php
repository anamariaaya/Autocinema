<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class genero extends Model
{
    protected $table = "genero";

    protected $fillable = [
        "descripcion"
    ];

    public function peliculas()
    {
        return $this->hasMany('App\pelicula');
    }
}
