<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Promocode extends Model
{
    protected $fillable = ['code', 'discount', 'uses'];


    public function orders()
    {
        return $this->belongsTo('App\Order', 'id', 'promocode_id');
    }
}
