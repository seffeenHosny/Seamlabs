<?php

namespace App\Http\Resources;

use App\Http\Requests\OrderRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderItemResource extends JsonResource
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
            'quantity'=>$this->quantity,
            'unit_price'=>$this->unit_price,
            'name'=>$this->menu_item->name
        ];

        if($this->relationLoaded('order')){
            $arr['order'] = new OrderResource($this->order);
        }

        return $arr;
    }
}
