@extends('layouts.admin')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h1">Изменить продукт</h1>
        <button type="button" class="btn btn-primary" onclick="document.getElementById('addProductForm').submit()">Сохранить</button>
    </div>
    @if ($update)
        <div class="alert alert-success" role="alert">
            Продукт успешно обновлен!
        </div>
    @endif
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
                Основное
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="images-tab" data-bs-toggle="tab" data-bs-target="#images" type="button" role="tab" aria-controls="images" aria-selected="false">
                Изображения
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="category-tab" data-bs-toggle="tab" data-bs-target="#category" type="button" role="tab" aria-controls="category" aria-selected="false">
                Категории
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="size-tab" data-bs-toggle="tab" data-bs-target="#size" type="button" role="tab" aria-controls="size" aria-selected="false">
                Размеры
            </button>
        </li>
    </ul>

    <form action="{{ route('admin_update_product', $product->id) }}" id="addProductForm" method="post" enctype="multipart/form-data">
        @csrf
        <div class="tab-content mt-4" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="form-group mb-2">
                    <label for="productName">Название<span style="color: red">*</span></label>
                    <input type="text" name="name" class="form-control" id="productName" value="{{ $product->name }}" placeholder="Название" required>
                </div>
                <div class="form-group mb-2">
                    <label for="productSlug">URL<span style="color: red">*</span></label>
                    <input type="text" name="slug" class="form-control" aria-describedby="urlHelp" value="{{ $product->slug }}" id="productSlug" placeholder="URL" required>
                    <small id="urlHelp" class="form-text text-muted">Идентификатор товара для ссылки</small>
                </div>
                <div class="form-group mb-2">
                    <label for="productPrice">Цена<span style="color: red">*</span></label>
                    <input type="text" name="price" class="form-control" value="{{ $product->price }}" id="productPrice" placeholder="Цена" required>
                </div>
                <div class="form-group mb-2">
                    <label for="productDesc">Описание товара</label>
                    <textarea class="form-control" name="desc" id="productDesc" rows="3" placeholder="Описание">{{ $product->desc }}</textarea>
                </div>
                <div class="form-group mb-2">
                    <label for="productArticle">Артикул</label>
                    <input type="text" name="article" class="form-control" id="productArticle" value="{{ $product->article }}" placeholder="Артикул">
                </div>
                <div class="form-group mb-2">
                    <label for="productColor">Цвет</label>
                    <input type="text" name="color" class="form-control" id="productColor" value="{{ $product->color }}" placeholder="Цвет">
                </div>

                <h3 class="h3 mt-2 mb-1">SEO</h3>
                <div class="form-group mb-2">
                    <label for="productSeoTitle">Meta заголовок</label>
                    <input type="text" name="seo_title" class="form-control" aria-describedby="seotHelp" value="{{ $product->seo_title }}" id="productSeoTitle" placeholder="Заголовок">
                    <small id="seotHelp" class="form-text text-muted">SEO заголовок для поисковиков</small>
                </div>
                <div class="form-group mb-2">
                    <label for="productSeoDesc">Meta описание</label>
                    <textarea class="form-control" name="seo_desc" id="productSeoDesc" aria-describedby="seodHelp" rows="3" placeholder="Описание">{{ $product->seo_desc }}</textarea>
                    <small id="seodHelp" class="form-text text-muted">SEO описание для поисковиков</small>
                </div>
            </div>
            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                @if ($product->images->img1)
                    <img src="/storage/products/{{ $product->images->img1 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg1">Изображение 1</label>
                    <input type="file" name="img1" class="form-control" id="productImg1">
                </div>
                @if ($product->images->img2)
                    <img src="/storage/products/{{ $product->images->img2 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg2">Изображение 2</label>
                    <input type="file" name="img2" class="form-control" id="productImg2">
                </div>
                @if ($product->images->img3)
                    <img src="/storage/products/{{ $product->images->img3 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg3">Изображение 3</label>
                    <input type="file" name="img3" class="form-control" id="productImg3">
                </div>
                @if ($product->images->img4)
                    <img src="/storage/products/{{ $product->images->img4 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg4">Изображение 4</label>
                    <input type="file" name="img4" class="form-control" id="productImg4">
                </div>
                @if ($product->images->img5)
                    <img src="/storage/products/{{ $product->images->img5 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg5">Изображение 5</label>
                    <input type="file" name="img5" class="form-control" id="productImg5">
                </div>
                @if ($product->images->img6)
                    <img src="/storage/products/{{ $product->images->img6 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg6">Изображение 6</label>
                    <input type="file" name="img6" class="form-control" id="productImg6">
                </div>
                @if ($product->images->img7)
                    <img src="/storage/products/{{ $product->images->img7 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg7">Изображение 7</label>
                    <input type="file" name="img7" class="form-control" id="productImg7">
                </div>
                @if ($product->images->img8)
                    <img src="/storage/products/{{ $product->images->img8 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg8">Изображение 8</label>
                    <input type="file" name="img8" class="form-control" id="productImg8">
                </div>
                @if ($product->images->img9)
                    <img src="/storage/products/{{ $product->images->img9 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg9">Изображение 9</label>
                    <input type="file" name="img9" class="form-control" id="productImg9">
                </div>
                @if ($product->images->img10)
                    <img src="/storage/products/{{ $product->images->img10 }}" width="50px" alt="{{ $product->name }}">
                @endif
                <div class="form-group mb-2 d-flex flex-column">
                    <label class="form-label" for="productImg10">Изображение 10</label>
                    <input type="file" name="img10" class="form-control" id="productImg10">
                </div>
            </div>
            <div class="tab-pane fade" id="category" role="tabpanel" aria-labelledby="category-tab">
                @foreach($categories as $category)
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="productCategory[]"
                            value="{{ $category->id }}"
                            id="productCategory{{ $loop->index }}"
                            @foreach($product->categories as $productCategory)
                                @if ($category->id === $productCategory->category_id)
                                        checked
                                @endif
                            @endforeach
                        >
                        <label class="form-check-label" for="productCategory{{ $loop->index }}">
                            {{ $category->name }}
                        </label>
                    </div>
                @endforeach
            </div>
            <div class="tab-pane fade" id="size" role="tabpanel" aria-labelledby="size-tab">
                @foreach($sizes as $size)
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="productSize[]"
                            value="{{ $size->name }}"
                            id="productSize{{ $size->id }}"
                            @foreach($product->sizes as $productSize)
                                @if ($size->name === $productSize->name)
                                    checked
                                @endif
                            @endforeach
                        >
                        <label class="form-check-label" for="productSize{{ $size->id }}">
                            {{ $size->name }}
                        </label>
                    </div>
                @endforeach
            </div>
        </div>
    </form>
@endsection
