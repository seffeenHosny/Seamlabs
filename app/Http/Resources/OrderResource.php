<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $arr = [
            'id'=>$this->id,
            'order_type'=>$this->order_type,
            'customer_name'=>$this->customer_name,
            'customer_phone'=>$this->customer_phone,
            'table_number'=>$this->table_number,
            'waiter_name'=>$this->waiter_name,
            'delivery_fees'=>$this->delivery_fees,
            'service_charge'=>$this->service_charge,
            'total_price'=>$this->total_price,
        ];

        if($this->relationLoaded('order_items')){
            $arr['order_items'] = OrderItemResource::collection($this->order_items);
        }

        return $arr;
    }
}
