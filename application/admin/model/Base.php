<?php
/**
 * Desc  ：Base.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/6/22
 */

namespace app\admin\model;


class Base extends \app\common\model\Base
{
    /**
     * paginate获取列表数据
     * @param mixed     $where  where条件
     * @param string    $order  order排序
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    static public function getList( $where = null, $order = null )
    {
        $list = self::where( $where )->order( $order )->paginate( 20, false,[ 'query' => input( 'get.' ) ] );
        return $list;
    }

    /**
     * 字段获取器 - status
     * @param $value
     * @return mixed
     */
    public function getStatusAttr( $value )
    {
        $success = [
            'text' => '<span class="text-success">启用/显示</span>',
            'value' => 0,
            'btnClass' => 'btn btn-warning',
            'btnText'  => '禁用/隐藏'
        ];
        $warning = [
            'text' => '<span class="text-warning">禁用/隐藏</span>',
            'value' => 1,
            'btnClass' => 'btn btn-success',
            'btnText'  => '启用/显示'
        ];
        $status = [ 1 => $success, 0 => $warning ];

        return isset( $status[$value] ) ? $status[$value] : $status[0];
    }

    /**
     * 字段获取器 - checked
     * @param $value
     * @return mixed
     */
    public function getCheckedAttr( $value )
    {
        $success = [
            'text' => '<span class="text-success">是</span>',
            'value' => 0,
            'btnClass' => 'btn btn-warning',
            'btnText'  => '否'
        ];
        $warning = [
            'text' => '<span class="text-warning">否</span>',
            'value' => 1,
            'btnClass' => 'btn btn-success',
            'btnText'  => '是'
        ];
        $checked = [ 1 => $success, 0 => $warning ];
        return isset( $checked[$value] ) ? $checked[$value] : $checked[0];
    }

    /**
     * 字段获取器 - stick
     * @param $value
     * @return mixed
     */
    public function getStickAttr( $value )
    {
        $success = [
            'text' => '<span class="text-success">已置顶</span>',
            'value' => 0,
            'btnClass' => 'btn btn-warning',
            'btnText'  => '取消置顶'
        ];
        $warning = [
            'text' => '<span class="text-warning">未置顶</span>',
            'value' => 1,
            'btnClass' => 'btn btn-success',
            'btnText'  => '设为置顶'
        ];
        $stick = [ 1 => $success, 0 => $warning ];
        return isset( $stick[$value] ) ? $stick[$value] : $stick[0];
    }
}