<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class acompanante extends Model
{
    protected $table = "acompanantes";

    protected $fillable = [
        "nombres" , "cedula" , "telefono"
    ];

    public function boleta(){
        return $this->belongsTo('App\boleta' , "boleta_id");
    }
}
