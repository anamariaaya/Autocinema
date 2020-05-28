<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class asientos_ocupados extends Model
{
   	protected $table =  "asientos_ocupados";

    protected $fillable = [
        'asientos_id','proyeccion_id'
    ];

    public function asiento(){
        return $this->belongsTo('App\asientos', 'asientos_id');
    }

    public function proyeccion(){
        return $this->belongsTo('App\proyeccion' , 'proyeccion_id');
    }
}
