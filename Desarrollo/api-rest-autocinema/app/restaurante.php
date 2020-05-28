<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class restaurante extends Model
{
    protected $table = "restaurantes";
    protected $fillable = [
    	'descripcion'
    ];
    public function productos () {
        return $this->belongsToMany('App\productos' , 'productos_restaurantes', 'productos_id', 'restaurantes_id');
    }
}
