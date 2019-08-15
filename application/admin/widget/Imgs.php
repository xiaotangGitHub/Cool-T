<?php
/**
 * Desc  ：Imgs.php      图片库调用
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/10
 */

namespace app\admin\widget;


use app\common\model\SystemConfig;
use think\Controller;
use think\facade\Config;
use think\facade\Request;

class Imgs extends Controller
{
    //七牛云存储空间配置域名
    private $domain;

    //初始化
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $qiNiuStatus = SystemConfig::whereValue( [ 'key' => 'qiNiuStatus' ], 'value' );
        if( $qiNiuStatus ){
            $this->domain = Config::get( 'qiNiuConfig.domain' );
        }else{
            $this->domain = Request::domain().'/';
        }
    }

    /**
     * 展示
     * @example {:widget('module/Imgs/html', [ $data, $type, $name ] )}
     * @param null $data    图片数据，一般在编辑时使用
     * @param null $type    数据类型，1：多图，默认单图
     * @param null $name    图片input框name名，用于表单提交  当type为1时，默认值为 imgs[]，否则默认值为 img
     */
    public function html( $data = null, $type = null, $name = null )
    {
        switch ( (int)$type )
        {
            case 1:
                    $name = $name ?: 'imgs[]';
                    $html = $this->imgs( $data, $name );
                break;
            default:
                    $name = $name ?: 'img';
                    $html = $this->img( $data, $name );
                break;
        }
        echo $html;
    }

    /**
     * 单图
     * @param string $data 图片数据
     * @param string $name input提交框name名
     * @return string
     */
    private function img( $data, $name )
    {
        $html = '<div class="ctImgBox">';
        if( $data ){
            $html .= '<div class="ctImgBoxDiv" style="display: block">';
        }else{
            $html .= '<div class="ctImgBoxDiv">';
        }

        $html .= '      <img class="ctUploadImgShow" src="'. $this->domain.$data .'?imageView2/0/w/80/interlace/1/q/100" alt="">
                    </div>
                    <span class="ctUploadImg ctUploadImg-'.$name.'" >
                        <i class="glyphicon glyphicon-cloud-upload"></i>
                    </span>
                    <input type="hidden" class="ctImgVal" value="'. $data .'" name="'.$name.'" id="ctImgVal" >
                </div>';
        return $html;
    }

    /**
     * 多图
     * @param mixed  $data   图片数据
     * @param string $name   input提交框name名
     * @return string
     */
    private function imgs( $data, $name )
    {
        $html = '<div class="ctImgBoxs">
                    <div class="imgs">';
            if( $data ){
                if( !is_array( $data ) ) $data = explode( ',', $data );
                $length = count( $data );
                if (count($data) == count($data, 1)) {
                    for ( $i=0; $i<$length; $i++ ){
                        $html .= '<div class="li">';

                                        if( strpos( $data[$i], 'mp3' ) || strpos( $data[$i], 'mp4' ) || strpos( $data[$i], 'ogg' ) || strpos( $data[$i], 'wav' ) ){
                                            $html .= '<video src="'.$this->domain.$data[$i].'"></video>';
                                        }else{
                                            $html .= '<img src="'.$this->domain.$data[$i].'?imageView2/0/w/80/interlace/1/q/80" alt="">';
                                        }

                                        $html .= '<span>更换</span>
                                        <input type="hidden" name="'.$name.'" value="'.$data[$i].'">
                                        <div class="ctImgBoxs-del-imgs">×</div>
                                    </div>';
                    }
                } else {
                    for ( $i=0; $i<$length; $i++ ){
                        $html .= '<div class="li">';

                                        if( strpos( $data[$i]['img'], 'mp3' ) || strpos( $data[$i]['img'], 'mp4' ) || strpos( $data[$i]['img'], 'ogg' ) || strpos( $data[$i]['img'], 'wav' ) ){
                                            $html .= '<video src="'.$this->domain.$data[$i]['img'].'?imageView2/0/w/80/interlace/1/q/80"></video>';
                                        }else{
                                            $html .= '<img src="'.$this->domain.$data[$i]['img'].'?imageView2/0/w/80/interlace/1/q/80" alt="">';
                                        }

                                        $html .= '<span>更换</span>
                                        <input type="hidden" name="'.$name.'" value="'.$data[$i]['img'].'">
                                         <div class="ctImgBoxs-del-imgs">×</div>
                                    </div>';
                    }
                }
            }
            $html.= '</div>
                    <div class="ctUploadImgs" data-name="'.$name.'">
                        <i class="glyphicon glyphicon-plus"></i>
                    </div>
                 </div>';
        return $html;
    }
}