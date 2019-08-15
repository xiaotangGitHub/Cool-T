<?php
/**
 * Desc  ：AdminLogPass.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/5/20
 */

namespace app\admin\model;


class AdminLogPass extends Base
{
    //请求限制 10分钟内只能请求三次初始化密码
    static private $betweenTime = 600;
    static private $requestNum = 3;

    /**
     * 添加日志
     * @param $data
     */
    public static function add( $data )
    {
        $data['create_time'] = time();
        self::insert( $data );
    }

    /**
     * 请求限制
     * @param $admin_id
     * @return bool
     */
    public static function requestNum( $admin_id )
    {
        //where条件
        $end_time = time();
        $start_time = $end_time - self::$betweenTime;
        $count = self::where( 'admin_id', $admin_id )->whereBetweenTime( 'create_time', $start_time, $end_time )->count();
        if( $count < self::$requestNum ){
            return true;
        }else{
            return false;
        }
    }
}