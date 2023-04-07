<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $title = 'Корзина';
        $description = "";

        return view('cart', [
            'title' => $title,
            'description' => $description
        ]);
    }
}
