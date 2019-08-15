<?php
/**
 * Desc  ：menu.php
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/30
 */

namespace app\admin\validate;


use think\Validate;

class Menu extends Validate
{
    protected $rule = [
        'name'       => 'require|max:20',
        'module'     => 'require',
        'controller' => 'require',
        'action'     => 'require',
    ];

    protected $message =[
        'name.require'  => '请填写菜单名,name',
        'name.max'      => '菜单名最多20位,name',
        'module.require'    => '请输入模块名,module',
        'controller.require'=> '请输入控制器名,controller',
        'action.require'    => '请输入方法名,action',
    ];
}