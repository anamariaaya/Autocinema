<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class sala extends Model
{
    // tabla que hace referencia dentro de la base de datos
    protected $table = "sala";

    // datos que va inserta de manera masiva
    protected $fillable = [
        'nombre','capacidad'
    ];

    public function asientos(){
        // relacion de uno a muchos 
        return $this->hasMany('App\asientos');
    }

    public function proyecciones(){
        return $this->hasMany('App\proyeccion');
    }
 }
