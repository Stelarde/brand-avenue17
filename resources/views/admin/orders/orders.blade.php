@extends('layouts.admin')

@section('content')
    <h1 class="h1 mb-4">Заказы</h1>
    <table class="table">
        <thead>
            <tr>
                <th class="col-1 text-center" scope="col">#</th>
                <th class="col-1 text-center" scope="col">Товаров</th>
                <th class="col-2 text-center" scope="col">Статус</th>
                <th class="col-2 text-center" scope="col">Сумма</th>
                <th class="col-3 text-center" scope="col">Дата</th>
                <th class="col-3 text-center" scope="col"></th>
            </tr>
        </thead>
        <tbody>
            @foreach($orders as $order)
                <tr>
                    <th class="text-center" scope="row">{{ $order->id }}</th>
                    <td class="text-center">{{ count($order->cart) }}</td>
                    <td class="text-center">{{ $order->status }}</td>
                    <td class="text-center">{{ $order->summ }} ₽</td>
                    <td class="text-center">{{ $order->created_at }}</td>
                    <td class="text-center">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#orderModal{{ $order->id }}">
                            <i class="bi bi-eye"></i> Просмотр
                        </button>
                        <div class="modal fade" id="orderModal{{ $order->id }}" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="orderModalLabel">Заказ №{{ $order->id }}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Имя:</th>
                                                    <td>{{ $order->name }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Фамилия:</th>
                                                    <td>{{ $order->surname }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email:</th>
                                                    <td>{{ $order->email }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Телефон:</th>
                                                    <td>{{ $order->phone }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Адрес:</th>
                                                    <td>{{ $order->street }}, д. {{ $order->home }}, кв. {{ $order->room }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Комментарий:</th>
                                                    <td>{{ $order->comment }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Доставка:</th>
                                                    <td>{{ $order->delivery }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Оплата:</th>
                                                    <td>{{ $order->payment }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Сумма:</th>
                                                    <td>{{ $order->summ }}₽</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Статус:</th>
                                                    <td>{{ $order->status }}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Промокод:</th>
                                                    @if ($order->promocode)
                                                        <td>{{ $order->promocode->code }}({{ $order->promocode->discount }}%)</td>
                                                    @else
                                                        <td></td>
                                                    @endif
                                                </tr>
                                            </tbody>
                                        </table>
                                        <h3 class="h3 text-center">Товары</h3>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Название</th>
                                                    <th scope="col">Размер</th>
                                                    <th scope="col">Количество</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($order->cart as $product)
                                                    <tr>
                                                        <th class="align-middle" scope="col">{{ $product->product->id }}</th>
                                                        <td class="align-middle">
                                                            <p>Артикул: {{ $product->product->article }}</p>
                                                            <p>{{ $product->product->name }}</p>
                                                            <p>{{ $product->product->color }}</p>
                                                        </td>
                                                        <td class="align-middle">{{ $product->size }}</td>
                                                        <td class="align-middle">{{ $product->quantity }} шт.</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="{{ route('admin_complete_order', $order->id) }}" id="complete{{ $order->id }}" method="post">
                                            @csrf
                                        </form>
                                        <form action="{{ route('admin_cancel_order', $order->id) }}" id="cancel{{ $order->id }}" method="post">
                                            @csrf
                                        </form>
                                        <button class="btn btn-danger" onclick="document.getElementById('cancel{{ $order->id }}').submit()">Отменен</button>
                                        <button class="btn btn-primary" onclick="document.getElementById('complete{{ $order->id }}').submit()">Завершен</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
