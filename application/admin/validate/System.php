<?php
/**
 * Desc  ：SystemConfig.php
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/30
 */

namespace app\admin\validate;


use think\Validate;

class System extends Validate
{
    protected $rule = [
        'key'   => 'require',
        'value' => 'require',
        'desc'  => 'require'
    ];

    protected $message = [
        'key.require'   =>  '请填写配置名,key',
        'value.require' =>  '晴填写配置数据',
        'desc.require'  =>  '请填写配置简介,desc',
    ];
}