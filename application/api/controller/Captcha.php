<?php
/**
 * Desc  ：Captcha.php   验证码调用
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/16
 */

namespace app\api\controller;


use think\Controller;
use think\Db;

class Captcha extends Controller
{
    /**
     * 生成验证码
     * @return \think\Response
     */
    public function create()
    {
        $captcha = new \think\captcha\Captcha();
        //曲线
        $captcha->useCurve = false;
        //杂点
        $captcha->useNoise = false;
        //验证码长度
        $captcha->length = 4;
        //中文验证
        $captcha->useZh = true;
        //背景色
        $captcha->bg =  [255, 255, 255,127];
        //字体颜色
        $captcha->color =  [0,0,0];
        //验证码字符串
        $captchaText = Db::name( 'system_config' )->where( 'key', 'captcha_text' )->value( 'value', 'CoolT' );
        $captcha->zhSet = $captchaText;

        return $captcha->entry();
    }

    /**
     * 验证码验证
     * @param string $yzm  验证码值
     * @return bool|\think\response\Json
     */
    public function check( $yzm )
    {
        $captcha = new \think\captcha\Captcha();
        if( $captcha->check( $yzm ) ){
            return true;
        }else{
            return false;
        }
    }

}