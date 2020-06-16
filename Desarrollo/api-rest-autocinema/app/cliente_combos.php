<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cliente_combos extends Model
{
    protected $table = "cliente_combos";

    protected $fillabel = [
        "cliente_id" , "combo_id" , "cantidad"
    ];

    public function cliente (){
        return $this->belongsTo("App\cliente" , "cliente_id");
    }

    public function combo (){
        return $this->belongsTo("App\combos" , "combo_id");
    }
}
