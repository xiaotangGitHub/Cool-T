<?php
/**
 * Desc  ：AdminMenu.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/4
 */

namespace app\admin\model;


class AdminMenu extends Base
{
    /**
     * 字段获取器 - status
     * @param $value
     * @return mixed
     */
    public function getAnimateStatusAttr( $value )
    {
        $success = [
            'text' => '<span class="text-success">开启</span>',
            'value' => 0,
            'btnClass' => 'btn btn-warning',
            'btnText'  => '关闭动画'
        ];
        $warning = [
            'text' => '<span class="text-warning">关闭</span>',
            'value' => 1,
            'btnClass' => 'btn btn-success',
            'btnText'  => '开启动画'
        ];
        $status = [ 1 => $success, 0 => $warning ];
        return $status[$value];
    }

    /**
     * 获取父节点菜单
     * @param int $adminId  管理员ID
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getParentMenu( $adminId )
    {
        $parentMenu = self::alias( 'am' )
                    ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                    ->join( 'admin_role ar', 'ar.role_id = ram.role_id ' )
                    ->where( [ 'am.parent_id' => 0, 'am.status' => 1, 'ar.user_id' => $adminId ] )
                    ->order( 'am.sort asc , am.id asc' )
                    ->field( 'am.id,am.name,am.path,am.parent_id' )
                    ->distinct(true)
                    ->select();
        return $parentMenu;
    }

    /**
     * 根据父级菜单获取对应子菜单
     * @param int $parentId 父级ID
     * @param int $adminId  管理员ID
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getSonMenu( $parentId, $adminId )
    {
        $sonMenu = self::alias( 'am' )
                    ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                    ->join( 'admin_role ar', 'ar.role_id = ram.role_id ' )
                    ->where( [ 'am.parent_id' => $parentId, 'am.status' => 1, 'ar.user_id' => $adminId  ] )
                    ->order( 'am.sort asc , am.id asc' )
                    ->field( 'am.id,am.name,am.path,am.group_name,am.checked' )
                    ->distinct(true)
                    ->select();
        return $sonMenu;
    }

    /**
     * 根据管理员角色和菜单路径判断菜单是否有数据
     * @param int       $roleId 角色ID
     * @param string    $path   路径
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function emptyMenu( $roleId, $path )
    {
        $status = self::alias( 'am' )
                    ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                    ->where( [ 'ram.role_id' => $roleId, 'am.path' => $path ] )
                    ->where( 'am.parent_id != 0' )
                    ->find()
                    ->isEmpty();
        return $status;
    }

    /**
     * 根据父级菜单和管理员获取最靠前的菜单路径
     * @param int   $parentId   父级菜单ID
     * @param int   $adminId    管理员ID
     * @return mixed
     */
    public static function getSonMenuPath( $parentId, $adminId )
    {
        $path = self::alias( 'am' )
                ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                ->join( 'admin_role ar', 'ar.role_id = ram.role_id ' )
                ->where( [ 'am.status' => 1, 'ar.user_id' => $adminId, 'am.parent_id' => $parentId ] )
                ->order( 'am.checked desc, am.sort asc , am.id asc' )
                ->value( 'path' );
        return $path;
    }

    /**
     * 获取管理员所拥有权限的父级ID
     * @param $adminId
     * @return mixed
     */
    public static function getParentId( $adminId )
    {
        $parentId = self::alias( 'am' )
                    ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                    ->join( 'admin_role ar', 'ar.role_id = ram.role_id ' )
                    ->where( [ 'am.parent_id' => 0, 'am.status' => 1, 'ar.user_id' => $adminId ] )
                    ->order( 'am.sort', 'asc' )
                    ->value( 'am.id' );
        return $parentId;
    }

    /**
     * 搜索菜单
     * @param string    $menuName   菜单名称
     * @param int       $adminId    管理员ID
     * @return mixed
     */
    public static function searchMenu( $menuName, $adminId )
    {
        $path = self::alias( 'am' )
                ->join( 'role_admin_menu ram', 'ram.permission_id = am.id' )
                ->join( 'admin_role ar', 'ar.role_id = ram.role_id' )
                ->where( [ 'am.status' => 1, 'ar.user_id' => $adminId ] )
                ->whereLike( 'am.name', $menuName )
                ->value( 'am.path' );
        return $path;
    }

    /**
     * 获取菜单
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getMenuTree()
    {
        $menus = self::order( 'sort', 'asc' )
                ->where( 'parent_id', 0 )
                ->field( 'id,name' )
                ->select()
                ->toArray();
        foreach( $menus as $key => $val ){
            $arr = self::order( 'sort asc, id asc' )
                    ->where( 'parent_id', $val['id'] )
                    ->field( 'id,name,group_name' )
                    ->select()
                    ->toArray();
            $menus[$key]['son'] = $arr;
        }
        return $menus;
    }



}