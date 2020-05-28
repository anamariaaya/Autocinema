<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cliente extends Model
{
    protected $table = "cliente";

    protected $fillable = [
        "nombre" , "email" , "telefono"
    ];

    public function boletas(){
        return $this->hasMany("App\boleta");
    }
}
