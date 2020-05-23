<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class asientos extends Model
{
    protected $table =  "asientos";

    protected $fillable = [
        'descripcion','sala_id'
    ];
}
