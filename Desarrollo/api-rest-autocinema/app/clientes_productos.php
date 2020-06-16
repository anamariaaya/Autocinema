<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class clientes_productos extends Model
{
    protected $table = "clientes_productos";

    protected $fillable = [
        "cliente_id" , "producto_id", "cantidad"
    ];

    public function cliente() {
        return $this->belongsTo("App\cliente" , "cliente_id");
    }

    public function producto() {
        return $this->belongsTo("App\producto" , "producto_id");
    }
    
}
