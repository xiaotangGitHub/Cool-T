<?php
/**
 * Desc  ：Exception.php     系统错误日志
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/6/14
 */

namespace app\admin\controller;


use app\admin\model\SystemException;
use think\db\Where;

class Exception extends Base
{
    /**
     * 列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $where = new Where();
        if( isset( $_GET['file'] ) && $_GET['file'] ) $where['file'] = [ 'like', "%{$_GET['file']}%" ];

        $list = SystemException::getList( $where, [ 'create_time' => 'desc' ] );
        $this->assign( 'list', $list );

        return $this->fetch();
    }
}