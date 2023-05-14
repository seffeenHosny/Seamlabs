<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\MenuItem;
use App\Models\Order;
use App\Models\OrderItem;
use Exception;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index(){
        $orders = Order::with('order_items')->orderByDesc('id')->simplePaginate(10);

        return response()->json([
            'message' => 'orders',
            'orders' => resource_collection(OrderResource::collection($orders)),
        ]);
    }

    public function store(OrderRequest $request){

        $order = Order::create([
            'order_type' => $request->order_type,
            'customer_name' => $request->customer_name,
            'customer_phone' => $request->customer_phone ?? null,
            'table_number' => $request->table_number ?? null,
            'waiter_name' => $request->waiter_name ?? null,
        ]);

        $totalPrice = 0;
    
        foreach ($request->items as $item) {
            $menuItem = MenuItem::find($item['menu_item_id']);

            if (!$menuItem) {
                throw new Exception('Invalid menu item id');
            }

            OrderItem::create([
                'order_id' => $order->id,
                'menu_item_id' => $menuItem->id,
                'quantity' => $item['quantity'],
                'unit_price' => $menuItem->price,
            ]);

            $totalPrice += $menuItem->price * $item['quantity'];
        }

        switch ($request->order_type) {
            case 'delivery':
                $deliveryFees = 5.0;
                $order->update([
                    'customer_phone' => $request->customer_phone,
                    'delivery_fees' => $deliveryFees,
                ]);
                $totalPrice += $deliveryFees;
                break;

            case 'dine-in':
                $serviceCharge = 10.0;

                $order->update([
                    'table_number' => $request->table_number,
                    'waiter_name' => $request->waiter_name,
                    'service_charge' => $serviceCharge,
                ]);

                $totalPrice += $serviceCharge;
                break;

            case 'takeaway':
                // no additional fields or fees
                break;

            default:
                throw new Exception('Invalid order_type');
        }

        $order->update(['total_price' => $totalPrice]);

        return response()->json([
            'message' => 'Order created successfully',
            'order' => new OrderResource($order),
        ]);
    }
}
