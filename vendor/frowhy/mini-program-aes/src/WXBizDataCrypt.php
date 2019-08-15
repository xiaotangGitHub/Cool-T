<?php
/**
 * Created by PhpStorm.
 * User: frowhy
 * Date: 2017/7/25
 * Time: 下午3:31
 */

namespace Leto\MiniProgramAES;

/**
 * 对微信小程序用户加密数据的解密示例代码.
 *
 * @copyright Copyright (c) 1998-2014 Tencent Inc.
 */
class WXBizDataCrypt {
    private $token;
    private $encodingAesKey;
    private $appId;
    public function __construct($token, $encodingAesKey, $appId) {
        $this->token = $token;
        $this->encodingAesKey = $encodingAesKey;
        $this->appId = $appId;
    }
    public function encryptMsg($replyMsg, $timeStamp, $nonce, &$encryptMsg) {
        $pc = new Prpcrypt ( $this->encodingAesKey );
        // 加密
        $array = $pc->encrypt ( $replyMsg, $this->appId );
        $ret = $array [0];
        if ($ret != 0) {
            return $ret;
        }
        if ($timeStamp == null) {
            $timeStamp = time ();
        }
        $encrypt = $array [1];
        // 生成安全签名
        $sha1 = new SHA1 ();
        $array = $sha1->getSHA1 ( $this->token, $timeStamp, $nonce, $encrypt );
        $ret = $array [0];
        if ($ret != 0) {
            return $ret;
        }
        $signature = $array [1];
        // 生成发送的xml
        $xmlparse = new XMLParse ();
        $encryptMsg = $xmlparse->generate ( $encrypt, $signature, $timeStamp, $nonce );
        return ErrorCode::$OK;
    }
    public function decryptMsg($msgSignature, $timestamp = null, $nonce, $postData, &$msg) {
        if (strlen ( $this->encodingAesKey ) != 43) {
            return ErrorCode::$IllegalAesKey;
        }
        $pc = new PrpCrypt( $this->encodingAesKey );
        // 提取密文
        $array = $this->extract ( $postData );
        $ret = $array [0];
        if ($ret != 0) {
            return $ret;
        }
        if ($timestamp == null) {
            $timestamp = time ();
        }
        $encrypt = $array [1];
        $touser_name = $array [2];
        // 验证安全签名
        $array = $this->getSHA1 ( $this->token, $timestamp, $nonce, $encrypt );
        $ret = $array [0];
        if ($ret != 0) {
            return $ret;
        }
        $signature = $array [1];
        if ($signature != $msgSignature) {
            return ErrorCode::$ValidateSignatureError;
        }
        $result = $pc->decrypt ( $encrypt, $this->appId );
        if ($result [0] != 0) {
            return $result [0];
        }
        $msg = $result [1];
        return ErrorCode::$OK;
    }
    public function extract($xmltext) {
        try {
            $res = @simplexml_load_string ( $xmltext, NULL, LIBXML_NOCDATA );
            $res = json_decode ( json_encode ( $res ), true );
            $encrypt = $res ['Encrypt'];
            $tousername = $res ['ToUserName'];

            return array (
                0,
                $encrypt,
                $tousername
            );
        } catch ( Exception $e ) {
            // print $e . "\n";
            return array (
                ErrorCode::$ParseXmlError,
                null,
                null
            );
        }
    }
    public function generate($encrypt, $signature, $timestamp, $nonce) {
        $format = "
    %s
    %s
    %s
    %s
    ";
        return sprintf ( $format, $encrypt, $signature, $timestamp, $nonce );
    }
    public function getSHA1($token, $timestamp, $nonce, $encrypt_msg) {
        // 排序
        try {
            $array = array (
                $encrypt_msg,
                $token,
                $timestamp,
                $nonce
            );
            sort ( $array, SORT_STRING );
            $str = implode ( $array );
            return array (
                ErrorCode::$OK,
                sha1 ( $str )
            );
        } catch ( Exception $e ) {
            // print $e . "\n";
            return array (
                ErrorCode::$ComputeSignatureError,
                null
            );
        }
    }
}
