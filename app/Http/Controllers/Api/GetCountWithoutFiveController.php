<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\GetCountWithoutFiveRequest;
use Illuminate\Http\Request;

class GetCountWithoutFiveController extends Controller
{
    public function gitCountWithoutFive(GetCountWithoutFiveRequest $request) {

        if ($request->end < $request->start) {
            return 0; // If the end is smaller than the start, return 0
        }

        $count = abs($request->end - $request->start) + 1;

        if ($request->start < 0 && $request->end >= 0) {
            // If the range includes 0, split it into two ranges and sum the counts
            return  $this->gitCountWithoutFive($request->start, -1) + $this->gitCountWithoutFive(0, $request->end);
        } elseif ($request->end < 0) {
            // If both start and end are negative, swap them and return the count for the positive range
            return $this->gitCountWithoutFive($request->end * -1, -$request->start);
        } else {
            // If both start and end are positive, calculate the count using mathematical formulas
            $count_start = $this->countNumbersWithout5UpTo($request->start - 1);
            $count_end = $this->countNumbersWithout5UpTo($request->end);
            return $count - ($count_end - $count_start);
        }

    }
    
    public function countNumbersWithout5UpTo($num) {
        if ($num < 0) {
            return 0; // If the number is negative, return 0
        }
    
        $num_str = strval($num); // Convert number to string
        $length = strlen($num_str); // Get length of string
    
        // Calculate count of numbers without 5 up to the highest digit
        $count = ($num_str[0] - ($num_str[0] >= '5')) * pow(9, $length - 1);
    
        // Calculate count of numbers without 5 for each digit of the number
        for ($i = 1; $i < $length; $i++) {
            $count += ($num_str[$i] - ($num_str[$i] > '5')) * pow(9, $length - $i - 1);
            if ($num_str[$i - 1] == '5') {
                $count += ($num_str[$i] - 1) * pow(9, $length - $i - 1);
            }
        }
    
        return $num - $count; // Return the count of numbers with 5 subtracted from the total count
    }
}
