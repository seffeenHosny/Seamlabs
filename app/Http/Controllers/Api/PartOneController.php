<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PartOneController extends Controller
{
    // public function gitCountWithoutFive($first_number , $last_number){
    //     // $count = abs($last_number - $first_number) + 1; // Total numbers between start and end
    //     // $countOfFive = substr_count(join('', range($first_number, $last_number)), '5'); // Numbers with 5 in the ones place
    //     // $countWithoutFive = $count - $countOfFive; // Numbers without 5
    //     // return $countWithoutFive;
    //     $count = 0; // Initialize count to 0

    //     for ($i = $first_number; $i <= $last_number; $i++) {
    //         if (strpos(strval($i), '5') === false) {
    //             // If the number does not contain a 5, increment the count
    //             $count++;
    //         }
    //     }

    //     return $count;
    // }

    function gitCountWithoutFive($start, $end) {
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
        $steps = array(); // Initialize array to store the number of steps for each element
    
        // Loop through each element in the input array
        for ($i = 0; $i < $N; $i++) {
            $x = $Q[$i]; // Get the value of the current element
            $count = 0; // Initialize the number of steps for this element to 0
    
            // Keep reducing x until it becomes 0
            while ($x > 0) {
                $factors = array(); // Initialize array to store the factors of x
                $sqrt = sqrt($x); // Calculate the square root of x
    
                // Find all the factors of x
                for ($j = 2; $j <= $sqrt; $j++) {
                    if ($x % $j == 0) {
                        $factors[] = $j;
                        if ($j != $x / $j) {
                            $factors[] = $x / $j;
                        }
                    }
                }
    
                if (count($factors) == 0) {
                    // If x is a prime number, subtract 1 from x
                    $x--;
                } else {
                    // Find the factor that results in the minimum number of steps
                    $min_steps = PHP_INT_MAX;
                    foreach ($factors as $factor) {
                        $steps1 = $x - $factor;
                        $steps2 = 1 + $count - $this->minimizeSteps(1, array($factor))[0];
                        $min_steps = min($min_steps, max($steps1, $steps2));
                    }
    
                    // Update x and the number of steps
                    $x = $min_steps == $x ? $x - 1 : $min_steps;
                    $count++;
                }
            }
    
            // Add the number of steps for this element to the result array
            $steps[] = $count;
        }
    
        return $steps;
    }
    


}
