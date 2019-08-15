<?php
/**
 * Desc  ：Base.php
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/8
 */

namespace app\common\model;

use think\Model;

class Base extends Model
{
    /**
     * select获取列表数据
     * @param mixed $where   where条件
     * @param mixed $order   order排序
     * @param mixed $field   field字段
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    static public function getSelect( $where = null, $order = null, $field = '*' )
    {
        $list = self::where( $where )
                ->order( $order )
                ->field( $field )
                ->select();
        return $list;
    }

    /**
     * 根据where条件获取单条数据
     * @param mixed $where  where条件
     * @param mixed $field  field表字段
     * @param mixed $order  order排序
     * @return array|null|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    static public function whereFind( $where, $field = '*', $order = [] )
    {
        $data = self::where( $where )->field( $field )->order( $order )->find();
        return $data;
    }

    /**
     * 根据where条件获取单字段值
     * @param mixed     $where  where条件
     * @param string    $field  要获取的字段值
     * @return mixed
     */
    static public function whereValue( $where, $field )
    {
        $value = self::where( $where )->value( $field );
        return $value;
    }

    /**
     * 根据whereIn条件获取单条数据
     * @param string        $whereField   whereIn条件字段名
     * @param string|array  $condition    whereIn条件值
     * @param string        $field        field表字段
     * @return array|null|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    static public function whereInFind( $whereField, $condition, $field = '*' )
    {
        $data = self::whereIn( $whereField, $condition )->field( $field )->find();
        return $data;
    }

    /**
     * 根据whereIn条件获取单字段值
     * @param string        $whereField   whereIn条件字段名
     * @param string|array  $condition    whereIn条件值
     * @param string        $field        要获取的字段值
     * @return mixed
     */
    static public function whereInValue( $whereField, $condition, $field )
    {
        $value = self::whereIn( $whereField, $condition )->value( $field );
        return $value;
    }

    /**
     * 根据where条件获取单列值
     * @param array|string $where   where条件
     * @param null|string $field    字段
     * @return array|Model
     */
    static public function whereColumn( $where, $field )
    {
        $arr = self::where( $where )->field( $field )->column( $field );
        return $arr;
    }

    /**
     * 根据whereIn条件获取单列值
     * @param array|string $where   where条件
     * @param null|string $field    字段
     * @return array|Model
     */
    static public function whereInColumn( $where, $field )
    {
        $arr = self::whereIn( $where )->field( $field )->column( $field );
        return $arr;
    }

    /**
     * 根据where条件更改单值
     * @param mixed     $where  where条件
     * @param string    $field  要更改的字段
     * @param mixed     $value  字段值
     * @return int
     */
    static public function whereSetField( $where, $field, $value )
    {
        $status = self::where( $where )->setField( $field, $value );
        return $status;
    }

    /**
     * 根据whereIn条件更改单值
     * @param string $whereField   whereIn字段
     * @param string $whereValue   whereIn条件值
     * @param string $field        要更改的字段
     * @param mixed  $value        字段值
     * @return int
     */
    static public function whereInSetField( $whereField, $whereValue, $field, $value )
    {
        $status = self::whereIn($whereField, $whereValue)->setField($field, $value);
        return $status;
    }

    /**
     * 根据where条件统计数据
     * @param mixed $where  where条件
     * @return float|string
     */
    static public function whereCount( $where )
    {
        $status = self::where( $where )->count();
        return $status;
    }

    /**
     * 根据whereIn条件统计
     * @param string        $whereField whereIn条件字段
     * @param $whereValue   $whereValue whereIn条件值
     * @return \think\db\Query
     */
    static public function whereInCount( $whereField, $whereValue )
    {
        $status = self::whereIn( $whereField, $whereValue )->count();
        return $status;
    }
}