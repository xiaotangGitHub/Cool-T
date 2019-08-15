<?php
/**
 * Desc  ：Admin.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/8
 */

namespace app\admin\validate;


use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        'user_name' =>  'require',
        'password'  =>  'require',
        'email'     =>  'require',
    ];

    protected $message = [
        'user_name.require' => '请输入账号,user_name',
        'user_name.unique'  => '账号已存在,user_name',
        'password.require'  => '请输入密码,password',
        'email.require'     => '请输入邮箱,email',
        'email.unique'      => '邮箱已存在,email',
    ];
}