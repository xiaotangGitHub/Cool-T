<?php
/**
 * Desc  ：Weather.php   天气接口
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/31
 */

namespace app\api\controller;


class weather
{
    /**
     * 获取天气
     * @return \think\response\Json
     */
    public function get()
    {
        //接收参数
        if( isset( $_GET['city'] ) ){
            $city = $_GET['city'];
        }else{
            $city = '上海';
        }

        try{
            //调用接口
            $url = 'http://wthrcdn.etouch.cn/weather_mini?city='.$city;
            $json = file_get_contents( $url );
            $result= gzdecode( $json );
            $arr = json_decode( $result, true );

            //返回数据
            if( strtolower( $arr['desc'] ) == 'ok' ){
                $data = $arr['data']['forecast'];
                return json( [ 'code' => 200, 'msg' => '接口调用成功' , 'data' => $data ] );
            }else{
                return json( [ 'code' => 403,  'msg' => '接口调用失败' ] );
            }

        }catch( \Exception $e ){
            return json( [ 'code' => 403, 'msg' => '系统异常', 'e' => $e->getMessage() ] );
        }
    }
}