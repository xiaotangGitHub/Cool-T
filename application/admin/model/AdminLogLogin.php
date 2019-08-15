<?php
/**
 * Desc  ：AdminLogLogin.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/5/20
 */

namespace app\admin\model;


class AdminLogLogin extends Base
{
    /**
     * 添加日志
     * @param $data
     */
    public static function add( $data )
    {
        $data['create_time'] = time();
        self::insert( $data );
    }
}