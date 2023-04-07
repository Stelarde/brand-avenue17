<?php

namespace App\Http\Controllers;

use App\ProductToCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Category;

class CategoryController extends Controller
{
    public function categories($page = 1)
    {
        $categoriesCount = Category::count();
        $pages = $categoriesCount / 20;

        $categories = Category::skip(20 * ($page - 1))->take(20)->get();

        return view('admin.category.category', [
            'categories' => $categories,
            'page' => $page,
            'pages' => $pages
        ]);
    }

    public function addCategory($save = false)
    {
        return view('admin.category.addCategory', [
            'save' => $save
        ]);
    }

    public function createCategory(Request $request)
    {
        $extension = $request->file('img')->getClientOriginalExtension();
        $fileNameToStore = time().'.'.$extension;
        $request->file('img')->storeAs('public/categories',$fileNameToStore);

        $category = $request->toArray();

        if (!isset($request->show_in_menu)){
            $category['show_in_menu'] = 0;
        }

        $category['img'] = $fileNameToStore;

        Category::create($category);
        return redirect()->route('admin_add_category', ['save' => true]);
    }

    public function deleteCategory(Category $category)
    {
        ProductToCategory::where('category_id', $category->id)->delete();
        $category->delete();
        return redirect()->route('admin_categories', ['save' => true]);
    }

    public function updateCategoryPage(Category $category, $update = false)
    {
        return view('admin.category.updateCategory', ['category' => $category, 'update' => $update]);
    }

    public function updateCategory(Category $category, Request $request)
    {
        $categoryArray = $request->toArray();

        if (!isset($request->show_in_menu)){
            $categoryArray['show_in_menu'] = 0;
        }

        if ($request->file('img')) {
            $request->file('img')->storeAs('public/categories',$category->img);
            $categoryArray['img'] = $category->img;
        }

        $category->update($categoryArray);
        return redirect()->route('admin_update_page_category', ['category' => $category->id, 'update' => true]);
    }

    public function getMenuCategories()
    {
        return Category::where('show_in_menu', 1)->get();
    }

    public function getTopCategories()
    {
        return Category::orderBy('views', 'desc')->limit(6)->get();
    }

    public function getCategory($id)
    {
        return Category::find($id);
    }
}
