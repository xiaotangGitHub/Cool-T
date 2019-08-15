<?php
/**
 * Desc  ：Logs.php  日志系统查看
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/29
 */

namespace app\admin\controller;

use app\admin\model\AdminLogAction;
use app\admin\model\AdminLogLogin;
use app\admin\model\AdminLogPass;
use think\db\Where;

class Logs extends Base
{
    /**
     * 登陆日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function login()
    {
        $where = new Where();
        if( isset( $_GET['admin_id'] ) && $_GET['admin_id'] ) $where['admin_id'] = $_GET['admin_id'];
        if( isset( $_GET['user_name'] ) && $_GET['user_name'] ) $where['user_name'] = [ 'like', "%{$_GET['user_name']}%" ];
        if( isset( $_GET['mobile'] ) && $_GET['mobile'] ) $where['mobile'] = [ 'like', "%{$_GET['mobile']}%" ];

        $list = AdminLogLogin::getList( $where, [ 'create_time' => 'desc' ] );
        $this->assign( 'list', $list );

        return $this->fetch();
    }

    /**
     * 操作日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function adminAction()
    {
        $where = new Where();
        if( isset( $_GET['admin_id'] ) && $_GET['admin_id'] ) $where['admin_id'] = $_GET['admin_id'];
        if( isset( $_GET['user_name'] ) && $_GET['user_name'] ) $where['user_name'] = [ 'like', "%{$_GET['user_name']}%" ];
        if( isset( $_GET['path'] ) && $_GET['path'] ) $where['path'] = [ 'like', "%{$_GET['path']}%" ];
        if( isset( $_GET['desc'] ) && $_GET['desc'] ) $where['desc'] = [ 'like', "%{$_GET['desc']}%" ];

        $list = AdminLogAction::getList( $where, [ 'create_time' => 'desc' ] );
        $this->assign( 'list', $list );

        return $this->fetch();
    }

    /**
     * 密码重置日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function mailPass()
    {
        $where = new Where();
        if( isset( $_GET['admin_id'] ) && $_GET['admin_id'] ) $where['admin_id'] = $_GET['admin_id'];
        if( isset( $_GET['user_name'] ) && $_GET['user_name'] ) $where['user_name'] = [ 'like', "%{$_GET['user_name']}%" ];
        if( isset( $_GET['email'] ) && $_GET['email'] ) $where['email'] = [ 'like', "%{$_GET['email']}%" ];

        $list = AdminLogPass::getList( $where, [ 'create_time' => 'desc' ] );
        $this->assign( 'list', $list );

        return $this->fetch();
    }
}