<?php

namespace App\Services;

use App\Http\Requests\MenuItemRequest;
use App\Models\MenuItem;

class MenuItemService
{
    public function index(){
        return MenuItem::orderByDesc('id')->simplePaginate(10);
    }

    public function store(MenuItemRequest $request){
        return MenuItem::create($request->validated());
    }
}
