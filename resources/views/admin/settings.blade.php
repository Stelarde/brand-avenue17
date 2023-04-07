@extends('layouts.admin')

@section('content')
    <h1 class="h1">Настройки</h1>
    @if ($save)
        <div class="alert alert-success" role="alert">
            Настройки успешно сохранены!
        </div>
    @endif
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="contacts-tab" data-bs-toggle="tab" data-bs-target="#contacts" type="button" role="tab" aria-controls="contacts" aria-selected="true">
                Контакты
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">
                Главная страница
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="promocode-tab" data-bs-toggle="tab" data-bs-target="#promocode" type="button" role="tab" aria-controls="promocode" aria-selected="false">
                Промокоды
            </button>
        </li>
    </ul>
        <div class="tab-content mt-4" id="myTabContent">
            <div class="tab-pane fade show active" id="contacts" role="tabpanel" aria-labelledby="contacts-tab">
                <form action="{{ route('admin_contacts_save') }}" method="post" id="settingsForm">
                    @csrf
                    @foreach($settings as $setting)
                        @if ($setting->file !== 1)
                            <div class="form-group mb-2">
                                <label for="contacts{{ $setting->key }}">{{ $setting->title }}</label>
                                <input type="text" name="{{ $setting->key }}" class="form-control" id="contacts{{ $setting->key }}" placeholder="{{ $setting->title }}" value="{{ $setting->value }}">
                            </div>
                        @endif
                    @endforeach
                    <button class="btn btn-primary">Сохранить</button>
                </form>
            </div>
            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                <form action="{{ route('admin_home_save') }}" method="post" id="homeForm" enctype="multipart/form-data">
                    @csrf
                    @foreach($settings as $setting)
                        @if ($setting->file === 1)
                            <div class="form-group mb-2 d-flex flex-column">
                                @if ($setting->value)
                                    <img src="/storage/settings/{{ $setting->value }}" alt="{{ $setting->title }}" width="100px" height="100px" style="object-fit: cover" class="mb-1">
                                @endif
                                <label for="home{{ $setting->key }}">{{ $setting->title }}</label>
                                <input type="file" name="{{ $setting->key }}" class="form-control" id="home{{ $setting->key }}" value="{{ $setting->value }}">
                            </div>
                        @endif
                    @endforeach
                    <button class="btn btn-primary">Сохранить</button>
                </form>
            </div>
            <div class="tab-pane fade" id="promocode" role="tabpanel" aria-labelledby="promocode-tab">
                <h2 class="h2 mb-2">Добавить промокод</h2>
                <form action="{{ route('admin_promocode_add') }}" method="post" id="promocodeAddForm" class="mb-4">
                    @csrf
                    <div class="form-group mb-2">
                        <label for="promoCode">Код<span style="color: red">*</span></label>
                        <input type="text" name="code" class="form-control" id="promoCode" placeholder="Промокод" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="promoDiscount">Скидка (в процентах)<span style="color: red">*</span></label>
                        <input type="number" name="discount" class="form-control" id="promoDiscount" placeholder="Скидка" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="promoUses">Количество использований<span style="color: red">*</span></label>
                        <input type="number" name="uses" class="form-control" id="promoUses" placeholder="Количество использований" required>
                    </div>
                    <button class="btn btn-primary">Добавить</button>
                </form>
                <h2 class="h2 mb-2">Список промокодов</h2>
                @foreach($promocodes as $promocode)
                    <form action="{{ route('admin_promocode_save', ['promocode' => $promocode->id]) }}" method="post" id="promocodeEditForm{{ $promocode->id }}">
                        @csrf
                        <div class="form-group mb-2">
                            <label for="promoCode{{ $promocode->id }}">Код</label>
                            <input type="text" name="code" class="form-control" id="promoCode{{ $promocode->id }}" placeholder="Промокод" value="{{ $promocode->code }}">
                        </div>
                        <div class="form-group mb-2">
                            <label for="promoDiscount{{ $promocode->id }}">Скидка (в процентах)</label>
                            <input type="number" name="discount" class="form-control" id="promoDiscount{{ $promocode->id }}" placeholder="Скидка" value="{{ $promocode->discount }}">
                        </div>
                        <div class="form-group mb-2">
                            <label for="promoUses{{ $promocode->id }}">Количество использований</label>
                            <input type="number" name="uses" class="form-control" id="promoUses{{ $promocode->id }}" placeholder="Количество использований" value="{{ $promocode->uses }}">
                        </div>
                    </form>
                    <div class="d-flex justify-content-start mb-4">
                        <button onclick="document.getElementById('promocodeEditForm{{ $promocode->id }}').submit()" class="btn btn-primary" style="margin-right: 8px">Сохранить</button>
                        <form class="d-none" action="{{ route('admin_promocode_delete', ['promocode' => $promocode->id]) }}" id="promocodeDeleteForm{{ $promocode->id }}" method="POST">
                            @csrf
                            <input type="hidden" name="_method" value="DELETE">
                        </form>
                        <button onclick="document.getElementById('promocodeDeleteForm{{ $promocode->id }}').submit()" class="btn btn-danger">Удалить</button>
                    </div>
                @endforeach
            </div>
        </div>
@endsection
