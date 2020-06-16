<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class combos extends Model
{
    protected $table = "combos";

    protected $fillable = [
        "descripcion" , "cliente_combo_id", "costo"
    ];

    public function productos()
    {
        return $this->belongsToMany("App\productos" , "combos_productos" , "producto_id" , "combo_id");
    }
}
