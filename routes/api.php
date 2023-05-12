<?php

use App\Http\Controllers\Api\PartOneController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::get('git_count_without_five/{first_number}/{last_number}' , [PartOneController::class , 'gitCountWithoutFive']);
Route::get('getAlphabeticIndex/{input_string}' , [PartOneController::class , 'getAlphabeticIndex']);
Route::get('minimizeSteps' , [PartOneController::class , 'minimizeSteps']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
