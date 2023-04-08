<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes([
    'register' => false,
]);

// Pages
Route::get('/', 'HomeController@index')->name('home');
Route::get('/catalog/new', 'CatalogController@new')->name('catalog-new');
Route::get('/catalog/{categorySlug?}', 'CatalogController@index')->name('catalog');
Route::get('/product/{productSlug}', 'ProductController@index')->name('product');
Route::get('/cart', 'CartController@index')->name('cart');
Route::get('/return', 'ReturnController@index')->name('return');

Route::get('/artisan', function (){
    Artisan::call('storage:link');
});

// Admin
Route::prefix('admin')->middleware('auth')->group(function (){
    Route::get('/', 'AdminController@index')->name('admin_home');

    Route::get('/settings/{save?}', 'AdminController@settings')->name('admin_settings');
    Route::post('/settings/save-contacts', 'SettingController@saveSettings')->name('admin_contacts_save');
    Route::post('/settings/save-home', 'SettingController@saveSettingsHome')->name('admin_home_save');

    Route::post('/settings/save-promocode/{promocode}', 'PromocodeController@savePromocode')->name('admin_promocode_save');
    Route::post('/settings/add-promocode', 'PromocodeController@addPromocode')->name('admin_promocode_add');
    Route::delete('/settings/del-promocode/{promocode}', 'PromocodeController@deletePromocode')->name('admin_promocode_delete');

    Route::get('/sizes/{save?}', 'SizeController@index')->name('admin_sizes');
    Route::post('/add-size', 'SizeController@createSize')->name('admin_add_size');
    Route::delete('/delete-size/{size}', 'SizeController@deleteSize')->name('admin_delete_size');

    Route::get('/categories/{page?}', 'CategoryController@categories')->name('admin_categories');
    Route::get('/add-category/{save?}', 'CategoryController@addCategory')->name('admin_add_category');
    Route::get('/update-category/{category}/{update?}', 'CategoryController@updateCategoryPage')->name('admin_update_page_category');
    route::post('/add-category', 'CategoryController@createCategory')->name('admin_create_category');
    route::post('/update-category/{category}', 'CategoryController@updateCategory')->name('admin_update_category');
    route::delete('/delete-category/{category}', 'CategoryController@deleteCategory')->name('admin_delete_category');

    Route::get('/products/{page?}', 'ProductController@products')->name('admin_products');
    Route::get('/add-product/{save?}', 'ProductController@addProduct')->name('admin_add_product');
    Route::get('/update-product/{productId}/{update?}', 'ProductController@updateProductPage')->name('admin_update_page_product');
    route::post('/add-product', 'ProductController@createProduct')->name('admin_create_product');
    route::post('/update-product/{product}', 'ProductController@updateProduct')->name('admin_update_product');
    route::delete('/delete-product/{product}', 'ProductController@deleteProduct')->name('admin_delete_product');

    Route::get('/orders', 'OrderController@orders')->name('admin_orders');
    Route::post('/complete-order/{order}', 'OrderController@completeOrder')->name('admin_complete_order');
    Route::post('/cancel-order/{order}', 'OrderController@cancelOrder')->name('admin_cancel_order');
});
