<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class clacificacion extends Model
{
    protected $table = "clasificacion";

    protected $fillable = [
        "descripcion"
    ];

    public function peliculas()
    {
        return $this->hasMany('App\pelicula');
    }
}
