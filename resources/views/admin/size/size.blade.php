@extends('layouts.admin')

@section('content')
    <h1 class="h1 mb-4">Размеры</h1>

    @if ($save)
        <div class="alert alert-success" role="alert">
            Размер успешно сохранен!
        </div>
    @endif

    <form action="{{ route('admin_add_size') }}" class="mb-4" method="post">
        @csrf
        <div class="form-group mb-2">
            <label for="sizeName">Название<span style="color: red">*</span></label>
            <input type="text" name="name" class="form-control" id="sizeName" placeholder="Название" required>
        </div>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th class="text-center" scope="col">#</th>
            <th scope="col">Название</th>
            <th class="text-center" scope="col">Действия</th>
        </tr>
        </thead>
        <tbody>
            @foreach($sizes as $size)
                <tr>
                    <th class="col-1 text-center" scope="row">{{ $size->id }}</th>
                    <td class="col">{{ $size->name }}</td>
                    <td class="col-1 text-center">
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#removeModal{{ $size->id }}">
                            <i class="bi bi-x-square-fill"></i>
                        </button>
                        <div class="modal fade" id="removeModal{{ $size->id }}" tabindex="-1" aria-labelledby="removeModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="removeModalLabel">{{ $size->name }}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Вы действительно хотите удалить размер?
                                    </div>
                                    <div class="modal-footer">
                                        <form action="/admin/delete-size/{{ $size->id }}" method="POST">
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
@endsection
