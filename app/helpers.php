<?php


function resource_collection($resource): array
{
    return json_decode($resource->response()->getContent(), true) ?? [];
}

function message($status = true, $data = [], $message = '', $code = 200)
{
    return response()->json([
        'status' => $status,
        'data' => $data ?? [],
        'message' => $message,
        'code' => $code,
    ],$code);
}

