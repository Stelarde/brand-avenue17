<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Order;
use Illuminate\Support\Facades\Http;

class OrderController extends Controller
{
    public function createOrder(Request $request)
    {
        $requestData = $request->toArray();

        if ($requestData['promocode_id'] !== null){
            $requestData['promocode_id'] = $requestData['promocode_id']['id'];
        }

        $order = Order::create($requestData);

        return $order->id;
    }

    public function orders()
    {
        $orders = Order::with('promocode')->orderBy('id', 'desc')->get();

        foreach ($orders as $order){
            $order->cart = json_decode($order->cart);
        }

        return view('admin.orders.orders', [
            'orders' => $orders
        ]);
    }

    public function completeOrder(Order $order)
    {
        $order->status = 'Завершен';
        $order->update();

        return redirect()->route('admin_orders');
    }

    public function cancelOrder(Order $order)
    {
        $order->status = 'Отменен';
        $order->update();

        return redirect()->route('admin_orders');
    }

    public function getPaymentForm(Request $request)
    {
        $url = Http::post('https://securepay.tinkoff.ru/v2/Init', [
            "TerminalKey" => "1670507040378",
            "Amount" => $request->summ,
            "OrderId" => $request->orderId,
            "DATA" => [
                "Phone" => $request->phone,
                "Email" => $request->email
            ]
        ]);

        return $url['PaymentURL'];
    }
}
