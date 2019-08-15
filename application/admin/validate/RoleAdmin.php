<?php
/**
 * Desc  ：RoleAdmin.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/8
 */

namespace app\admin\validate;


use think\Validate;

class RoleAdmin extends Validate
{
    protected $rule = [
        'name'   =>  'require'
    ];

    protected $message = [
        'name.require' => '请输入角色名,name'
    ];
}