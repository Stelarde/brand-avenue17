@extends('layouts.admin')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h1">Продукты</h1>
        <a href="{{ route('admin_add_product') }}" class="btn btn-primary">Добавить</a>
    </div>
    <table class="table table-bordered mb-2">
        <thead>
            <tr>
                <th class="text-center" scope="col">#</th>
                <th scope="col">Изображение</th>
                <th scope="col">Название</th>
                <th class="text-center" scope="col">Просмотры</th>
                <th class="text-center" scope="col">Действия</th>
            </tr>
        </thead>
        <tbody>
            @foreach($products as $product)
                <tr>
                    <th class="col-1 text-center" scope="row">{{ $product->id }}</th>
                    <td class="col-1 text-center">
                        <img src="/storage/products/{{ $product->images->img1 }}" alt="{{ $product->name }}" height="50px" style="object-fit: cover">
                    </td>
                    <td class="col">{{ $product->name }}</td>
                    <td class="col-1 text-center">{{ $product->views }}</td>
                    <td class="col-1 text-center">
                        <a href="{{route('admin_update_page_product', $product->id)}}" class="btn btn-primary">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#removeModal{{ $product->id }}">
                            <i class="bi bi-x-square-fill"></i>
                        </button>
                        <div class="modal fade" id="removeModal{{ $product->id }}" tabindex="-1" aria-labelledby="removeModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="removeModalLabel">{{ $product->name }}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Вы действительно хотите удалить товар?
                                    </div>
                                    <div class="modal-footer">
                                        <form action="/admin/delete-product/{{ $product->id }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="_method" value="DELETE">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                            <button type="submit" class="btn btn-danger">Да</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    @if ($pages > 1)
        <nav aria-label="Page navigation">
            <ul class="pagination">
                @if ($page != 1)
                    <li class="page-item">
                        <a class="page-link" href="{{ route('admin_products', ['page' => $page - 1]) }}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                @endif
                @for ($i = 1; $i <= $pages; $i++)
                    <li class="page-item @if ($i == $page) active @endif"><a class="page-link" href="{{ route('admin_products', ['page' => $i]) }}">{{ $i }}</a></li>
                @endfor
                @if ($page != $pages)
                    <li class="page-item">
                        <a class="page-link" href="{{ route('admin_products', ['page' => $page + 1]) }}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                @endif
            </ul>
        </nav>
    @endif
@endsection
