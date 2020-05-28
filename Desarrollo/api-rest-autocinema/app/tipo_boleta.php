<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tipo_boleta extends Model
{
    protected $table = "tipo_boleta";

    protected $fillable = [
        "descripcion" , "costo"
    ];
    
    public function boletas(){
        return $this->hasMany("App\boleta");
    }
}
