<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Product;
use App\ProductImage;
use App\ProductSize;
use App\ProductToCategory;
use App\Size;

class ProductController extends Controller
{
    public function index($productSlug)
    {
        $product = Product::with(['images', 'sizes', 'categories'])->where('slug', $productSlug)->firstOrFail();
        $product->views ++;
        $product->update();

        if (isset($product->seo_title)){
            $title = $product->seo_title;
        } else {
            $title = $product->name;
        }
        $description = $product->seo_desc;

        return view('product', [
            'product' => $product,
            'title' => $title,
            'description' => $description
        ]);
    }

    public function products($page = 1)
    {
        $productsCount = Product::count();
        $pages = $productsCount / 20;

        $products = Product::with('images')->skip(20 * ($page - 1))->take(20)->get();

        return view('admin.product.product', [
            'products' => $products,
            'page' => $page,
            'pages' => $pages
        ]);
    }

    public function addProduct($save = false)
    {
        $categories = Category::get();
        $sizes = Size::get();

        return view('admin.product.addProduct', [
            'save' => $save,
            'categories' => $categories,
            'sizes' => $sizes
        ]);
    }

    public function createProduct(Request $request)
    {
        $request->validate([
            'slug' => 'unique:products'
        ]);

        $product = $request->toArray();
        $product = Product::create($product);

        $img = new ProductImage();
        $img->product_id = $product->id;

        for ($i = 1; $i <= 10; $i++){
            if ($request->file('img'.$i) !== NULL){
                $extension = $request->file('img'.$i)->getClientOriginalExtension();
                $fileNameToStore = time().$i.'.'.$extension;
                $request->file('img'.$i)->storeAs('public/products',$fileNameToStore);
                $img['img'.$i] = $fileNameToStore;
            }
        }

        $img->save();


        foreach ($request->productCategory as $category){
            $productToCategory = new ProductToCategory();
            $productToCategory->product_id = $product->id;
            $productToCategory->category_id = $category;
            $productToCategory->save();
        }

        foreach ($request->productSize as $size){
            $productSize = new ProductSize();
            $productSize->product_id = $product->id;
            $productSize->name = $size;
            $productSize->save();
        }

        return redirect()->route('admin_add_product', ['save' => true]);
    }

    public function deleteProduct(Product $product)
    {
        ProductImage::where('product_id', $product->id)->delete();
        ProductSize::where('product_id', $product->id)->delete();
        ProductToCategory::where('product_id', $product->id)->delete();

        $product->delete();
        return redirect()->route('admin_products', ['save' => true]);
    }

    public function updateProductPage($productId, $update = false)
    {
        $product = Product::with([
            'images',
            'sizes',
            'categories'
        ])->find($productId);

        $categories = Category::get();

        $sizes = Size::get();

        return view('admin.product.updateProduct', [
            'product' => $product,
            'update' => $update,
            'categories' => $categories,
            'sizes' => $sizes
        ]);
    }

    public function updateProduct(Product $product, Request $request)
    {
        $images = ProductImage::where('product_id', $product->id)->get();
        foreach ($images as $image){
            $i = explode('.', $image->img);
            $i = substr($i[0], -1);

            if ($request->file('img'.$i) !== NULL) {
                $image->delete();
            }
        }

        $img = ProductImage::where('product_id', $product->id)->first();

        for ($i = 1; $i <= 10; $i++){
            if ($request->file('img'.$i) !== NULL){
                $extension = $request->file('img'.$i)->getClientOriginalExtension();
                $fileNameToStore = time().$i.'.'.$extension;
                $request->file('img'.$i)->storeAs('public/products',$fileNameToStore);
                $img['img'.$i] = $fileNameToStore;
            }
        }

        $img->update();

        ProductToCategory::where('product_id', $product->id)->delete();

        foreach ($request->productCategory as $category){
            $productToCategory = new ProductToCategory();
            $productToCategory->product_id = $product->id;
            $productToCategory->category_id = $category;
            $productToCategory->save();
        }

        ProductSize::where('product_id', $product->id)->delete();

        foreach ($request->productSize as $size){
            $productSize = new ProductSize();
            $productSize->product_id = $product->id;
            $productSize->name = $size;
            $productSize->save();
        }

        $productArray = $request->toArray();
        $product->update($productArray);

        return redirect()->route('admin_update_page_product', ['productId' => $product->id, 'update' => true]);
    }

    public function getNewProducts()
    {
        return Product::with('images')->orderBy('id', 'desc')->limit(16)->get();
    }

    public function getProducts($category, $page)
    {
        if ($category == 0){
            return Product::with('images')->skip(8 * $page)->take(8)->get();
        } else if ($category == 1){
            return Product::with('images')->orderBy('id', 'desc')->limit(16)->skip(8 * $page)->take(8)->get();
        } else {
            $products = [];
            $productCategories = ProductToCategory::where('category_id', $category)->skip(8 * $page)->take(8)->get();

            foreach ($productCategories as $item){
                $product = Product::with('images')->find($item->product_id);
                array_push($products, $product);
            }

            return $products;
        }
    }
}
