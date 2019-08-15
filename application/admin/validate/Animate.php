<?php
/**
 * Desc  ：Animate.php
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/30
 */

namespace app\admin\validate;


use think\Validate;

class Animate extends Validate
{
    protected $rule = [
        'key'   =>  'require',
        'filename' =>  'require'
    ];

    protected $message = [
        'key.require' => '请输入主题名,key',
        'filename.require' => '请输入文件名,filename'
    ];
}