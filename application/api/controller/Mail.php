<?php
/**
 * Desc  ：Mail.php      邮箱发送
 * Author: Cool-T 😀
 * Since : V1.0
 * Date  : 2018/10/22
 */

namespace app\api\controller;


use PHPMailer\PHPMailer\PHPMailer;
use think\Controller;
use think\Db;

class Mail extends Controller
{
    /**
     * 邮箱发送
     * param =  [ 'email', 'title', 'content' ]
     * 请求url：http://xxx.xxx.xxx/api/Mail/send
     * @return bool|\think\response\Json
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function send()
    {
        //验证
        if( !isset( $_POST['email'] ) )      return json( [ 'code' => '403', 'msg' => '请传入接收人邮箱' ] );
        if( !isset( $_POST['title'] ) )      return json( [ 'code' => '403', 'msg' => '请传入邮件标题' ] );
        if( !isset( $_POST['content'] ) )    return json( [ 'code' => '403', 'msg' => '请传入邮件正文' ] );

        //接收数据
        $sendMail   = $_POST['email'];
        $title      = $_POST['title'];
        $content    = $_POST['content'];

        //配置
        $emailAccount   = Db::name( 'system_config' )->where( 'key', 'email_account' )->value( 'value' );
        $emailPass      = Db::name( 'system_config' )->where( 'key', 'email_pass' )->value( 'value' );
        $emailName      = Db::name( 'system_config' )->where( 'key', 'email_name' )->value( 'value' );

        //邮箱类
        $mail = new PHPMailer();

        //SMTP服务
        $mail->isSMTP();

        //编码格式为utf8，不设置编码的话，中文会出现乱码
        $mail->CharSet = 'utf8';

        //发送方的SMTP服务器地址
        $mail->Host = 'smtp.qq.com';

        //身份验证
        $mail->SMTPAuth = true;

        //foxmail邮箱账号
        $mail->Username = $emailAccount;

        //foxmail邮箱授权码
        $mail->Password = $emailPass;

        //ssl协议方式
        $mail->SMTPSecure = 'ssl';

        //foxmail邮箱端口号（可自行设置）
        $mail->Port = 465;

        //发件人信息
        $mail->setFrom( $emailAccount, $emailName );

        //收件人邮箱地址
        $mail->addAddress( $sendMail );

        //html支持
        $mail->IsHTML(true );

        //邮件标题
        $mail->Subject = $title;

        //邮件正文
        $mail->Body = $content;

        //邮件发送
        $status = $mail->send();

        //邮件状态返回
        if( $status ){

            $log = [
                'email' =>  $_POST['email'],
                'title' =>  $_POST['title'],
                'content'   =>  $_POST['content'],
                'create_time'   =>  time()
            ];
            Db::name( 'send_mail_log' )->insert( $log );

            return json( [ 'code' => 200, 'msg' => 'ok' ] );
        }else{
            return json( [ 'code' => 403, 'msg' => '发送失败' ] );
        }

    }
}