<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cliente extends Model
{
    protected $table = "cliente";

    protected $fillable = [
        "nombre" , "email" , "telefono", "cedula", "direccion" , "placa"
    ];

    public function boletas(){
        return $this->hasMany("App\boleta");
    }

    public function clientes_combos(){
        return $this->hasMany('App\cliente_combos');
    }

    public function clientes_productos(){
        return $this->hasMany('App\clientes_productos');
    }
}
