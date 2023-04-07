<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/get-menu-categories', 'CategoryController@getMenuCategories');
Route::get('/get-settings', 'SettingController@getSettings');
Route::get('/get-top-categories', 'CategoryController@getTopCategories');
Route::get('/get-new-products', 'ProductController@getNewProducts');
Route::get('/get-products/{category}/{page}', 'ProductController@getProducts');
Route::get('/get-category/{category}', 'CategoryController@getCategory');
Route::get('/get-promo/{code}', 'PromocodeController@getPromocode');
Route::post('/create-order', 'OrderController@createOrder');
Route::post('/get-payment-form', 'OrderController@getPaymentForm');
