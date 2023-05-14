<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MenuItemRequest;
use App\Http\Resources\MenuItemResource;
use App\Services\MenuItemService;
use Illuminate\Http\Request;

class MenuItemController extends Controller
{
    private MenuItemService $menuItemService;

    public function __construct(){
        $this->menuItemService = app(MenuItemService::class);
    }
    
    public function index(){
        $menu_items = $this->menuItemService->index();
        return message(true , resource_collection(MenuItemResource::collection($menu_items)) , 'orders' , 200);
    }

    public function store(MenuItemRequest $request){
        $menu_item = $this->menuItemService->store($request);

        return message(true , new MenuItemResource($menu_item) , 'Menu Item created successfully' , 200);
    }
}
