<?php
/**
 * Desc  ：AdminRole.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/8
 */

namespace app\admin\model;


class AdminRole extends Base
{
    /**
     * 获取管理员角色信息
     * @param int $adminId  管理员ID
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getRoleInfo( $adminId )
    {
        $data = self::alias('ar')
                ->join('role_admin ra', 'ra.id = ar.role_id')
                ->where('ar.user_id', $adminId )
                ->field('ra.status')
                ->select();
        return $data;
    }

    /**
     * 获取管理员角色名称
     * @param int $adminId 管理员ID
     * @return array
     */
    public static function getRoleName( $adminId )
    {
        $data = self::alias( 'ar' )
                ->join( 'role_admin ra', 'ra.id = ar.role_id' )
                ->where( 'ar.user_id', $adminId )
                ->column( 'ra.name' );
        return $data;
    }

    /**
     * 获取角色列表
     * @param $where
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public static function getRoleList( $where )
    {
        $list = self::alias( 'ar' )
                ->join( 'admin a', 'ar.user_id = a.id' )
                ->where( $where )
                ->field( 'a.user_name,a.mobile,a.email,a.ip,a.status' )
                ->paginate( 20,false, [ 'query' => input( 'get.' ) ] );
        return $list;
    }
}