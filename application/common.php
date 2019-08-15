<?php
use think\Db;

//============================== 常用函数 ===================================

/**
 * 数字三位数逗号分割
 * @param $fee
 * @return null|string|string[]
 */
if (!function_exists('feeHandle')) {
    function feeHandle($fee)
    {
        if (is_numeric($fee)) {
            if (strpos($fee, '.')) {
                list($int, $decimal) = explode('.', $fee);
                $int = preg_replace('/(?<=[0-9])(?=(?:[0-9]{3})+(?![0-9]))/', ',', $int) . '.' . $decimal;
                return $int;
            } else {
                return number_format($fee);
            }
        }
    }
}

/**
 * IP地址string与int类型转换
 * @param mixed $ip IP地址string或IP地址转换后的int,不填则获取客户端IP
 * @param bool $change true：转换为int false：转换为string
 * @return int|string
 */
if (!function_exists('ipChange')) {
    function ipChange($ip = null, $change = true)
    {
        if ($change) {
            $ip = ip2long($ip);
        } else {
            if ($ip == 0 || !$ip) return $ip;
            $ip = long2ip($ip);
        }
        return $ip;
    }
}

/**
 * 判断是否为一维数组
 * @param array $array 数组
 * @return bool true：一维 false：二维
 */
if (!function_exists('linearArray')) {
    function linearArray($array)
    {
        if (count($array) == count($array, 1)) {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * 创建目录
 * @param $dir
 * @param $mode
 * @return bool
 */
if (!function_exists('createDir')) {
    function createDir($dir, $mode = 0777)
    {
        if (is_dir($dir) || @mkdir($dir, $mode)) return true;
        if (!createDir(dirname($dir), $mode)) return false;
        return @mkdir($dir, $mode);
    }
}

/**
 * 数组转换成xml字符串
 * @param $arr
 * @return string
 */
if (!function_exists('arrReversalXml')) {
    function arrReversalXml($arr)
    {
        $xml = '<xml>';
        foreach ($arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= '<' . $key . '>' . $val . '</' . $key . '>';
            } else {
                $xml .= '<' . $key . '><![CDATA[' . $val . ']]></' . $key . '>';
            }
        }
        $xml .= '</xml>';
        return $xml;
    }
}

/**
 * xml字符串转换成数组
 * @param $xml
 * @return mixed
 */
if (!function_exists('xmlReversalArr')) {
    function xmlReversalArr($xml)
    {
        libxml_disable_entity_loader(true);
        $arr = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $arr;
    }
}

/**
 * 二维数组函数根据value分组
 * @param array $array 要分组的数组
 * @param string $field 根据数组中的$field字段分组
 * @param string $defaultGroupName 分组名称
 * @return array
 */
if (!function_exists('arrayGroups')) {
    function arrayGroups( array $array, $field, $defaultGroupName = '未分组' )
    {
        $result = [];
        foreach ($array as $k => $v) {
            if (!trim($v[$field]) && $v[$field] != 0) $v[$field] = $defaultGroupName;
            $result[$v[$field]][] = $v;
        }
        return $result;
    }
}


/**
 * curl 请求
 * @param string $url 请求url
 * @param mixed $data 请求数据
 * @param string $method 请求类型
 * @param bool $imgResource true：直接返回图片资源
 * @return array|mixed
 */
if (!function_exists('curlHttp')) {
    function curlHttp($url, $data = NULL, $method = 'post', $imgResource = false)
    {
        $curl = curl_init();
        $header = ['Accept-Charset: utf-8'];
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);

        if (is_array($data)) $data = json_encode($data, 256);

        if (strtolower($method) == 'post') {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);

        if ($imgResource) return $output;

        $errCode = curl_errno($curl);

        if ($errCode) {
            return ['curl' => false, 'errcode' => $errCode];

        } else {
            $res = json_decode($output, 1);
            return $res;
        }

        curl_close($curl);
    }

}

//============================== 系统架构相关函数 ===================================

/**
 * 七牛云图片域名拼接
 * @param mixed $img  图片数据
 * @param bool  $html true：拼接成img src标签内
 * @return string
 */
if(!function_exists('imgsHttp')){
    function imgsHttp( $img, $html = false )
    {
        $qiNiuStatus = \app\common\model\SystemConfig::whereValue( [ 'key' => 'qiNiuStatus' ], 'value' );
        if( $qiNiuStatus ){
            $qiNiuDomain = \think\facade\Config::get( 'qiNiuConfig.domain' );
        }else{
            $qiNiuDomain = \think\facade\Request::domain().'/';
        }

        if( is_array( $img ) ){
            foreach ( $img as &$v ){
                if( $html ){
                    $v = "<img src='{$qiNiuDomain}{$v}'>";
                }else{
                    $v = $qiNiuDomain.$v;
                }
            }
        }else{
            if( strstr( $img, ',' ) ){
                $imgArr = explode( ',', $img );
                $img = imgsHttp( $imgArr, $html );
            }else{
                if( $html ){
                    $img = "<img src='{$qiNiuDomain}{$img}'>";
                }else{
                    $img = $qiNiuDomain.$img;
                }
            }
        }
        return $img;
    }
}

//============================== 数据库相关函数 ===================================


/**
 * 随机获取数据库指定数据表数据
 * @param string    $table      表名称
 * @param string    $pk         表主键
 * @param mixed     $field      要获取的字段值
 * @param array     $where      where条件
 * @return array|mixed|null|PDOStatement|string|\think\Model
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
if (!function_exists('getDbRandData')) {
    function getDbRandData( $table, $pk = 'id', $field = null, $where = [] )
    {
        //随机获取主键值
        if (empty($pk)) {
            $ids = Db::name($table)->column($pk);
        }else{
            $ids = Db::name($table)->where($where)->column($pk);
        }

        if( !$ids ) return false;

        $id = $ids[array_rand($ids)];

        if ( strstr($field, ',') || $field == '*' || is_array( $field ) ) {
            $data = Db::name($table)->where([$pk => $id])->where($where)->field($field)->find();
        } else {
            $data = Db::name($table)->where([$pk => $id])->where($where)->value($field);
        }
        return $data;
    }
}