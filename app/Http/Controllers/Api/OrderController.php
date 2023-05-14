<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    private OrderService $orderService;

    public function __construct(){
        $this->orderService = app(OrderService::class);
    }

    public function index(){
        $orders = $this->orderService->index();

        return message(true , resource_collection(OrderResource::collection($orders)) , 'orders' , 200);

    }

    public function store(OrderRequest $request){

        $order = $this->orderService->store($request);
        $order->load('order_items');


        return message(true , new OrderResource($order) , 'Order Item created successfully' , 200);

    }
}
