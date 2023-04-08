<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReturnController extends Controller
{
    public function index()
    {
        $title = 'Возврат';
        $description = "";

        return view('return', [
            'title' => $title,
            'description' => $description
        ]);
    }
}
