<?php
use think\facade\Session;
use think\facade\Request;
use think\Db;
//============================== 验证管理员函数 ===================================

/**
 * 设置管理员登陆信息
 * @param array $data 管理员信息
 * @param int $seconds 存储时间/秒
 * @return mixed
 */
if (!function_exists('setAdminInfo')) {
    function setAdminInfo( $data, $seconds = 3600 )
    {
        $data['time'] = time();
        $data['seconds'] = $seconds;
        return Session::set('adminUser', $data);
    }
}

/**
 * 获取管理员登陆信息
 * @return mixed
 */
if (!function_exists('getAdminInfo')) {
    function getAdminInfo()
    {
        $adminUser = Session::get('adminUser');
        return $adminUser;
    }
}

/**
 * 判断用户是否有登陆
 * @return bool
 */
if (!function_exists('existsAdmin')) {
    function existsAdmin()
    {
        return Session::has('adminUser');
    }
}

/**
 * 验证管理员登陆信息
 * @return array
 */
if (!function_exists('validateAdmin')) {
    function validateAdmin()
    {
        $adminUser = getAdminInfo();

        //未登录
        if (!$adminUser) {
            if ( Request::isAjax() ) {
                return json_encode(['code' => 401, 'msg' => '请登陆'], JSON_UNESCAPED_UNICODE);
            } else {
                return ['code' => 401, 'msg' => '请登陆'];
            }
        }

        //账号失效
        if ( $adminUser['time_bar'] < time() && $adminUser['time_bar'] != 0 ) {
            if ( Request::isAjax() ) {
                return json_encode(['code' => 403, 'msg' => '账号已失效'], JSON_UNESCAPED_UNICODE);
            } else {
                return ['code' => 403, 'msg' => '账号已失效'];
            }
        }

        //登陆超时
        if ( time() - $adminUser['time'] > $adminUser['seconds'] ) {
            if ( Request::isAjax() ) {
                return json_encode( [ 'code' => 403, 'msg' => '登陆超时，请重新登陆' ], JSON_UNESCAPED_UNICODE );
            } else {
                return [ 'code' => 403, 'msg' => '登陆超时，请重新登陆' ];
            }
        }

        //角色权限
        $roleStatus = \app\admin\model\AdminRole::getRoleInfo( $adminUser['id'] );
        if ( !$roleStatus ) return ['code' => 403, 'msg' => '该账号角色无权限登陆'];
        foreach ( $roleStatus as $val ) {
            if ( $val['status'] == 0 ) {
                if ( Request::isAjax() ) {
                    return json_encode(['code' => 403, 'msg' => '该账号角色无权限登陆'], JSON_UNESCAPED_UNICODE);
                } else {
                    return ['code' => 403, 'msg' => '该账号角色无权限登陆'];
                }
            }
        }

        //账号禁用
        $status = \app\admin\model\Admin::whereValue( [ 'id' => $adminUser['id'] ], 'status' );
        if ($status != 1) {
            if ( Request::isAjax() ) {
                return json_encode(['code' => 403, 'msg' => '账号已禁用，请联系超级管理员'], JSON_UNESCAPED_UNICODE);
            } else {
                return ['code' => 403, 'msg' => '账号已禁用，请联系超级管理员'];
            }
        }

        return [ 'code' => 200, 'msg' => '账号可登陆' ];
    }
}

/**
 * 删除已登陆的管理员信息
 * @return bool
 */
if (!function_exists('delAdmin')) {
    function delAdmin()
    {
        Session::set('adminUser', null);
        if ( !getAdminInfo() ) {
            return true;
        } else {
            return false;
        }
    }
}

//============================== 数据库相关函数 ===================================

/**
 * 时间where条件拼装
 * @param array $table
 * @param null $where
 * @return null|\think\db\Where
 */
if (!function_exists('whereCondition')) {
    function whereCondition(array $table, $where = null)
    {
        if( !$where ) $where = new \think\db\Where();
        $create_start_time = input('create_start_time', '', 'strtotime');
        $create_end_time = input('create_end_time', '', 'strtotime');
        $last_start_time = input('last_start_time', '', 'strtotime');
        $last_end_time = input('last_end_time', '', 'strtotime');

        $create_time = isset($table['create_time']) ? $table['create_time'] : 'create_time';
        $last_time = isset($table['last_time']) ? $table['last_time'] : 'last_time';

        //创建时间
        if ($create_start_time && $create_end_time) {
            $where[$create_time] = [
                ['>', $create_start_time],
                ['<', $create_end_time]
            ];
        } elseif ($create_start_time) {
            $where[$create_time] = ['>', $create_start_time];
        } elseif ($create_end_time) {
            $where[$create_time] = ['<', $create_end_time];
        }

        //最后访问时间
        if ($last_start_time && $last_end_time) {
            $where[$last_time] = [
                ['>', $last_start_time],
                ['<', $last_end_time]
            ];
        } elseif ($last_start_time) {
            $where[$last_time] = ['>', $last_start_time];
        } elseif ($last_end_time) {
            $where[$last_time] = ['<', $last_end_time];
        }

        return $where;
    }
}

/**
 * 获取站点后台背景主题
 * @return string|null  文件名称
 */
if(!function_exists('getAnimateFileName')){
    function getAnimateFileName()
    {
        $adminUser = getAdminInfo();
        if( $adminUser ){
            $_filename = \app\admin\model\BgAnimate::whereValue( [ 'id' => $adminUser['theme_id'], 'status' => 1 ], 'filename' );
        }
        if( !isset( $_filename ) || !$_filename ){
            $_filename = getDbRandData( 'bg_animate', 'id', 'filename', 'status = 1' );
        }
        return $_filename;
    }
}

