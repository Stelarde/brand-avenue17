@extends('layouts.admin')

@section('content')
    <h1 class="h1 mb-4">Изменить категорию</h1>

    @if ($update)
        <div class="alert alert-success" role="alert">
            Категория успешно обновлена!
        </div>
    @endif

    <form action="{{ route('admin_update_category', $category->id) }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group mb-2 d-flex flex-column">
            <label for="categoryImg">Изображение<span style="color: red">*</span></label>
            <input value="{{$category->img}}" type="file" name="img" class="form-control-file" id="categoryImg">
        </div>
        <div class="w-100 alert alert-info" role="alert">
            <img src="/storage/categories/{{ $category->img }}" alt="{{ $category->name }}" width="50px" height="50px" style="object-fit: cover">
            <span>{{ $category->img }}</span>
        </div>
        <div class="form-group mb-2">
            <label for="categoryName">Название<span style="color: red">*</span></label>
            <input value="{{$category->name}}" type="text" name="name" class="form-control" id="categoryName" placeholder="Название" required>
        </div>
        <div class="form-group mb-2">
            <label for="categorySlug">URL<span style="color: red">*</span></label>
            <input value="{{$category->slug}}" type="text" name="slug" class="form-control" aria-describedby="urlHelp" id="categorySlug" placeholder="URL" required>
            <small id="urlHelp" class="form-text text-muted">Идентификатор товара для ссылки</small>
        </div>
        <div class="form-group mb-2">
            <label for="categoryDesc">Описание категории</label>
            <textarea class="form-control" name="desc" id="categoryDesc" rows="3" placeholder="Описание">{{ $category->desc }}</textarea>
        </div>
        <h3 class="h3 mt-2 mb-1">SEO</h3>
        <div class="form-group mb-2">
            <label for="categorySeoTitle">Meta заголовок</label>
            <input value="{{ $category->seo_title }}" type="text" name="seo_title" class="form-control" aria-describedby="seotHelp" id="categorySeoTitle" placeholder="Заголовок">
            <small id="seotHelp" class="form-text text-muted">SEO заголовок для поисковиков</small>
        </div>
        <div class="form-group mb-2">
            <label for="categorySeoDesc">Meta описание</label>
            <textarea class="form-control" name="seo_desc" id="categorySeoDesc" aria-describedby="seodHelp" rows="3" placeholder="Описание">{{ $category->seo_desc }}</textarea>
            <small id="seodHelp" class="form-text text-muted">SEO описание для поисковиков</small>
        </div>
        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="1" name="show_in_menu" id="categoryShowInMenu" @if ($category->show_in_menu == 1) checked @endif>
            <label class="form-check-label" for="categoryShowInMenu">
                Отображать категорию в главном меню
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Обновить</button>
    </form>
@endsection
