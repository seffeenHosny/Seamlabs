<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function menu_item(){
        return $this->belongsTo(MenuItem::class);
    }

    public function order(){
        return $this->belongsTo(Order::class);
    }
    
}
