<?php

namespace App\Services;

use App\Http\Requests\OrderRequest;
use App\Models\MenuItem;
use App\Models\Order;
use App\Models\OrderItem;
use Exception;

class OrderService
{
    public function index(){
        return Order::with('order_items')->orderByDesc('id')->simplePaginate(10);
    }

    public function store(OrderRequest $request){
        $order = $this->createOrder($request);

        $totalPrice = $this->addItemsToOrder($request->items , $order);
    
        $finalTotalPrice = $this->checkOrderType($request , $order , $totalPrice);

        $order->update(['total_price' => $finalTotalPrice]);

        return $order;
    }

    private function createOrder($request){
        return Order::create([
            'order_type' => $request->order_type,
            'customer_name' => $request->customer_name,
        ]);
    }

    private function addItemsToOrder($items , $order){
        $totalPrice = 0;
    
        foreach ($items as $item) {
            $menuItem = MenuItem::find($item['menu_item_id']);

            OrderItem::create([
                'order_id' => $order->id,
                'menu_item_id' => $menuItem->id,
                'quantity' => $item['quantity'],
                'unit_price' => $menuItem->price,
            ]);

            $totalPrice += $menuItem->price * $item['quantity'];
        }

        return $totalPrice;
    }

    private function checkOrderType($request , $order , $totalPrice){
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

        return $totalPrice;
    }
}
