<?php
/**
 * Desc  ：Token.php     Token API接口
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/16
 */

namespace app\api\controller;


class Token
{
    /**
     * 生成token
     * @return string
     */
    public function create()
    {
        $token = \think\facade\Request::token( '__token__', 'sha1' );
        return $token;
    }

    /**
     * 验证token
     * @param string $token token值
     * @return bool
     */
    public function validate( $token )
    {
        $rule = [ '__token__' => 'token' ];
        $msg = [ '__token__' => '非法操作！' ];
        $validate = \think\Validate::make( $rule, $msg );
        if( $validate->check( [ '__token__' => $token ] ) ){
            return true;
        }else{
            return false;
        }
    }

}