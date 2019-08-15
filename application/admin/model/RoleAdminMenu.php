<?php
/**
 * Desc  ：RoleAdminMenu.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/4
 */

namespace app\admin\model;


class RoleAdminMenu extends Base
{
    /**
     * 添加多条数据
     * @param $data
     * @return int|string
     */
    public static function insertAllData( $data )
    {
        return self::insertAll( $data );
    }
}