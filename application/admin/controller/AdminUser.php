<?php
/**
 * Desc  ：AdminUser.php     个人管理员操作
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/29
 */

namespace app\admin\controller;


use app\admin\model\AdminLogAction;
use app\admin\model\AdminLogLogin;
use think\Db;
use think\db\Where;
use think\facade\Request;

class AdminUser extends Base
{
    /**
     * 账号设置
     * @return mixed|\think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function setAccount()
    {
        if( Request::isAjax() ){

            //接收数据
            $data = [
                  'email' => input( 'email', '', 'trim' ),
                  'mobile'=> input( 'mobile', '', 'trim' ),
                  'theme_id' => input( 'theme_id' ),
            ];

            //验证
            $new_pass = input( 'new_pass', '', 'trim' );
            if( $new_pass ){
                $new_pass_confirm = input( 'new_pass_confirm', '', 'trim' );
                if( $new_pass !== $new_pass_confirm ) return json( [ 'code' => 403, 'msg' => '请确认密码一致', 'element' => 'new_pass_confirm' ] );
                $data['password'] = md5( $new_pass );
            }
            if( !$data['email'] )  return json( [ 'code' => 403, 'msg' => '请输入邮箱', 'element' => 'email' ] );

            //修改
            $status = Db::name('admin'  )->where( 'id', $this->adminUser['id'] )->update( $data );
            if( $status ){
                return json( [ 'code' => 200, 'msg' => '保存成功' ] );
            }else{
                return json( [ 'code' => 403, 'msg' => '保存失败' ] );
            }

        }else{
            //背景主题
            $bgAnimate = Db::name( 'bg_animate' )
                ->order( 'id', 'asc' )
                ->where( 'status', 1 )
                ->field( 'id,key' )
                ->select();
            $this->assign( 'bgAnimate', $bgAnimate );

            $this->assign( 'data', $this->adminUser );
            return $this->fetch();
        }
    }

    /**
     * 个人管理员操作日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function actionLogs()
    {
        $where = new Where();
        $where['admin_id'] = $this->adminUser['id'];
        if( isset( $_GET['path'] ) && $_GET['path'] ) $where['path'] = [ 'like', "%{$_GET['path']}%" ];

        $list = AdminLogAction::getList( $where );
        $this->assign( 'list', $list );

        return $this->fetch();
    }

    /**
     * 个人管理员登陆日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function loginLogs()
    {
        $where = new Where();
        $where['admin_id'] = $this->adminUser['id'];

        $list = AdminLogLogin::getList( $where );
        $this->assign( 'list', $list );

        return $this->fetch();
    }
}