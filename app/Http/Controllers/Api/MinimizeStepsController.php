<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MinimizeStepsController extends Controller
{
    public function minimizeSteps() {
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
