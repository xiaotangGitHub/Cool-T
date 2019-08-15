<?php
/**
 * Desc  ：Admin.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/4
 */

namespace app\admin\model;

class Admin extends Base
{
    /**
     * 字段设置器 - time_bar
     * @param $value
     * @return false|int
     */
    public function setTimeBarAttr( $value )
    {
        if( $value && $value != 0 ){
            return strtotime( $value );
        }else{
            return $value;
        }
    }

    /**
     * 字段获取器 - time_bar
     * @param $value
     * @return array
     */
    public function getTimeBarAttr( $value )
    {
        if( $value && $value != 0 ){
            return [ 'text' => date( 'Y-m-d', $value ), 'value' => $value ];
        }else{
            return [ 'text' => '无限制', 'value' => $value ];
        }
    }

    /**
     * 字段设置器 - ip
     * @param $value
     * @return int|null|string
     */
    public function setIpAttr( $value )
    {
        if( $value && $value != 0 ){
            return ipChange( $value );
        }else{
            return $value;
        }
    }

    /**
     * 字段获取器 - ip
     * @param $value
     * @return array
     */
    public function getIpAttr( $value )
    {
        if( $value && $value != 0 ){
            return [ 'text' => ipChange( $value, false ), 'value' => ipChange( $value, false ) ];
        }else{
            return [ 'text' => '无限制', 'value' => $value ];
        }
    }
}