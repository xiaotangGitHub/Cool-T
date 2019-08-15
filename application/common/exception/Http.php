<?php
/**
 * Desc  ：Http.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/6/4
 */

namespace app\common\exception;


use Exception;
use think\Db;
use think\exception\Handle;

class Http extends Handle
{
    public function render( Exception $e )
    {
        $log = [
            'code'  =>  $e->getCode(),
            'message'   =>  $e->getMessage(),
            'file'  =>  $e->getFile(),
            'line'  =>  $e->getLine(),
            'create_time'   =>  time()
        ];
        Db::name( 'system_exception' )->insert( $log );
        // 其他错误交给系统处理
        return parent::render($e);
    }
}