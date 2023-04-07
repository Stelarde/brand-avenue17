@extends('layouts.admin')

@section('content')
    <h1 class="h1 mb-4">Новая категория</h1>
    @if ($save)
        <div class="alert alert-success" role="alert">
            Категория успешно сохранена!
        </div>
    @endif
    <form action="{{ route('admin_create_category') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group mb-2 d-flex flex-column">
            <label class="form-label" for="categoryImg">Изображение<span style="color: red">*</span></label>
            <input type="file" name="img" class="form-control" id="categoryImg" required>
        </div>
        <div class="form-group mb-2">
            <label for="categoryName">Название<span style="color: red">*</span></label>
            <input type="text" name="name" class="form-control" id="categoryName" placeholder="Название" required>
        </div>
        <div class="form-group mb-2">
            <label for="categorySlug">URL<span style="color: red">*</span></label>
            <input type="text" name="slug" class="form-control" aria-describedby="urlHelp" id="categorySlug" placeholder="URL" required>
            <small id="urlHelp" class="form-text text-muted">Идентификатор товара для ссылки</small>
        </div>
        <div class="form-group mb-2">
            <label for="categoryDesc">Описание категории</label>
            <textarea class="form-control" name="desc" id="categoryDesc" rows="3" placeholder="Описание"></textarea>
        </div>
        <h3 class="h3 mt-2 mb-1">SEO</h3>
        <div class="form-group mb-2">
            <label for="categorySeoTitle">Meta заголовок</label>
            <input type="text" name="seo_title" class="form-control" aria-describedby="seotHelp" id="categorySeoTitle" placeholder="Заголовок">
            <small id="seotHelp" class="form-text text-muted">SEO заголовок для поисковиков</small>
        </div>
        <div class="form-group mb-2">
            <label for="categorySeoDesc">Meta описание</label>
            <textarea class="form-control" name="seo_desc" id="categorySeoDesc" aria-describedby="seodHelp" rows="3" placeholder="Описание"></textarea>
            <small id="seodHelp" class="form-text text-muted">SEO описание для поисковиков</small>
        </div>
        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="1" name="show_in_menu" id="categoryShowInMenu" checked>
            <label class="form-check-label" for="categoryShowInMenu">
                Отображать категорию в главном меню
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
@endsection
