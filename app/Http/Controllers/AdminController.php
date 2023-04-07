<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;

use App\Settings;
use App\Promocode;

class AdminController extends Controller
{
    public function index()
    {
        $lastOrders = Order::with('promocode')->orderBy('id', 'desc')->limit(10)->get();

        foreach ($lastOrders as $order){
            $order->cart = json_decode($order->cart);
        }

        $statOrders = [];
        $ordersWeek = Order::whereDate('created_at', '>', date("Y-m-d H:i:s", strtotime('-1 week')))->orderBy('created_at', 'asc')->get();

        if (count($ordersWeek) > 0){
            $date = substr($ordersWeek[0]->created_at, 0, 10);
            $summ = 0;

            foreach ($ordersWeek as $order){
                if ($date === substr($order->created_at, 0, 10)){
                    $summ += $order->summ;
                } else {
                    array_push($statOrders, ['summ' => $summ, 'date' => $date]);
                    $date = substr($order->created_at, 0, 10);
                    $summ = $order->summ;
                }
            }
            array_push($statOrders, ['summ' => $summ, 'date' => $date]);
        }

        return view('admin.home', [
            'orders' => $lastOrders,
            'statOrders' => $statOrders
        ]);
    }

    public function settings($save = false)
    {
        $settings = Settings::get();
        $promocodes = Promocode::get();

        return view('admin.settings', [
            'save' => $save,
            'settings' => $settings,
            'promocodes' => $promocodes
        ]);
    }
}
