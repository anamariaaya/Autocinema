<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class productos extends Model
{
    protected $table = "productos";
    protected $fillable = [
    	'descripcion', 'costo'
    ];

    public function restaurantes()
    {
    	return $this->belongsToMany('App\restaurante','productos_restaurantes','restaurantes_id','productos_id');
    }
}
