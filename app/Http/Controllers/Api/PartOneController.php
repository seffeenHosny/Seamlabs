<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PartOneController extends Controller
{
    function gitCountWithoutFive($start, $end) {
        return response()->json(['status'=>true , 'addresses'=>[] , 'message'=>'sjsjsj ']);

        if ($end < $start) {
            return 0; // If the end is smaller than the start, return 0
        }

        $count = abs($end - $start) + 1;

        if ($start < 0 && $end >= 0) {
            // If the range includes 0, split it into two ranges and sum the counts
            return  $this->gitCountWithoutFive($start, -1) + $this->gitCountWithoutFive(0, $end);
        } elseif ($end < 0) {
            // If both start and end are negative, swap them and return the count for the positive range
            return $this->gitCountWithoutFive(-$end, -$start);
        } else {
            // If both start and end are positive, calculate the count using mathematical formulas
            $count_start = $this->countNumbersWithout5UpTo($start - 1);
            $count_end = $this->countNumbersWithout5UpTo($end);
            return $count - ($count_end - $count_start);
        }

    }
    
    function countNumbersWithout5UpTo($num) {
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

    function getAlphabeticIndex($input_string) {
        $input_string = strtoupper($input_string); // Convert to uppercase
        $index = 0; // Initialize index
        $length = strlen($input_string); // Get length of input string
    
        // Loop through each character of the input string
        for ($i = 0; $i < $length; $i++) {
            $char = ord($input_string[$i]) - 64; // Get ASCII value of character and subtract 64 to get 1-based index
            $index += $char * pow(26, $length - $i - 1); // Calculate index based on position of character
        }
    
        return $index;
    }

    function minimizeSteps() {
        $N = request('N');
        $Q = request('Q');
        
        $result = [];

        // Iterate through each element in the array Q
        for ($i = 0; $i < $N; $i++) {
            $steps = 0;
            $X     = $Q[$i];

            // Keep reducing X until it becomes 0
            while ($X > 0) {
                // Check if we can perform operation 1 on X
                $a = $b = 0;
                for ($j = 2; $j <= sqrt($X); $j++) {
                    if ($X % $j == 0) {
                        $a = $j;
                        $b = $X / $j;
                        break;
                    }
                }

                if ($a != 0 && $b != 0) {
                    $X = max($a, $b);
                } else {
                    $X--;
                }

                $steps++;
            }

            $result[] = $steps;
        }

        return $result;
    }

}
