<?php

namespace app\admin\middleware;

use app\common\model\SystemConfig;

/**
 * 后台模块中间件->验证IP地址
 * Class ipAuth
 * @package app\admin\middleware
 */
class ipAuth
{
    /**
     * 验证IP地址
     * @param $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {
        //客户端IP地址
        $client_ip = $request->ip();

        //获取已登陆的管理员信息
        $adminUser = getAdminInfo();

        if( $adminUser ){
            //如果有登陆，判断IP地址
            if(  $adminUser['ip']['value'] != 0 && $client_ip != ipChange( $adminUser['ip']['value'], false ) ){
                abort(  '403', '禁止登陆' );
            }
        }

        //获取系统配置的可访问IP
        $server_ip = SystemConfig::whereValue( [ 'key' => 'ip' ], 'value' );

        //验证服务器IP地址
        if( $server_ip != 0 && $server_ip ){
            $server_ip = explode( ',', $server_ip );
            if( !in_array( $client_ip, $server_ip ) ) abort( '403', '禁止登陆' );
        }

        return $next($request);
    }
}
