<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'order_type' => 'required|in:dine-in,delivery,takeaway',
            'customer_name' =>  'nullable|required_if:order_type,==,delivery|string|max:255',
            'customer_phone' => 'nullable|required_if:order_type,==,delivery|string|max:20',
            'table_number' => 'nullable|required_if:order_type,==,dine-in|integer',
            'waiter_name' => 'nullable|required_if:order_type,==,dine-in|string|max:255',
            'items' => 'required|array',
            'items.*.menu_item_id' => 'required|exists:menu_items,id',
            'items.*.quantity' => 'required|integer|min:1',
        ];
    }
}
