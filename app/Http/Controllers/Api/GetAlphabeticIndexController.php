<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\GetAlphabeticIndexRequest;
use Illuminate\Http\Request;

class GetAlphabeticIndexController extends Controller
{
    public function getAlphabeticIndex(GetAlphabeticIndexRequest $request) {
        $input_string = strtoupper($request->input_string); // Convert to uppercase
        $index = 0; // Initialize index
        $length = strlen($input_string); // Get length of input string
    
        // Loop through each character of the input string
        for ($i = 0; $i < $length; $i++) {
            $char = ord($input_string[$i]) - 64; // Get ASCII value of character and subtract 64 to get 1-based index
            $index += $char * pow(26, $length - $i - 1); // Calculate index based on position of character
        }
    
        return $index;
    }
}
