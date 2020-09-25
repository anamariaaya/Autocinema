<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tipo_boleta extends Model
{
    protected $table = "tipo_boleta";

    protected $fillable = [
        "nombre" , "descripcion", "costo_fijo" ,"costo_descuento"
    ];
    
    public function boletas(){
        return $this->hasMany("App\boleta");
    }
}
