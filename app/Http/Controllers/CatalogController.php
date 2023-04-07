<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use App\ProductImage;
use App\ProductSize;
use App\ProductToCategory;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
    public function index($categorySlug = null)
    {
        $title = "Каталог";
        $description = "";

        if ($categorySlug !== null){
            $category = Category::where('slug', $categorySlug)->firstOrFail();
            $category->views ++;
            $category->update();
        } else {
            $category = 0;
        }

        return view('catalog', [
            "category" => $category,
            "title" => $title,
            "description" => $description
        ]);
    }

    public function new()
    {
        $title = "Каталог";
        $description = "";

        $category = 1;

        return view('catalog', [
            "category" => $category,
            "title" => $title,
            "description" => $description
        ]);
    }
}
