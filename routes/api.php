<?php

use App\Http\Controllers\Api\GetAlphabeticIndexController;
use App\Http\Controllers\Api\GetCountWithoutFiveController;
use App\Http\Controllers\Api\MenuItemController;
use App\Http\Controllers\Api\MinimizeStepsController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\PartOneController;
use App\Http\Requests\GetCountWithoutFiveRequest;
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
Route::get('git_count_without_five' , [GetCountWithoutFiveController::class , 'gitCountWithoutFive']);
Route::get('getAlphabeticIndex' , [GetAlphabeticIndexController::class , 'getAlphabeticIndex']);
Route::get('minimizeSteps' , [MinimizeStepsController::class , 'minimizeSteps']);


Route::get('/orders', [OrderController::class , 'index']);
Route::post('/orders', [OrderController::class , 'store']);
Route::get('/menu-items', [MenuItemController::class , 'index']);
Route::post('/menu-items', [MenuItemController::class , 'store']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
