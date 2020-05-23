<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class asientos_ocupados extends Model
{
   	protected $table =  "asientos_ocupados";

    protected $fillable = [
        'asientos_id','proyeccion_id'
    ];
}
