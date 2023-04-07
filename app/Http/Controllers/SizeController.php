<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Size;
use App\ProductSize;

class SizeController extends Controller
{
    public function index($save = null)
    {
        $sizes = Size::get();

        return view('admin.size.size', [
            'save' => $save,
            'sizes' => $sizes
        ]);
    }

    public function createSize(Request $request)
    {
        $size = $request->toArray();
        Size::create($size);

        return redirect()->route('admin_sizes', ['save' => true]);
    }

    public function deleteSize(Size $size){
        $size->delete();
        ProductSize::where('name', $size->name)->delete();

        return redirect()->route('admin_sizes', ['save' => true]);
    }
}
