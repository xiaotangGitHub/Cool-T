<?php
/**
 * Desc  ：api.php       API接口
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/22
 */
return [
    //验证码
    'create_captcha'        =>  [ 'api/Captcha/create', [ 'method' => 'get' ] ],
    //token
    'create_token'          =>  [ 'api/Token/create', [ 'method' => 'get' ] ],
    //Mail邮箱路由
    'send_mail'             =>  [ 'api/Mail/send', [ 'method' => 'post' ] ],
    //天气接口
    'get_weather'           =>  [ 'api/Weather/get', [ 'method' => 'get' ] ],
    //返回码信息口令
    'return_code_command'   =>  [ 'api/CodeCommand/get', [ 'method' => 'post' ] ],
];