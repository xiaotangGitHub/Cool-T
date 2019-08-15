<?php
/**
 * Desc  ：Base.php  后台基类
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/17
 */

namespace app\admin\controller;

use app\admin\model\Admin;
use app\admin\model\AdminLogAction;
use app\admin\model\AdminMenu;
use app\admin\model\AdminRole;
use app\admin\model\BgAnimate;
use app\admin\model\ImgsCategory;
use app\common\model\SystemConfig;
use think\Controller;
use think\facade\Request;

class Base  extends Controller
{
    //中间件
    protected $middleware = ['app\admin\middleware\ipAuth'];
    //后台Title
    private $_title = '后台管理系统';
    //当前管理员信息
    protected $adminUser;
    //超级管理员角色ID
    protected $superAdminId = 1;

    /**
     * 初始化数据
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub

        //验证账号
        $this->validateAdmin();

        //显示菜单
        $this->menu();

        //操作权限判断
        $this->checkPermissions();

        //公共数据
        $this->commonData();
    }

    /**
     * 验证登陆账号
     */
    private function validateAdmin()
    {
        $resource = validateAdmin();
        $resource = is_array( $resource ) ? $resource : json_decode( $resource, true );
        if( $resource[ 'code' ] != 200 ){
            cookie( 'loginStatus', $resource );
            $this->redirect( '/admin_login' );
        }else{
            $adminUser = getAdminInfo();
            $this->adminUser = Admin::whereFind( [ 'id' => $adminUser['id'] ] );
            $this->assign( 'adminUser', $this->adminUser );
            $this->assign( 'superAdminId', $this->superAdminId );
        }
    }

    /**
     * 菜单遍历输出显示
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function menu()
    {
        //只有get操作显示菜单
        if( !Request::isGet() ) return false;

        //获取选中菜单的信息
        $_path = Request::module() .'/'. Request::controller() .'/'. Request::action();

        $checkedMenu = AdminMenu::whereFind( "path = '{$_path}' and parent_id != 0", 'id,parent_id,name,path' );

        if( !$checkedMenu ){
            $checkedMenu = AdminMenu::whereFind( "path = '{$_path}' and parent_id = 0", 'id,parent_id,name' );

            $parentId = $checkedMenu['id'];
            $this->assign( 'subSeries', true );
        }else{
            $parentId = $checkedMenu['parent_id'];
        }

        //父节点菜单
        $parentMenu = AdminMenu::getParentMenu( $this->adminUser['id'] );
        $this->assign( [
            'parentMenu'    =>  $parentMenu,
            'parentId'      =>  $parentId,
            '_path'          =>  strtolower( $_path )
        ] );

        //获取父级菜单对应的子菜单
        $leftMenu = AdminMenu::getSonMenu( $parentId, $this->adminUser['id'] );

        if( $leftMenu ) $leftMenu = arrayGroups( $leftMenu->toArray(), 'group_name' );

        //左侧子菜单及主页Title
        $this->assign( [
            'leftMenu'  =>  $leftMenu,
            'menuTitle' => $checkedMenu['name']
        ] );
    }

    /**
     * 操作权限判断
     */
    private function checkPermissions()
    {
        //判断是否为超级管理员
        $superAdmin = AdminRole::whereValue( [ 'user_id' => $this->adminUser['id'], 'role_id' => $this->superAdminId ], 'id' );
        if( $superAdmin ) return false;

        //获取当前操作
        $path = Request::module() .'/'. Request::controller() .'/'. Request::action();

        //获取当前管理员角色ID
        $roleId = AdminRole::whereValue( [ 'user_id' => $this->adminUser['id'] ], 'role_id' );

        //判断该选中菜单是否有操作权限
        $status = AdminMenu::emptyMenu( $roleId, $path );

        if( !$status  ){

            //如果是ajax请求则直接返回提示信息
            if( Request::isAjax() ) $this->error( '抱歉，您没有操作权限' );

            //验证的菜单类型  1：父级菜单 0：子级菜单
            $menu_parent_type = input( 'menu_parent_type', 0 );

            //如果是父级
            if( $menu_parent_type == 1 ){

                //获取父级菜单ID
                $pid = AdminMenu::whereValue( [ 'path' => $path, 'parent_id' => [ 'neq', 0 ] ], 'parent_id' );

                //根据父级菜单获取有权限的菜单路径
                $path = AdminMenu::getSonMenuPath( $pid, $this->adminUser['id'] );

                if( $path ) $this->redirect( $path );

            }

            $this->error( '抱歉，您没有访问权限' );

        }
    }

    /**
     * 公共数据
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function commonData()
    {
        //站点后台背景主题
        $_filename = BgAnimate::whereValue( [ 'id' => $this->adminUser['theme_id'] ], 'filename' );
        if( !$_filename ) $_filename = getAnimateFileName();

        //后台操作提示音
        $msgAudioStatus = SystemConfig::whereValue( [ 'key' => 'msgAudio' ], 'value' );

        //图片库分类
        $where = [];
        if( $this->adminUser['id'] != 1 ){
            $where['admin_id'] = $this->adminUser['id'];
        }
        $imgsCategory = ImgsCategory::getSelect( $where, '', 'id,name' );

        //底部版权说明
        $copyrightText = SystemConfig::whereValue( [ 'key' => 'admin_footer_text' ], 'value' );
        $copyrightUrl = SystemConfig::whereValue( [ 'key' => 'admin_footer_url' ], 'value' );

        //logo
        $logo = SystemConfig::whereValue( [ 'key' => 'admin_logo' ], 'value' );

        //列表无数据时展示
        $listEmpty = '<td colspan="15" style="text-align: center">暂无数据</td>';

        $this->assign([
            '_title'    =>  $this->_title,
            '_filename' =>  $_filename,
            'msgAudioStatus'    =>  $msgAudioStatus,
            'imgsCategory'  =>  $imgsCategory,
            'copyrightText'  =>  $copyrightText,
            'copyrightUrl'  =>  $copyrightUrl,
            'logo'  =>  $logo,
            '_empty'    =>  $listEmpty,
        ]);
    }

    /**
     * 验证数据
     * @param string $className    验证器类名称
     * @param array $data          数据
     * @return array|bool
     */
    protected function validateData( $className, $data )
    {
        $namespaceClass = "\\app\\".Request::module()."\\validate\\".$className;
        $validate = new $namespaceClass();

        if( !$validate->check( $data ) ){
            $returnMsg = $validate->getError();

            //判断是否有逗号',' ，规则为有逗号，则 错误消息指向input框，有 | 符号则指向页面class
            if( strstr( $returnMsg, ',' ) ){
                $arr = explode( ',', $returnMsg );
                $returnMsg = [ 'code' => 403, 'msg' => $arr[0], 'element' => $arr[1], 'input' => true ];

                //判断是否有'|'号
            }elseif( strstr( $returnMsg, '|' ) ){
                $arr = explode( '|', $returnMsg );
                $returnMsg = [ 'code' => 403, 'msg' => $arr[0], 'element' => $arr[1] ];
            }

            return $returnMsg;

        }else{
            return false;
        }
    }

    /**
     * 操作结束后记录操作日志并响应操作状态
     * @param $status
     * @param $actionDesc
     * @param null $actionMsg
     * @param null $url
     */
    protected function endAction( $status, $actionDesc, $actionMsg = null, $url = null )
    {
        //操作日志
        if( $status ){
            $path = Request::module() .'/'. Request::controller() .'/'. Request::action();
            $log = [
                'admin_id'  => $this->adminUser['id'],
                'user_name' => $this->adminUser['user_name'],
                'path'      => $path,
                'params'    => json_encode( input(), JSON_UNESCAPED_UNICODE ),
                'desc'      => $actionDesc
            ];
            AdminLogAction::add( $log );
        }

        //返回数据
        $returnData = [
            'url'   =>  $url,
            'code'  =>  $status ? 200 : 403,
            'msg'   =>  $actionMsg ?: ( $status ? '操作成功' : '操作失败' )
        ];

        exit( json_encode( $returnData ) );
    }
}