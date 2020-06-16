<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class productos extends Model
{
    protected $table = "productos";
    protected $fillable = [
    	'descripcion', 'costo'
    ];
/*
    public function restaurantes()
    {
    	return $this->belongsToMany('App\restaurante','productos_restaurantes','restaurantes_id','productos_id');
    }

    public function combos()
    {
        return $this->belongsToMany("App\combos" , "combos_productos" , "combo_id" , "producto_id");
    }
*/
    public function clientes_productos()
    {
        return $this->hasMany("App\clientes_productos");
    }

    public function categoria_producto()
    {
        return $this->belongsTo("App\categoria_productos", 'categoria_id');
    }
}
