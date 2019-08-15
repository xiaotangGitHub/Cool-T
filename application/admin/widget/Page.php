<?php
/**
 * Desc  ：Page.php      分页显示
 * Author: Cool-Team 😁
 * Since ：V1.0
 * Date  : 2019/4/4
 */

namespace app\admin\widget;


use think\Controller;

class Page extends Controller
{

    /**
     * 分页模板
     * @example {:widget('module/Page/html', [ $list, $type ] )}
     * @param object $list  分页数据( paginate )
     * @param string $type  分页展示类型
     */
    public function html( $list, $type = null )
    {
        if( $list->items() ){

            switch ( (int)$type )
            {
                //基础分页
                case 0:
                        $html = $this->pageHtml( $list );
                    break;
                //删除
                case 1:
                        $html = $this->delHtml( $list );
                    break;

                //状态 、 删除
                case 2:
                        $html = $this->statusAndDelHtml( $list );
                    break;

                //状态 、 动画 、 删除
                case 3:
                        $html = $this->statusAndAnimateAndDelHtml( $list );
                    break;

                //置顶 、 状态 、 删除
                case 4:
                        $html = $this->statusAndStickAndDelHtml( $list );
                    break;

                //基础分页
                default:
                        $html = $this->pageHtml( $list );
                    break;
            }
            echo $html;
        }
    }

    /**
     * 基础分页
     * @param $list
     * @return string
     */
    private function pageHtml( $list )
    {
        $html = '<div class="ctTablesFoot">
                    <div class="pull-right">
                     '. $list->render() .'
                    </div>
                </div>';
        return $html;
    }

    /**
     * 删除
     * @param $list
     * @return string
     */
    private function delHtml( $list )
    {
        $html = '<div class="ctTablesFoot">
                    <div class="pull-left">
                        <a class="btn btn-primary ctTable_selectAll">全选</a>
                        <a class="btn btn-primary ctTable_cancleAll">取消</a>
                        <a class="btn btn-danger ctTable_delAll">批量删除</a>
                    </div>
                    <div class="pull-right">
                        '. $list->render() .'
                    </div>
                </div>';
        return $html;
    }

    /**
     * 状态 、 删除
     * @param $list
     * @return string
     */
    private function statusAndDelHtml( $list )
    {
        $html = '<div class="ctTablesFoot">
                    <div class="pull-left">
                        <a class="btn btn-primary ctTable_selectAll">全选</a>
                        <a class="btn btn-primary ctTable_cancleAll">取消</a>
                        <a class="btn btn-success" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':1 })">批量启用/显示</a>
                        <a class="btn btn-warning" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':0 })">批量禁用/隐藏</a>
                        <a class="btn btn-danger ctTable_delAll">批量删除</a>
                    </div>
                    <div class="pull-right">
                     '. $list->render() .'
                    </div>
                </div>';
        return $html;
    }

    /**
     * 状态 、 动画  、 删除
     * @param $list
     * @return string
     */
    private function statusAndAnimateAndDelHtml( $list )
    {
        $html = '<div class="ctTablesFoot">
                    <div class="pull-left">
                        <a class="btn btn-primary ctTable_selectAll">全选</a>
                        <a class="btn btn-primary ctTable_cancleAll">取消</a>
                        <a class="btn btn-success" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':1 })">批量显示</a>
                        <a class="btn btn-warning" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':0 })">批量隐藏</a>
                        <a class="btn btn-success" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'animate_status\', \'value\':1 })">批量开启动画</a>
                        <a class="btn btn-warning" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'animate_status\', \'value\':0 })">批量关闭动画</a>
                        <a class="btn btn-danger ctTable_delAll">批量删除</a>
                    </div>
                    <div class="pull-right">
                       '. $list->render() .'
                    </div>
                </div>';
        return $html;
    }

    /**
     * 置顶 、 状态 、 删除
     * @param $list
     * @return string
     */
    private function statusAndStickAndDelHtml( $list )
    {
        $html = '<div class="ctTablesFoot">
                    <div class="pull-left">
                        <a class="btn btn-primary ctTable_selectAll">全选</a>
                        <a class="btn btn-primary ctTable_cancleAll">取消</a>
                        <a class="btn btn-success" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'stick\', \'value\':1 })">批量置顶</a>
                        <a class="btn btn-warning" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'stick\', \'value\':0 })">批量取消置顶</a>
                        <a class="btn btn-success" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':1 })">批量启用/显示</a>
                        <a class="btn btn-warning" onclick="ctSetField(this,{ \'id\':\'checkedAll\', \'field\':\'status\', \'value\':0 })">批量禁用/隐藏</a>
                        <a class="btn btn-danger ctTable_delAll">批量删除</a>
                    </div>
                    <div class="pull-right">
                        '. $list->render() .'
                    </div>
                </div>';
        return $html;
    }
}