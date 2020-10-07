<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class boletas_productos extends Model
{
    
    protected $table = "boletas_productos";

    protected $fillable = [
        "boleta_id" , "producto_id", "cantidad"
    ];

    public function boleta() {
        return $this->belongsTo("App\boleta" , "boleta_id");
    }

    public function producto() {
        return $this->belongsTo("App\producto" , "producto_id");
    }
    

}
