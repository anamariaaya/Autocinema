<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class proyeccion extends Model
{
    protected $table = "proyeccion";

    protected $fillable = [
        'pelicula_id','sala_id','horario_inicio','horario_fin'
    ];

    public function sala() {
        return $this->belongsTo('App\sala' , 'sala_id');
    }

    public function pelicula(){
        return $this->belongsTo('App\pelicula', 'pelicula_id');
    }

    public function boletas(){
        return $this->hasMany("App\boleta");
    }
}
