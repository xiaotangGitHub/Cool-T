<?php
/**
 * Desc  ：ImgResource.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/6/24
 */

namespace app\admin\model;


class ImgsResource extends Base
{
    /**
     * 获取图片列表
     * @param $where
     * @param $page
     * @param $num
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getImgsPage( $where, $page, $num )
    {
        $list = self::name( 'imgs_resource' )
            ->where( $where )
            ->field( 'id,img,name,ext,path' )
            ->order( 'id desc' )
            ->page( $page, $num )
            ->select();
        return $list;
    }
}