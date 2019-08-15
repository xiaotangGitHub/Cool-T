<?php
/**
 * Desc  ：Base.php  后台登陆页
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/17
 */

namespace app\admin\controller;

use app\admin\model\AdminLogLogin;
use app\admin\model\AdminLogPass;
use app\admin\model\AdminMenu;
use app\common\model\SystemConfig;
use app\admin\model\Admin;
use app\api\controller\Captcha;
use app\api\controller\Token;
use think\Controller;
use think\Db;
use think\facade\Request;

class Login extends Controller
{
    /**
     * 验证是否跳转
     */
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub

        //验证是否有登陆
        $status = validateAdmin();
        $status = is_array( $status ) ? $status : json_decode( $status, true );
        if( $status['code'] == 200 && Request::action() != 'out' ){
            $loginJump = SystemConfig::whereValue( [ 'key' => 'login_jump' ], 'value' );
            if( $loginJump && getAdminInfo() ){
                $path = $this->getAdminIndexPath();
                $this->redirect( url( $path ) );
            }
        }

        //操作提示音
        $msgAudio = SystemConfig::whereValue( [ 'key' => 'msgAudio' ], 'value' );
        $this->assign( 'msgAudioStatus', $msgAudio );

    }

    /**
     * 登陆页
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        //登陆验证提示
        $loginStatus = cookie( 'loginStatus' );
        cookie( 'loginStatus', null );
        $this->assign( 'codeErrorMsg', isset( $loginStatus['msg'] ) ? $loginStatus['msg'] : '' );

        //背景特效
        $_filename = getAnimateFileName();

        $this->assign( '_filename', $_filename );

        $this->assign( '_title', '系统登陆' );
        return $this->fetch();
    }

    /**
     * 验证登陆
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function logging()
    {
        if( !Request::isAjax() ) abort( '403', '拒绝访问' );

        $user = input( 'user', '', 'trim' );
        $pass = input( 'pass', '', 'trim' );
        $yzm  = input( 'yzm' , '', 'trim'  );
        $token = input( 'token', '', 'trim' );

        //验证token
        $tokenObj = new Token();

        if( !$tokenObj->validate( $token ) ){
            return json( [ 'code' => 403, 'msg' => '拒绝访问！' ] );
        }

        if( !$user ) return json( [ 'code' => 403, 'msg' => '请输入账号' ] );
        if( !$pass ) return json( [ 'code' => 403, 'msg' => '请输入密码' ] );

        //验证码验证
        $yzmObj = new Captcha();
        if( !$yzmObj->check( $yzm ) ){
            return json( [ 'code' => 403, 'msg' => '验证码错误' ] );
        }

        //获取登陆数据
        $admin = Admin::whereFind( [ 'user_name' => $user ] );

        //验证
        if( !$admin ) return json( [ 'code' => 403, 'msg' => '账号错误' ] );
        if( $admin['password'] != md5(  $pass ) ) return json( [ 'code' => 403, 'msg' => '密码错误' ] );
        if( $admin['status']['value'] != 0 ) return json( [ 'code' => 403, 'msg' => '禁止登陆，请联系超级管理员' ] );
        if( $admin['time_bar']['value'] != 0 ){
            if( $admin['time_bar']['value'] < time() ) return json( [ 'code' => 403, 'msg' => '账号已失效，请联系超级管理员' ] );
        }

        //session存入 12小时
        setAdminInfo( $admin, 43200 );

        if( !getAdminInfo() ) return json( [ 'code' => 403, 'msg' => '系统异常，请稍后再试' ] );

        //登陆日志
        $log = [
                'admin_id'  => $admin['id'],
                'user_name' => $admin['user_name'],
                'mobile'    => $admin['mobile'],
                'email'     => $admin['email'],
                'ip'        => ipChange( Request::ip() )
        ];
        AdminLogLogin::add( $log );
        //获取首页url
        $path = $this->getAdminIndexPath();
        if( !$path ) return json( [ 'code' => 403, 'msg' => '您的账号无登陆权限，请联系超级管理员' ] );

        return json( [ 'code' => 200, 'msg' => '登陆成功', 'url' => url( $path ) ] );
    }


    /**
     * 找回密码
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sendMail()
    {
        if( !Request::isAjax() ) abort( '403', '拒绝访问' );

        $user_name = input( 'user_name','', 'trim' );
        $email = input( 'email','', 'trim' );

        //验证数据
        $admin = Admin::whereFind( [ 'user_name' => $user_name ], 'email,id' );

        if( !$admin ) return json( [ 'code' => 403, 'msg' => '账号不存在' ] );
        if( !trim( $admin['email'] ) ) return json( [ 'code' => 403, 'msg' => '该账号未绑定邮箱，请联系超级管理员修改' ] );
        if( $admin['email'] != $email ) return json( [ 'code' => 403, 'msg' => '请输入该账号绑定的正确邮箱！' ] );

        //请求限制
        $requestStatus = AdminLogPass::requestNum( $admin['id'] );
        if( !$requestStatus )   return json( [ 'code' => 403, 'msg' => '您的操作过于频繁，请稍后再试' ] );

        //设置新密码
        $newPass = mt_rand( 100000, 999999 );
        $status = Db::name( 'admin' )->where( 'user_name', $user_name )->setField( 'password', md5( $newPass ) );

        if( $status ){

            //删除登陆信息
            delAdmin();

            //初始化密码日志写入
            $log = [
                'admin_id'  =>  $admin['id'],
                'user_name' => $user_name,
                'new_pass'  => $newPass,
                'email'     => $email,
                'ip'        => ipChange( Request::ip() )
            ];
            AdminLogPass::add( $log );

            //邮件参数
            $params = [
                'email'     =>  $email,
                'title'     =>  '密码找回',
                'content'   =>  '您好，系统已帮您初始化密码，您的新密码为：<span style="color: red;font-size: 30px;font-weight: bold">'. $newPass .'</span>，请妥善保存！（ 如需修改请登陆后修改 ）'
            ];
            //发送邮件
            $resource = curlHttp( Request::domain().'/send_mail', http_build_query( $params ) );
            if( $resource['code'] == 200 ){
                return json( [ 'code' => 200, 'msg' => '新密码已发送至您的邮箱，请查收' ] );
            }else{
                return json( [ 'code' => 200, 'msg' => '您的新密码为：'.$newPass ] );
            }
        }else{
            return json( [ 'code' => 403, 'msg' => '系统异常，请稍后再试' ] );
        }
    }

    /**
     * 获取后台首页URL
     * @return mixed
     */
    private function getAdminIndexPath()
    {
        $adminUser = getAdminInfo();

        //获取当前管理员所拥有权限的父级ID
        $parent_id = AdminMenu::getParentId( $adminUser['id'] );

        //获取父级菜单对应的子级菜单路径
        $z_path = AdminMenu::getSonMenuPath( $parent_id, $adminUser['id'] );

        return $z_path;
    }

    /**
     * 退出
     */
    public function out()
    {
        delAdmin();
        if( getAdminInfo() ){
            $this->error( '退出失败，请重试' );
        }else{
            $this->success( '退出成功，欢迎光临~', '/admin_login' );
        }
    }

}