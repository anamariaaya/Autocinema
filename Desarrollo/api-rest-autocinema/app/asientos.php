<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class asientos extends Model
{
    protected $table =  "asientos";

    protected $fillable = [
        'descripcion','sala_id'
    ];

    public function sala()
    {
        //relacion de uno a muchos inverso
        return $this->belongsTo('App\sala' , 'sala_id');
    }

    public function asientos_ocupados() {
        return $this->hasMany('App\asientos_ocupados');
    }

}
