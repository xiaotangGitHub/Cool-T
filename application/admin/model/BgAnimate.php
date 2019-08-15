<?php
/**
 * Desc  ：BgAnimate.php     系统背景主题model层
 * Author: Cool-Team 😁
* Since ：V1.0
* Date  : 2019/4/4
*/

namespace app\admin\model;

class BgAnimate extends Base
{
    /**
     * 获取动画列表 - 供下拉选择
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getSelectOptions()
    {
        $data = self::order( 'id', 'asc' )
                ->where( 'status', 1 )
                ->field( 'id,key' )
                ->select();
        return $data;
    }
}