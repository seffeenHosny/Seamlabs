<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MenuItemRequest;
use App\Http\Resources\MenuItemResource;
use App\Models\MenuItem;
use Illuminate\Http\Request;

class MenuItemController extends Controller
{
    public function index(){
        $menu_items = MenuItem::all();

        return response()->json([
            'message' => 'successfully',
            'menu_items' => MenuItemResource::collection($menu_items),
        ]);
    }

    public function store(MenuItemRequest $request){
        $menu_item = MenuItem::create($request->validated());

        return response()->json([
            'message' => 'Menu Item created successfully',
            'menu_item' => new MenuItemResource($menu_item),
        ]);
    }
}
