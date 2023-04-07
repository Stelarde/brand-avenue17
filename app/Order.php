<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['name', 'surname', 'email', 'phone', 'delivery', 'street', 'home', 'room', 'comment', 'payment', 'cart', 'promocode_id', 'summ'];

    public function promocode()
    {
        return $this->hasOne('App\Promocode', 'id', 'promocode_id');
    }
}
