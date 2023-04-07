<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Promocode;

class PromocodeController extends Controller
{
    public function savePromocode(Request $request, Promocode $promocode)
    {
        $promocode->update($request->toArray());

        return redirect()->route('admin_settings', ['save' => true]);
    }

    public function addPromocode(Request $request)
    {
        Promocode::create($request->toArray());

        return redirect()->route('admin_settings', ['save' => true]);
    }

    public function deletePromocode(Promocode $promocode)
    {
        $promocode->delete();

        return redirect()->route('admin_settings', ['save' => true]);
    }

    public function getPromocode($code)
    {
        return Promocode::where('code', $code)->firstOrFail();
    }
}
