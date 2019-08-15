<?php

//验证签名路由
Route::group('', function(){


})->middleware( 'app\sign\middleware\CheckSign' );

Route::get( 'api', 'api/Api/api' );
