<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use PhpParser\Node\Expr\FuncCall;

class boleta extends Model
{
    protected $table = "boleta";

    protected $fillable = [
        'cliente_id','proyeccion_id','tipo_boleta_id'
    ];

    public function tipo_boleta(){
        return $this->belongsTo('App\tipo_boleta' , "tipo_boleta_id");
    }

    public function proyeccion() {
        return $this->belongsTo("App\proyeccion", "proyeccion_id");
    }

    public function cliente() {
        return $this->belongsTo("App\cliente", "cliente_id");
    }
}
