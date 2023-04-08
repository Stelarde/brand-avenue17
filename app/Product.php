<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['name', 'price', 'old_price', 'desc', 'slug', 'seo_title', 'seo_desc', 'article', 'color'];

    public function images()
    {
        return $this->hasOne('App\ProductImage', 'product_id');
    }

    public function sizes()
    {
        return $this->hasMany('App\ProductSize', 'product_id');
    }

    public function categories()
    {
        return $this->hasMany('App\ProductToCategory', 'product_id');
    }
}
