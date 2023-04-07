<!doctype html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Администратор | VICOLO</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                @guest

                @else
                    <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
                        <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                            <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                                <span class="fs-5 d-none d-sm-inline">VICOLO</span>
                            </a>
                            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                                <li class="nav-item">
                                    <a href="{{ route('admin_home') }}" class="nav-link align-middle px-0">
                                        <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Главная</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('admin_orders') }}" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-bag"></i> <span class="ms-1 d-none d-sm-inline">Заказы</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('admin_categories') }}" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-collection"></i> <span class="ms-1 d-none d-sm-inline">Категории</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('admin_products') }}" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-cart"></i> <span class="ms-1 d-none d-sm-inline">Товары</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('admin_sizes') }}" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-clipboard"></i> <span class="ms-1 d-none d-sm-inline">Размеры</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('admin_settings') }}" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-gear"></i> <span class="ms-1 d-none d-sm-inline">Настройки</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('logout') }}" class="nav-link px-0 align-middle" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                        <i class="fs-4 bi-box-arrow-right"></i> <span class="ms-1 d-none d-sm-inline">Выйти</span>
                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            @csrf
                                        </form>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                @endguest
                <div class="col py-3">
                    @yield('content')
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
{{--        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>--}}
{{--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>--}}
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

        <script src="{{ asset('js/admin.js') }}"></script>
    </body>
</html>
