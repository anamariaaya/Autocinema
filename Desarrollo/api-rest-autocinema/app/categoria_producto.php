<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class categoria_producto extends Model
{
    public function productos()
    {
        return $this->hasMany("App\productos");
    }
}
