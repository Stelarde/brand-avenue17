<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductToCategory extends Model
{
    public function product()
    {
        return $this->belongsTo('App\Product', 'id', 'product_id');
    }

    public function category()
    {
        return $this->belongsTo('App\Category', 'id', 'category_id');
    }
}
