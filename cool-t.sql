/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : cool-t

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-08-15 17:36:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ct_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin`;
CREATE TABLE `ct_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员表',
  `user_name` varchar(48) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` char(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` char(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '未绑定' COMMENT '邮箱',
  `theme_id` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '背景主题ID，0：随机',
  `ip` int(10) NOT NULL DEFAULT '0' COMMENT 'IP地址登陆限制  0：根据系统IP地址限制',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态',
  `time_bar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账号有效截止时间，超出禁止登陆 0：不限制',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of ct_admin
-- ----------------------------
INSERT INTO `ct_admin` VALUES ('1', 'tangpeng', '2359500046be25fed125073fca25ba5f', '13611626493', '1257390133@qq.com', '0', '0', '1', '0');
INSERT INTO `ct_admin` VALUES ('2', '3242424', '2359500046be25fed125073fca25ba5f', '13611626493', '1257390133@qq.com', '0', '0', '1', '1561737600');

-- ----------------------------
-- Table structure for `ct_admin_log_action`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin_log_action`;
CREATE TABLE `ct_admin_log_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `user_name` varchar(48) NOT NULL COMMENT '管理员账号',
  `path` varchar(100) NOT NULL COMMENT '操作菜单',
  `params` text NOT NULL COMMENT '参数',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `create_time` int(10) unsigned NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3366 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of ct_admin_log_action
-- ----------------------------
INSERT INTO `ct_admin_log_action` VALUES ('3250', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"58\"]}', '', '1561194880');
INSERT INTO `ct_admin_log_action` VALUES ('3251', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"234\",\"value\":\"2342\",\"desc\":\"2424\"}', '', '1561195343');
INSERT INTO `ct_admin_log_action` VALUES ('3252', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"62\"]}', '', '1561195348');
INSERT INTO `ct_admin_log_action` VALUES ('3253', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"admin_footer_text\",\"value\":\"©13611626493php@gmail.com\",\"desc\":\"后台底部文字内容\"}', '', '1561195521');
INSERT INTO `ct_admin_log_action` VALUES ('3254', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"admin_footer_url\",\"value\":\"https:\\/\\/github.com\\/xiaotangGitHub\",\"desc\":\"后台底部文字跳转链接\"}', '', '1561195553');
INSERT INTO `ct_admin_log_action` VALUES ('3255', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"324242\",\"value\":\"2342\",\"desc\":\"2342\"}', '添加系统全局配置', '1561279883');
INSERT INTO `ct_admin_log_action` VALUES ('3256', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"ewwe\",\"value\":\"wew\",\"desc\":\"wew\"}', '添加系统全局配置', '1561279911');
INSERT INTO `ct_admin_log_action` VALUES ('3257', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"weqqe\",\"value\":\"qeqe\",\"desc\":\"qeqw\"}', '添加系统全局配置', '1561280223');
INSERT INTO `ct_admin_log_action` VALUES ('3258', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"68\",\"67\",\"66\",\"65\"]}', '删除系统全局配置', '1561280371');
INSERT INTO `ct_admin_log_action` VALUES ('3259', '1', 'tangpeng', 'admin/Animate/add', '{\"key\":\"234\",\"filename\":\"242\",\"status\":\"1\"}', '添加站点背景主题', '1561281604');
INSERT INTO `ct_admin_log_action` VALUES ('3260', '1', 'tangpeng', 'admin/Animate/edit', '{\"key\":\"234\",\"filename\":\"242\",\"status\":\"0\",\"id\":\"44\"}', '修改站点背景主题', '1561281612');
INSERT INTO `ct_admin_log_action` VALUES ('3261', '1', 'tangpeng', 'admin/Animate/del', '{\"id\":[\"44\"]}', '删除站点背景主题', '1561281622');
INSERT INTO `ct_admin_log_action` VALUES ('3262', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"487\",\"488\",\"564\",\"571\",\"572\",\"573\",\"477\",\"291\",\"292\",\"293\",\"294\",\"295\",\"265\",\"266\",\"267\",\"268\",\"269\",\"519\",\"520\",\"521\"]}', '删除菜单', '1561284393');
INSERT INTO `ct_admin_log_action` VALUES ('3263', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"522\",\"523\",\"271\",\"272\",\"273\",\"274\",\"275\",\"402\",\"404\",\"406\",\"408\",\"366\",\"367\",\"368\",\"369\",\"370\",\"410\",\"411\",\"412\",\"413\"]}', '删除菜单', '1561284397');
INSERT INTO `ct_admin_log_action` VALUES ('3264', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"460\",\"461\",\"462\",\"463\",\"464\",\"465\",\"386\",\"387\",\"388\",\"389\",\"390\",\"391\",\"392\",\"302\",\"303\",\"304\",\"305\",\"306\",\"414\",\"415\"]}', '删除菜单', '1561284405');
INSERT INTO `ct_admin_log_action` VALUES ('3265', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"416\",\"417\",\"418\",\"419\",\"433\",\"434\",\"435\",\"436\",\"538\",\"361\",\"362\",\"363\",\"364\",\"365\",\"437\",\"438\",\"439\",\"440\",\"441\",\"381\"]}', '删除菜单', '1561284410');
INSERT INTO `ct_admin_log_action` VALUES ('3266', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"382\",\"383\",\"384\",\"385\"]}', '删除菜单', '1561284413');
INSERT INTO `ct_admin_log_action` VALUES ('3267', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"329\",\"330\",\"331\",\"332\",\"333\",\"334\",\"393\",\"449\",\"450\",\"451\",\"452\",\"453\",\"454\",\"533\",\"534\",\"535\",\"536\",\"537\",\"335\",\"336\"]}', '删除菜单', '1561284443');
INSERT INTO `ct_admin_log_action` VALUES ('3268', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"337\",\"338\",\"394\"]}', '删除菜单', '1561284447');
INSERT INTO `ct_admin_log_action` VALUES ('3269', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"343\",\"344\",\"345\",\"346\",\"347\",\"420\",\"421\",\"348\",\"349\",\"350\",\"351\",\"395\",\"396\",\"357\",\"358\",\"359\",\"360\",\"397\",\"398\",\"444\"]}', '删除菜单', '1561284459');
INSERT INTO `ct_admin_log_action` VALUES ('3270', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"445\",\"446\",\"447\",\"448\",\"352\",\"353\",\"354\",\"355\",\"356\"]}', '删除菜单', '1561284462');
INSERT INTO `ct_admin_log_action` VALUES ('3271', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"372\",\"373\",\"374\",\"375\",\"376\",\"377\",\"378\",\"379\",\"380\",\"399\",\"400\"]}', '删除菜单', '1561284469');
INSERT INTO `ct_admin_log_action` VALUES ('3272', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"297\",\"466\",\"545\",\"546\",\"547\",\"467\",\"468\",\"469\",\"470\",\"552\",\"553\",\"554\",\"555\"]}', '删除菜单', '1561284476');
INSERT INTO `ct_admin_log_action` VALUES ('3273', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"489\",\"543\",\"567\",\"491\",\"499\",\"539\",\"548\",\"565\",\"568\",\"492\",\"493\",\"494\",\"549\",\"495\",\"496\",\"500\",\"541\",\"550\",\"497\",\"498\"]}', '删除菜单', '1561284483');
INSERT INTO `ct_admin_log_action` VALUES ('3274', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"501\",\"542\",\"551\",\"561\",\"562\",\"563\",\"506\",\"507\",\"566\",\"423\",\"424\",\"425\",\"426\",\"427\",\"428\",\"429\",\"430\",\"431\",\"432\"]}', '删除菜单', '1561284486');
INSERT INTO `ct_admin_log_action` VALUES ('3275', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"277\",\"278\",\"279\",\"280\",\"281\",\"401\",\"276\",\"282\",\"283\",\"284\",\"285\",\"298\",\"299\",\"339\",\"340\",\"341\",\"442\",\"443\",\"455\",\"456\"]}', '删除菜单', '1561284497');
INSERT INTO `ct_admin_log_action` VALUES ('3276', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"457\",\"458\",\"459\",\"471\",\"472\",\"473\",\"474\",\"475\"]}', '删除菜单', '1561284502');
INSERT INTO `ct_admin_log_action` VALUES ('3277', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"514\",\"515\",\"516\",\"517\",\"518\",\"556\",\"557\",\"558\",\"559\",\"478\",\"479\",\"480\",\"481\",\"482\",\"483\",\"484\",\"485\",\"569\",\"570\",\"508\"]}', '删除菜单', '1561284512');
INSERT INTO `ct_admin_log_action` VALUES ('3278', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"509\",\"510\",\"511\",\"512\",\"502\",\"503\",\"504\",\"505\",\"524\",\"525\",\"526\",\"528\",\"529\",\"530\",\"531\",\"532\",\"540\"]}', '删除菜单', '1561284522');
INSERT INTO `ct_admin_log_action` VALUES ('3279', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"476\",\"270\",\"307\",\"342\",\"371\",\"296\",\"422\",\"264\",\"513\"]}', '删除菜单', '1561284530');
INSERT INTO `ct_admin_log_action` VALUES ('3280', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"0\",\"name\":\"2131\",\"module\":\"123\",\"controller\":\"12312\",\"action\":\"123213\",\"group_name\":\"12312\",\"sort\":\"12321\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561284556');
INSERT INTO `ct_admin_log_action` VALUES ('3281', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"574\",\"name\":\"2423\",\"module\":\"234\",\"controller\":\"4234\",\"action\":\"234\",\"group_name\":\"2342\",\"sort\":\"234\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561284606');
INSERT INTO `ct_admin_log_action` VALUES ('3282', '1', 'tangpeng', 'admin/Menu/setfield', '{\"id\":\"574\",\"field\":\"status\",\"value\":\"1\"}', '设置菜单状态', '1561284617');
INSERT INTO `ct_admin_log_action` VALUES ('3283', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"575\"]}', '删除菜单', '1561284628');
INSERT INTO `ct_admin_log_action` VALUES ('3284', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"0\",\"name\":\"wwwwwww\",\"module\":\"123\",\"controller\":\"12312\",\"action\":\"123213\",\"group_name\":\"12312\",\"sort\":\"12321\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"574\"}', '修改菜单', '1561284636');
INSERT INTO `ct_admin_log_action` VALUES ('3285', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"574\"]}', '删除菜单', '1561284639');
INSERT INTO `ct_admin_log_action` VALUES ('3286', '1', 'tangpeng', 'admin/Animate/setfield', '{\"id\":\"10\",\"field\":\"status\",\"value\":\"0\"}', '设置背景主题状态', '1561284649');
INSERT INTO `ct_admin_log_action` VALUES ('3287', '1', 'tangpeng', 'admin/Admin/add', '{\"user_name\":\"123456\",\"password\":\"123456\",\"mobile\":\"13611626493\",\"email\":\"1257390133@qq.com\",\"ip\":\"\",\"time_bar\":\"2019-06-23\",\"theme_id\":\"0\",\"status\":\"1\"}', '添加管理员', '1561286786');
INSERT INTO `ct_admin_log_action` VALUES ('3288', '1', 'tangpeng', 'admin/Admin/edit', '{\"user_name\":\"123456\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"mobile\":\"13611626493\",\"email\":\"1257390133@qq.com\",\"theme_id\":\"1\",\"time_bar\":\"2019-06-23\",\"status\":\"1\",\"id\":\"36\"}', '修改管理员', '1561286909');
INSERT INTO `ct_admin_log_action` VALUES ('3289', '1', 'tangpeng', 'admin/Admin/add', '{\"user_name\":\"324324\",\"password\":\"234234\",\"mobile\":\"13611626493\",\"email\":\"1257390133@qq.com\",\"ip\":\"\",\"time_bar\":\"2019-06-23\",\"theme_id\":\"0\",\"status\":\"1\"}', '添加管理员', '1561286945');
INSERT INTO `ct_admin_log_action` VALUES ('3290', '1', 'tangpeng', 'admin/Admin/add', '{\"user_name\":\"1232\",\"password\":\"tangpeng666\",\"mobile\":\"1232\",\"email\":\"297388910@qq.com\",\"ip\":\"343.233.43.44\",\"time_bar\":\"2019-06-23\",\"theme_id\":\"0\",\"status\":\"1\"}', '添加管理员', '1561286991');
INSERT INTO `ct_admin_log_action` VALUES ('3291', '1', 'tangpeng', 'admin/Admin/add', '{\"user_name\":\"123\",\"password\":\"tangpeng666\",\"mobile\":\"13611626492\",\"email\":\"1257390133@qq.com\",\"ip\":\"101.88.195.252\",\"time_bar\":\"2020-05-17\",\"theme_id\":\"0\",\"status\":\"1\"}', '添加管理员', '1561287158');
INSERT INTO `ct_admin_log_action` VALUES ('3292', '1', 'tangpeng', 'admin/Role/add', '{\"name\":\"23424\",\"desc\":\"242\",\"status\":\"1\"}', '添加管理员角色', '1561288760');
INSERT INTO `ct_admin_log_action` VALUES ('3293', '1', 'tangpeng', 'admin/Role/permission', '{\"data\":[{\"role_id\":\"9\",\"permission_id\":\"2\"},{\"role_id\":\"9\",\"permission_id\":\"12\"},{\"role_id\":\"9\",\"permission_id\":\"51\"},{\"role_id\":\"9\",\"permission_id\":\"52\"},{\"role_id\":\"9\",\"permission_id\":\"87\"},{\"role_id\":\"9\",\"permission_id\":\"55\"},{\"role_id\":\"9\",\"permission_id\":\"56\"},{\"role_id\":\"9\",\"permission_id\":\"57\"},{\"role_id\":\"9\",\"permission_id\":\"88\"},{\"role_id\":\"9\",\"permission_id\":\"89\"},{\"role_id\":\"9\",\"permission_id\":\"13\"},{\"role_id\":\"9\",\"permission_id\":\"14\"},{\"role_id\":\"9\",\"permission_id\":\"24\"},{\"role_id\":\"9\",\"permission_id\":\"90\"},{\"role_id\":\"9\",\"permission_id\":\"91\"},{\"role_id\":\"9\",\"permission_id\":\"27\"},{\"role_id\":\"9\",\"permission_id\":\"28\"},{\"role_id\":\"9\",\"permission_id\":\"29\"},{\"role_id\":\"9\",\"permission_id\":\"92\"},{\"role_id\":\"9\",\"permission_id\":\"93\"},{\"role_id\":\"9\",\"permission_id\":\"97\"},{\"role_id\":\"9\",\"permission_id\":\"544\"},{\"role_id\":\"9\",\"permission_id\":\"21\"},{\"role_id\":\"9\",\"permission_id\":\"25\"},{\"role_id\":\"9\",\"permission_id\":\"26\"},{\"role_id\":\"9\",\"permission_id\":\"53\"},{\"role_id\":\"9\",\"permission_id\":\"94\"},{\"role_id\":\"9\",\"permission_id\":\"95\"},{\"role_id\":\"9\",\"permission_id\":\"96\"},{\"role_id\":\"9\",\"permission_id\":\"41\"},{\"role_id\":\"9\",\"permission_id\":\"42\"},{\"role_id\":\"9\",\"permission_id\":\"43\"},{\"role_id\":\"9\",\"permission_id\":\"560\"}],\"id\":\"9\"}', '管理员角色权限设置', '1561288767');
INSERT INTO `ct_admin_log_action` VALUES ('3294', '1', 'tangpeng', 'admin/Role/permission', '{\"data\":[{\"role_id\":\"9\",\"permission_id\":\"2\"},{\"role_id\":\"9\",\"permission_id\":\"12\"},{\"role_id\":\"9\",\"permission_id\":\"51\"},{\"role_id\":\"9\",\"permission_id\":\"52\"},{\"role_id\":\"9\",\"permission_id\":\"87\"},{\"role_id\":\"9\",\"permission_id\":\"55\"},{\"role_id\":\"9\",\"permission_id\":\"56\"},{\"role_id\":\"9\",\"permission_id\":\"57\"},{\"role_id\":\"9\",\"permission_id\":\"88\"},{\"role_id\":\"9\",\"permission_id\":\"89\"},{\"role_id\":\"9\",\"permission_id\":\"13\"},{\"role_id\":\"9\",\"permission_id\":\"14\"},{\"role_id\":\"9\",\"permission_id\":\"24\"},{\"role_id\":\"9\",\"permission_id\":\"90\"},{\"role_id\":\"9\",\"permission_id\":\"91\"},{\"role_id\":\"9\",\"permission_id\":\"27\"},{\"role_id\":\"9\",\"permission_id\":\"28\"},{\"role_id\":\"9\",\"permission_id\":\"29\"},{\"role_id\":\"9\",\"permission_id\":\"92\"},{\"role_id\":\"9\",\"permission_id\":\"93\"},{\"role_id\":\"9\",\"permission_id\":\"97\"},{\"role_id\":\"9\",\"permission_id\":\"21\"},{\"role_id\":\"9\",\"permission_id\":\"25\"},{\"role_id\":\"9\",\"permission_id\":\"26\"},{\"role_id\":\"9\",\"permission_id\":\"53\"},{\"role_id\":\"9\",\"permission_id\":\"94\"},{\"role_id\":\"9\",\"permission_id\":\"95\"},{\"role_id\":\"9\",\"permission_id\":\"96\"},{\"role_id\":\"9\",\"permission_id\":\"41\"},{\"role_id\":\"9\",\"permission_id\":\"42\"},{\"role_id\":\"9\",\"permission_id\":\"43\"},{\"role_id\":\"9\",\"permission_id\":\"560\"}],\"id\":\"9\"}', '管理员角色权限设置', '1561288775');
INSERT INTO `ct_admin_log_action` VALUES ('3295', '1', 'tangpeng', 'admin/Role/edit', '{\"name\":\"wwwwwwwww\",\"desc\":\"242\",\"status\":\"1\",\"id\":\"9\"}', '修改管理员角色', '1561288784');
INSERT INTO `ct_admin_log_action` VALUES ('3296', '1', 'tangpeng', 'admin/Admin/setrole', '{\"data\":[{\"user_id\":\"36\",\"role_id\":\"9\"}],\"id\":\"36\",\"type\":\"set\"}', '管理员角色设置', '1561289375');
INSERT INTO `ct_admin_log_action` VALUES ('3297', '1', 'tangpeng', 'admin/Admin/setrole', '{\"data\":[{\"user_id\":\"37\",\"role_id\":\"1\"}],\"id\":\"37\",\"type\":\"set\"}', '管理员角色设置', '1561289397');
INSERT INTO `ct_admin_log_action` VALUES ('3298', '1', 'tangpeng', 'admin/Admin/setrole', '{\"data\":[{\"user_id\":\"36\",\"role_id\":\"1\"},{\"user_id\":\"36\",\"role_id\":\"9\"}],\"id\":\"36\",\"type\":\"set\"}', '管理员角色设置', '1561289404');
INSERT INTO `ct_admin_log_action` VALUES ('3299', '1', 'tangpeng', 'admin/Admin/setrole', '{\"data\":[{\"user_id\":\"36\",\"role_id\":\"1\"}],\"id\":\"36\",\"type\":\"set\"}', '管理员角色设置', '1561289409');
INSERT INTO `ct_admin_log_action` VALUES ('3300', '1', 'tangpeng', 'admin/Admin/setrole', '{\"data\":[{\"user_id\":\"38\",\"role_id\":\"9\"}],\"id\":\"38\",\"type\":\"set\"}', '管理员角色设置', '1561289416');
INSERT INTO `ct_admin_log_action` VALUES ('3301', '1', 'tangpeng', 'admin/Admin/del', '{\"id\":[\"38\"]}', '删除管理员', '1561289531');
INSERT INTO `ct_admin_log_action` VALUES ('3302', '1', 'tangpeng', 'admin/Role/del', '{\"id\":[\"9\"]}', '删除管理员角色', '1561289535');
INSERT INTO `ct_admin_log_action` VALUES ('3303', '1', 'tangpeng', 'admin/Admin/del', '{\"id\":[\"41\",\"37\",\"36\"]}', '删除管理员', '1561289541');
INSERT INTO `ct_admin_log_action` VALUES ('3304', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"544\"]}', '删除菜单', '1561289560');
INSERT INTO `ct_admin_log_action` VALUES ('3305', '1', 'tangpeng', 'admin/Admin/add', '{\"user_name\":\"3242424\",\"password\":\"tangpeng666\",\"mobile\":\"13611626493\",\"email\":\"1257390133@qq.com\",\"ip\":\"0\",\"time_bar\":\"2019-06-24\",\"theme_id\":\"0\",\"status\":\"1\"}', '添加管理员', '1561341033');
INSERT INTO `ct_admin_log_action` VALUES ('3306', '1', 'tangpeng', 'admin/Admin/edit', '{\"user_name\":\"3242424\",\"password\":\"2359500046be25fed125073fca25ba5f\",\"mobile\":\"13611626493\",\"email\":\"1257390133@qq.com\",\"ip\":\"0\",\"theme_id\":\"0\",\"time_bar\":\"2019-06-29\",\"status\":\"1\",\"id\":\"2\"}', '修改管理员', '1561341075');
INSERT INTO `ct_admin_log_action` VALUES ('3307', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_url\",\"value\":\"https:\\/\\/github.com\\/xiaotangGitHub\",\"desc\":\"站点底部版权说明跳转链接\",\"id\":\"64\"}', '修改系统全局配置', '1561426136');
INSERT INTO `ct_admin_log_action` VALUES ('3308', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_text\",\"value\":\"©13611626493php@gmail.com\",\"desc\":\"站点底部版权内容\",\"id\":\"63\"}', '修改系统全局配置', '1561426158');
INSERT INTO `ct_admin_log_action` VALUES ('3309', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_text\",\"value\":\"©13611626493php@gmail.co\",\"desc\":\"站点底部版权内容\",\"id\":\"63\"}', '修改系统全局配置', '1561426492');
INSERT INTO `ct_admin_log_action` VALUES ('3310', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_text\",\"value\":\"©13611626493php@gmail.com\",\"desc\":\"站点底部版权内容\",\"id\":\"63\"}', '修改系统全局配置', '1561426498');
INSERT INTO `ct_admin_log_action` VALUES ('3311', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_url\",\"value\":\"www.baidu.com\",\"desc\":\"站点底部版权说明跳转链接\",\"id\":\"64\"}', '修改系统全局配置', '1561426507');
INSERT INTO `ct_admin_log_action` VALUES ('3312', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_footer_url\",\"value\":\"https:\\/\\/github.com\\/xiaotangGitHub\",\"desc\":\"站点底部版权说明跳转链接\",\"id\":\"64\"}', '修改系统全局配置', '1561426518');
INSERT INTO `ct_admin_log_action` VALUES ('3313', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"文本配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"index\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"系统配置\",\"id\":\"12\"}', '修改菜单', '1561427090');
INSERT INTO `ct_admin_log_action` VALUES ('3314', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"添加文本配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"add\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"51\"}', '修改菜单', '1561427097');
INSERT INTO `ct_admin_log_action` VALUES ('3315', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"修改文本配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"edit\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"52\"}', '修改菜单', '1561427105');
INSERT INTO `ct_admin_log_action` VALUES ('3316', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"删除文本配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"del\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"87\"}', '修改菜单', '1561427114');
INSERT INTO `ct_admin_log_action` VALUES ('3317', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"2\",\"name\":\"图片配置\",\"module\":\"admin\",\"controller\":\"SystemConfig\",\"action\":\"index\",\"group_name\":\"系统配置\",\"sort\":\"5\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561427230');
INSERT INTO `ct_admin_log_action` VALUES ('3318', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"图片配置\",\"module\":\"admin\",\"controller\":\"SystemImg\",\"action\":\"index\",\"group_name\":\"系统配置\",\"sort\":\"5\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"561\"}', '修改菜单', '1561427283');
INSERT INTO `ct_admin_log_action` VALUES ('3319', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"2\",\"name\":\"添加图片配置\",\"module\":\"admin\",\"controller\":\"SystemImg\",\"action\":\"add\",\"group_name\":\"系统配置\",\"sort\":\"5\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561427290');
INSERT INTO `ct_admin_log_action` VALUES ('3320', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"2\",\"name\":\"修改图片配置\",\"module\":\"admin\",\"controller\":\"SystemImg\",\"action\":\"edit\",\"group_name\":\"系统配置\",\"sort\":\"5\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561427349');
INSERT INTO `ct_admin_log_action` VALUES ('3321', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"2\",\"name\":\"删除图片配置\",\"module\":\"admin\",\"controller\":\"SystemImg\",\"action\":\"del\",\"group_name\":\"系统配置\",\"sort\":\"5\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\"}', '添加菜单', '1561427380');
INSERT INTO `ct_admin_log_action` VALUES ('3322', '1', 'tangpeng', 'admin/Menu/del', '{\"id\":[\"561\",\"562\",\"563\",\"564\"]}', '删除菜单', '1561429354');
INSERT INTO `ct_admin_log_action` VALUES ('3323', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"全局配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"index\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"系统配置\",\"id\":\"12\"}', '修改菜单', '1561429371');
INSERT INTO `ct_admin_log_action` VALUES ('3324', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"添加全局配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"add\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"51\"}', '修改菜单', '1561429378');
INSERT INTO `ct_admin_log_action` VALUES ('3325', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"修改全局配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"edit\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"52\"}', '修改菜单', '1561429386');
INSERT INTO `ct_admin_log_action` VALUES ('3326', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"2\",\"name\":\"删除全局配置\",\"module\":\"admin\",\"controller\":\"System\",\"action\":\"del\",\"group_name\":\"系统配置\",\"sort\":\"0\",\"status\":\"0\",\"animate_status\":\"0\",\"description\":\"\",\"id\":\"87\"}', '修改菜单', '1561429394');
INSERT INTO `ct_admin_log_action` VALUES ('3327', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"343453\",\"type\":\"0\",\"value\":\"3453\",\"desc\":\"3453\"}', '添加系统全局配置', '1561443572');
INSERT INTO `ct_admin_log_action` VALUES ('3328', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"69\"]}', '删除系统全局配置', '1561443589');
INSERT INTO `ct_admin_log_action` VALUES ('3329', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"345\",\"type\":\"1\",\"value\":\"26a624f91f5a4f20353ce1d6eac94002.jpg\",\"desc\":\"345\"}', '添加系统全局配置', '1561444284');
INSERT INTO `ct_admin_log_action` VALUES ('3330', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"70\"]}', '删除系统全局配置', '1561444291');
INSERT INTO `ct_admin_log_action` VALUES ('3331', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"234\",\"type\":\"1\",\"value\":\"\",\"imgs\":\"26a624f91f5a4f20353ce1d6eac94002.jpg\",\"desc\":\"234\"}', '添加系统全局配置', '1561444697');
INSERT INTO `ct_admin_log_action` VALUES ('3332', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"71\"]}', '删除系统全局配置', '1561444704');
INSERT INTO `ct_admin_log_action` VALUES ('3333', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"我\",\"type\":\"1\",\"value\":\"26a624f91f5a4f20353ce1d6eac94002.jpg\",\"desc\":\"242\"}', '添加系统全局配置', '1561444724');
INSERT INTO `ct_admin_log_action` VALUES ('3334', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"2343\",\"type\":\"0\",\"value\":\"23432\",\"desc\":\"242\"}', '添加系统全局配置', '1561444778');
INSERT INTO `ct_admin_log_action` VALUES ('3335', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"ererrwr\",\"type\":\"1\",\"value\":\"5bb999dbb2c14d4c76ee1b73d04aeaf6.jpg\",\"desc\":\"werwr\"}', '添加系统全局配置', '1561444787');
INSERT INTO `ct_admin_log_action` VALUES ('3336', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"我\",\"type\":\"1\",\"value\":\"089347ccad4241d125f07332a6a10edb.jpg\",\"desc\":\"242\",\"id\":\"72\"}', '修改系统全局配置', '1561450269');
INSERT INTO `ct_admin_log_action` VALUES ('3337', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"我\",\"type\":\"1\",\"value\":\"089347ccad4241d125f07332a6a10edb.jpg\",\"desc\":\"242\",\"id\":\"72\"}', '修改系统全局配置', '1561450281');
INSERT INTO `ct_admin_log_action` VALUES ('3338', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"1123\",\"type\":\"1\",\"value\":\"640428992b1c069728dc176879f0c2b0.jpg\",\"desc\":\"1231\"}', '添加系统全局配置', '1561450406');
INSERT INTO `ct_admin_log_action` VALUES ('3339', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"2424\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"b20a6ea7cee822116f471155926b524c.jpg\",\"5d256462302d669a0dfc0b2d7058c754.jpg\"],\"desc\":\"243\"}', '添加系统全局配置', '1561450578');
INSERT INTO `ct_admin_log_action` VALUES ('3340', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"2424\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"b20a6ea7cee822116f471155926b524c.jpg\",\"640428992b1c069728dc176879f0c2b0.jpg\",\"5bb999dbb2c14d4c76ee1b73d04aeaf6.jpg\",\"089347ccad4241d125f07332a6a10edb.jpg\",\"cb62c8cee381472fa282cee8a0955487.jpg\"],\"desc\":\"243\",\"id\":\"76\"}', '修改系统全局配置', '1561450604');
INSERT INTO `ct_admin_log_action` VALUES ('3341', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"76\"]}', '删除系统全局配置', '1561450610');
INSERT INTO `ct_admin_log_action` VALUES ('3342', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"75\",\"74\",\"73\",\"72\"]}', '删除系统全局配置', '1561450618');
INSERT INTO `ct_admin_log_action` VALUES ('3343', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"345345\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"b20a6ea7cee822116f471155926b524c.jpg\",\"640428992b1c069728dc176879f0c2b0.jpg\"],\"desc\":\"4353\"}', '添加系统全局配置', '1561450627');
INSERT INTO `ct_admin_log_action` VALUES ('3344', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"34636\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"a45f1c1aef34b1db83d5035a304d4ed0.jpg\"],\"desc\":\"53453\"}', '添加系统全局配置', '1561450635');
INSERT INTO `ct_admin_log_action` VALUES ('3345', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"3453\",\"type\":\"0\",\"value\":\"34534\",\"desc\":\"35453\"}', '添加系统全局配置', '1561450685');
INSERT INTO `ct_admin_log_action` VALUES ('3346', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"242\",\"type\":\"0\",\"value\":\"242342\",\"desc\":\"2424242\"}', '添加系统全局配置', '1561450701');
INSERT INTO `ct_admin_log_action` VALUES ('3347', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"2423\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"5bb999dbb2c14d4c76ee1b73d04aeaf6.jpg\"],\"desc\":\"2342\"}', '添加系统全局配置', '1561450710');
INSERT INTO `ct_admin_log_action` VALUES ('3348', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"34636\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"b20a6ea7cee822116f471155926b524c.jpg\"],\"desc\":\"53453\",\"id\":\"78\"}', '修改系统全局配置', '1561450734');
INSERT INTO `ct_admin_log_action` VALUES ('3349', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"81\"]}', '删除系统全局配置', '1561450756');
INSERT INTO `ct_admin_log_action` VALUES ('3350', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"80\",\"79\",\"78\",\"77\"]}', '删除系统全局配置', '1561450763');
INSERT INTO `ct_admin_log_action` VALUES ('3351', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"640428992b1c069728dc176879f0c2b0.jpg\"],\"desc\":\"后台LOGO\"}', '添加系统全局配置', '1561450832');
INSERT INTO `ct_admin_log_action` VALUES ('3352', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"qiNiuStatus\",\"type\":\"0\",\"value\":\"1\",\"desc\":\"是否启用七牛云\"}', '添加系统全局配置', '1565837380');
INSERT INTO `ct_admin_log_action` VALUES ('3353', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"qiNiuStatus\",\"type\":\"0\",\"value\":\"1\",\"desc\":\"【 是否启用七牛云 】1：启用 0：禁用\\r\\n\",\"id\":\"83\"}', '修改系统全局配置', '1565837419');
INSERT INTO `ct_admin_log_action` VALUES ('3354', '1', 'tangpeng', 'admin/System/del', '{\"id\":[\"83\"]}', '删除系统全局配置', '1565837446');
INSERT INTO `ct_admin_log_action` VALUES ('3355', '1', 'tangpeng', 'admin/System/add', '{\"key\":\"qiNiuStatus\",\"type\":\"0\",\"value\":\"0\",\"desc\":\"【 是否启用七牛云 】 1：启用  0：禁用\"}', '添加系统全局配置', '1565837492');
INSERT INTO `ct_admin_log_action` VALUES ('3356', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"uploads\\/20190815\\/e82e64c08e9a682d750210e0c80afb2c.jpg\"],\"desc\":\"后台LOGO\",\"id\":\"82\"}', '修改系统全局配置', '1565839510');
INSERT INTO `ct_admin_log_action` VALUES ('3357', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"uploads\\/20190815\\/8b5677b307fca623d611d1b77b63458f.png\"],\"desc\":\"后台LOGO\",\"id\":\"82\"}', '修改系统全局配置', '1565839777');
INSERT INTO `ct_admin_log_action` VALUES ('3358', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"uploads\\/20190815\\/e82e64c08e9a682d750210e0c80afb2c.jpg\"],\"desc\":\"后台LOGO\",\"id\":\"82\"}', '修改系统全局配置', '1565839787');
INSERT INTO `ct_admin_log_action` VALUES ('3359', '1', 'tangpeng', 'admin/Menu/edit', '{\"parent_id\":\"0\",\"name\":\"系统\",\"module\":\"admin\",\"controller\":\"Menu\",\"action\":\"index\",\"group_name\":\"\",\"sort\":\"9999\",\"status\":\"1\",\"animate_status\":\"0\",\"description\":\"系统管理\",\"id\":\"2\"}', '修改菜单', '1565839954');
INSERT INTO `ct_admin_log_action` VALUES ('3360', '1', 'tangpeng', 'admin/Animate/setfield', '{\"id\":[\"1\",\"2\",\"3\",\"10\"],\"field\":\"status\",\"value\":\"0\"}', '设置背景主题状态', '1565840092');
INSERT INTO `ct_admin_log_action` VALUES ('3361', '1', 'tangpeng', 'admin/Animate/setfield', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '设置背景主题状态', '1565840913');
INSERT INTO `ct_admin_log_action` VALUES ('3362', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"uploads\\/20190815\\/b95a44466f6ab9556d485550503a65e2.jpg\"],\"desc\":\"后台LOGO\",\"id\":\"82\"}', '修改系统全局配置', '1565851322');
INSERT INTO `ct_admin_log_action` VALUES ('3363', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"qiNiuStatus\",\"type\":\"0\",\"value\":\"1\",\"desc\":\"【 是否启用七牛云 】 1：启用  0：禁用\",\"id\":\"84\"}', '修改系统全局配置', '1565851348');
INSERT INTO `ct_admin_log_action` VALUES ('3364', '1', 'tangpeng', 'admin/System/edit', '{\"key\":\"admin_logo\",\"type\":\"1\",\"value\":\"\",\"imgs\":[\"b95a44466f6ab9556d485550503a65e2.jpg\"],\"desc\":\"后台LOGO\",\"id\":\"82\"}', '修改系统全局配置', '1565851387');
INSERT INTO `ct_admin_log_action` VALUES ('3365', '1', 'tangpeng', 'admin/Menu/add', '{\"parent_id\":\"0\",\"name\":\"213\",\"module\":\"123\",\"controller\":\"123\",\"action\":\"213\",\"group_name\":\"\",\"sort\":\"\",\"status\":\"0\",\"description\":\"\"}', '添加菜单', '1565861442');

-- ----------------------------
-- Table structure for `ct_admin_log_login`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin_log_login`;
CREATE TABLE `ct_admin_log_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员登陆日志',
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `user_name` varchar(48) NOT NULL COMMENT '管理员账号',
  `mobile` char(11) DEFAULT NULL COMMENT '管理员手机号',
  `email` varchar(48) NOT NULL COMMENT '管理员邮箱',
  `ip` int(10) unsigned NOT NULL COMMENT '登陆IP',
  `create_time` int(10) unsigned NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COMMENT='管理员登陆日志';

-- ----------------------------
-- Records of ct_admin_log_login
-- ----------------------------
INSERT INTO `ct_admin_log_login` VALUES ('271', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561191771');
INSERT INTO `ct_admin_log_login` VALUES ('272', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561195382');
INSERT INTO `ct_admin_log_login` VALUES ('273', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561279186');
INSERT INTO `ct_admin_log_login` VALUES ('274', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561283414');
INSERT INTO `ct_admin_log_login` VALUES ('275', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561287040');
INSERT INTO `ct_admin_log_login` VALUES ('276', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561339253');
INSERT INTO `ct_admin_log_login` VALUES ('277', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561344507');
INSERT INTO `ct_admin_log_login` VALUES ('278', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561362175');
INSERT INTO `ct_admin_log_login` VALUES ('279', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561425235');
INSERT INTO `ct_admin_log_login` VALUES ('280', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561429339');
INSERT INTO `ct_admin_log_login` VALUES ('281', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561432959');
INSERT INTO `ct_admin_log_login` VALUES ('282', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561440249');
INSERT INTO `ct_admin_log_login` VALUES ('283', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561443903');
INSERT INTO `ct_admin_log_login` VALUES ('284', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561447776');
INSERT INTO `ct_admin_log_login` VALUES ('285', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561451526');
INSERT INTO `ct_admin_log_login` VALUES ('286', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1561460128');
INSERT INTO `ct_admin_log_login` VALUES ('287', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565836514');
INSERT INTO `ct_admin_log_login` VALUES ('288', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565840246');
INSERT INTO `ct_admin_log_login` VALUES ('289', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565840816');
INSERT INTO `ct_admin_log_login` VALUES ('290', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565840837');
INSERT INTO `ct_admin_log_login` VALUES ('291', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565840937');
INSERT INTO `ct_admin_log_login` VALUES ('292', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565847218');
INSERT INTO `ct_admin_log_login` VALUES ('293', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565851214');
INSERT INTO `ct_admin_log_login` VALUES ('294', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565852118');
INSERT INTO `ct_admin_log_login` VALUES ('295', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565852534');
INSERT INTO `ct_admin_log_login` VALUES ('296', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565859654');
INSERT INTO `ct_admin_log_login` VALUES ('297', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565861150');
INSERT INTO `ct_admin_log_login` VALUES ('298', '1', 'tangpeng', '13611626493', '1257390133@qq.com', '2130706433', '1565861430');

-- ----------------------------
-- Table structure for `ct_admin_log_pass`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin_log_pass`;
CREATE TABLE `ct_admin_log_pass` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员密码初始化日志',
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `user_name` varchar(48) NOT NULL COMMENT '管理员账号',
  `new_pass` int(6) unsigned NOT NULL COMMENT '初始化六位数新密码',
  `email` varchar(48) NOT NULL COMMENT '发送邮箱',
  `ip` int(10) unsigned NOT NULL COMMENT 'IP地址',
  `create_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员密码初始化日志';

-- ----------------------------
-- Records of ct_admin_log_pass
-- ----------------------------

-- ----------------------------
-- Table structure for `ct_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin_menu`;
CREATE TABLE `ct_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限菜单表',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '权限菜单名称',
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '权限菜单路径',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '权限菜单描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `group_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '未分组' COMMENT '分组',
  `checked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：默认不选中 1：默认选中',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限菜单表';

-- ----------------------------
-- Records of ct_admin_menu
-- ----------------------------
INSERT INTO `ct_admin_menu` VALUES ('2', '系统', 'admin/Menu/index', '0', '系统管理', '1', '9999', '', '0', '1541037348', '1565839954');
INSERT INTO `ct_admin_menu` VALUES ('12', '全局配置', 'admin/System/index', '2', '系统配置', '1', '0', '系统配置', '0', '1540890946', '1561429371');
INSERT INTO `ct_admin_menu` VALUES ('13', '菜单管理', 'admin/Menu/index', '2', '添加菜单', '1', '20', '权限管理', '1', '1541130827', '0');
INSERT INTO `ct_admin_menu` VALUES ('14', '添加菜单', 'admin/Menu/add', '2', '菜单管理', '0', '20', '权限管理', '0', '1541130779', '0');
INSERT INTO `ct_admin_menu` VALUES ('21', '角色管理', 'admin/Role/index', '2', '管理员角色管理', '1', '35', '权限管理', '0', '1541130729', '0');
INSERT INTO `ct_admin_menu` VALUES ('24', '编辑菜单', 'admin/Menu/edit', '2', '编辑菜单', '0', '20', '权限管理', '0', '1541130767', '0');
INSERT INTO `ct_admin_menu` VALUES ('25', '添加角色', 'admin/Role/add', '2', '', '0', '35', '权限管理', '0', '1541130720', '0');
INSERT INTO `ct_admin_menu` VALUES ('26', '修改角色', 'admin/Role/edit', '2', '', '0', '35', '权限管理', '0', '1541130710', '0');
INSERT INTO `ct_admin_menu` VALUES ('27', '用户管理', 'admin/Admin/index', '2', '管理员管理', '1', '30', '权限管理', '0', '1541130757', '0');
INSERT INTO `ct_admin_menu` VALUES ('28', '添加管理员', 'admin/Admin/add', '2', '', '0', '30', '权限管理', '0', '1541130748', '0');
INSERT INTO `ct_admin_menu` VALUES ('29', '编辑管理员', 'admin/Admin/edit', '2', '', '0', '30', '权限管理', '0', '1541130739', '0');
INSERT INTO `ct_admin_menu` VALUES ('41', '登陆日志', 'admin/Logs/login', '2', '管理员登陆日志', '1', '40', '日志', '0', '1541130679', '0');
INSERT INTO `ct_admin_menu` VALUES ('42', '操作日志', 'admin/Logs/adminAction', '2', '管理员操作日志', '1', '45', '日志', '0', '1541130669', '0');
INSERT INTO `ct_admin_menu` VALUES ('43', '密码找回日志', 'admin/Logs/mailPass', '2', '管理员通过登陆页使用邮箱找回密码', '1', '50', '日志', '0', '1541130658', '0');
INSERT INTO `ct_admin_menu` VALUES ('47', '个人管理员设置', 'admin/adminUser/查看子菜单', '0', '个人管理员操作：\r\n账号设置\r\n操作日志\r\n登陆日志', '0', '999999', '', '0', '1541058159', '0');
INSERT INTO `ct_admin_menu` VALUES ('48', '账号设置', 'admin/adminUser/setAccount', '47', '', '0', '0', '', '0', '1540800336', '0');
INSERT INTO `ct_admin_menu` VALUES ('49', '操作日志', 'admin/adminUser/actionLogs', '47', '个人管理员操作日志', '0', '0', '', '0', '1540802551', '0');
INSERT INTO `ct_admin_menu` VALUES ('50', '登陆日志', 'admin/adminUser/loginLogs', '47', '个人管理员登陆日志\r\n', '0', '0', '', '0', '1540803774', '0');
INSERT INTO `ct_admin_menu` VALUES ('51', '添加全局配置', 'admin/System/add', '2', '', '0', '0', '系统配置', '0', '1541131012', '1561429378');
INSERT INTO `ct_admin_menu` VALUES ('52', '修改全局配置', 'admin/System/edit', '2', '', '0', '0', '系统配置', '0', '1540865382', '1561429386');
INSERT INTO `ct_admin_menu` VALUES ('53', '角色权限', 'admin/Role/permission', '2', '角色权限设置', '0', '35', '权限管理', '0', '1541130688', '0');
INSERT INTO `ct_admin_menu` VALUES ('55', '背景主题', 'admin/Animate/index', '2', '背景主题动画设置', '1', '10', '系统配置', '0', '1541130857', '0');
INSERT INTO `ct_admin_menu` VALUES ('56', '添加背景主题', 'admin/Animate/add', '2', '', '0', '10', '系统配置', '0', '1541130848', '0');
INSERT INTO `ct_admin_menu` VALUES ('57', '修改背景主题', 'admin/Animate/edit', '2', '', '0', '10', '系统配置', '0', '1541130837', '0');
INSERT INTO `ct_admin_menu` VALUES ('87', '删除全局配置', 'admin/System/del', '2', '', '0', '0', '系统配置', '0', '1541131036', '1561429394');
INSERT INTO `ct_admin_menu` VALUES ('88', '删除背景主题', 'admin/Animate/del', '2', '', '0', '10', '系统配置', '0', '1541131104', '0');
INSERT INTO `ct_admin_menu` VALUES ('89', '设置单值-背景主题', 'admin/Animate/setField', '2', '', '0', '10', '系统配置', '0', '1541131216', '0');
INSERT INTO `ct_admin_menu` VALUES ('90', '删除菜单', 'admin/Menu/del', '2', '', '0', '20', '权限管理', '0', '1541131263', '0');
INSERT INTO `ct_admin_menu` VALUES ('91', '设置单值-菜单管理', 'admin/Menu/setField', '2', '', '0', '20', '权限管理', '0', '1541131307', '0');
INSERT INTO `ct_admin_menu` VALUES ('92', '删除管理员', 'admin/Admin/del', '2', '', '0', '30', '权限管理', '0', '1541131390', '0');
INSERT INTO `ct_admin_menu` VALUES ('93', '设置单值-管理员管理', 'admin/Admin/setField', '2', '', '0', '30', '权限管理', '0', '1541131444', '0');
INSERT INTO `ct_admin_menu` VALUES ('94', '删除角色', 'admin/Role/del', '2', '', '0', '35', '权限管理', '0', '1541131493', '0');
INSERT INTO `ct_admin_menu` VALUES ('95', '设置单值-角色管理', 'admin/Role/setField', '2', '', '0', '35', '权限管理', '0', '1541131529', '0');
INSERT INTO `ct_admin_menu` VALUES ('96', '设置权限', 'admin/Role/permission', '2', '', '0', '35', '权限管理', '0', '1541131610', '0');
INSERT INTO `ct_admin_menu` VALUES ('97', '为管理员分配系统角色', 'admin/Admin/setRole', '2', '', '0', '30', '权限管理', '0', '1544076504', '0');
INSERT INTO `ct_admin_menu` VALUES ('560', '系统错误日志', 'admin/Exception/index', '2', '', '1', '60', '日志', '0', '1560518089', '1560518089');
INSERT INTO `ct_admin_menu` VALUES ('561', '213', '123/123/213', '0', '', '0', '0', '', '0', '1565861442', '1565861442');

-- ----------------------------
-- Table structure for `ct_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `ct_admin_role`;
CREATE TABLE `ct_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色对应关系表',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户角色对应关系表';

-- ----------------------------
-- Records of ct_admin_role
-- ----------------------------
INSERT INTO `ct_admin_role` VALUES ('22', '1', '1');
INSERT INTO `ct_admin_role` VALUES ('27', '14', '1');
INSERT INTO `ct_admin_role` VALUES ('28', '13', '1');
INSERT INTO `ct_admin_role` VALUES ('33', '18', '1');
INSERT INTO `ct_admin_role` VALUES ('38', '20', '1');
INSERT INTO `ct_admin_role` VALUES ('39', '23', '5');
INSERT INTO `ct_admin_role` VALUES ('40', '21', '1');
INSERT INTO `ct_admin_role` VALUES ('41', '24', '6');
INSERT INTO `ct_admin_role` VALUES ('44', '25', '7');
INSERT INTO `ct_admin_role` VALUES ('45', '26', '8');

-- ----------------------------
-- Table structure for `ct_bg_animate`
-- ----------------------------
DROP TABLE IF EXISTS `ct_bg_animate`;
CREATE TABLE `ct_bg_animate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '背景主题表',
  `key` varchar(30) NOT NULL COMMENT '背景特效',
  `filename` varchar(30) NOT NULL COMMENT '文件名称',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：启用',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='背景主题表';

-- ----------------------------
-- Records of ct_bg_animate
-- ----------------------------
INSERT INTO `ct_bg_animate` VALUES ('1', '休闲文艺 是真的休闲', '/static/admin/animate/1/1.js', '0', '1540977274', null);
INSERT INTO `ct_bg_animate` VALUES ('2', '天空之城 亮的一批~', '/static/admin/animate/2/2.js', '0', '1540977274', null);
INSERT INTO `ct_bg_animate` VALUES ('3', '日落枫叶 沙沙沙~~~', '/static/admin/animate/3/3.js', '1', '1540977274', null);
INSERT INTO `ct_bg_animate` VALUES ('10', '野狼 嗷呜~嗷呜~~', '/static/admin/animate/4/4.js', '0', '1540977274', null);

-- ----------------------------
-- Table structure for `ct_imgs_category`
-- ----------------------------
DROP TABLE IF EXISTS `ct_imgs_category`;
CREATE TABLE `ct_imgs_category` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片库分类',
  `admin_id` int(5) unsigned NOT NULL COMMENT '管理员ID',
  `name` varchar(90) NOT NULL COMMENT '图片库名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='图片库分类';

-- ----------------------------
-- Records of ct_imgs_category
-- ----------------------------
INSERT INTO `ct_imgs_category` VALUES ('33', '1', '文件夹');

-- ----------------------------
-- Table structure for `ct_imgs_resource`
-- ----------------------------
DROP TABLE IF EXISTS `ct_imgs_resource`;
CREATE TABLE `ct_imgs_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片库',
  `imgs_cid` int(5) unsigned NOT NULL COMMENT '分类',
  `path` varchar(90) NOT NULL COMMENT '图片路径',
  `img` varchar(90) NOT NULL COMMENT '图片名称',
  `name` varchar(255) NOT NULL COMMENT '图片名称',
  `size` varchar(30) NOT NULL COMMENT '图片大小/kb',
  `ext` varchar(20) NOT NULL COMMENT '后缀',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '假删除  1：以被删除 0：未被删除',
  `addtime` int(10) unsigned NOT NULL COMMENT '图片添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='图片库';

-- ----------------------------
-- Records of ct_imgs_resource
-- ----------------------------
INSERT INTO `ct_imgs_resource` VALUES ('1', '31', 'uploads/20190625/', '5bb999dbb2c14d4c76ee1b73d04aeaf6.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '1', '1561443800');
INSERT INTO `ct_imgs_resource` VALUES ('2', '31', 'uploads/20190625/', '26a624f91f5a4f20353ce1d6eac94002.jpg', 'bg.jpg', '1862900', 'jpg', '1', '1561443922');
INSERT INTO `ct_imgs_resource` VALUES ('3', '31', 'uploads/20190625/', '42d8d6cd1ed8f4a8bf74444635487e61.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1561447803');
INSERT INTO `ct_imgs_resource` VALUES ('4', '31', 'uploads/20190625/', 'a45f1c1aef34b1db83d5035a304d4ed0.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1561447938');
INSERT INTO `ct_imgs_resource` VALUES ('5', '31', 'uploads/20190625/', 'cb62c8cee381472fa282cee8a0955487.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1561447973');
INSERT INTO `ct_imgs_resource` VALUES ('6', '31', 'uploads/20190625/', '089347ccad4241d125f07332a6a10edb.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1561448066');
INSERT INTO `ct_imgs_resource` VALUES ('7', '31', 'uploads/20190625/', '5d256462302d669a0dfc0b2d7058c754.jpg', 'bg.jpg', '1862900', 'jpg', '1', '1561448085');
INSERT INTO `ct_imgs_resource` VALUES ('8', '31', 'uploads/20190625/', '715f79a9229fc5e936d5e901ab2450a0.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '1', '1561448255');
INSERT INTO `ct_imgs_resource` VALUES ('9', '31', 'uploads/20190625/', '1c3cd43b9ae8bcb5b2a08475e761868d.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '1', '1561448272');
INSERT INTO `ct_imgs_resource` VALUES ('10', '31', 'uploads/20190625/', 'bab77d8b744eff574a1aed4306996d74.jpg', 'bg.jpg', '1862900', 'jpg', '1', '1561448405');
INSERT INTO `ct_imgs_resource` VALUES ('11', '31', 'uploads/20190625/', '640428992b1c069728dc176879f0c2b0.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '1', '1561448450');
INSERT INTO `ct_imgs_resource` VALUES ('12', '31', 'uploads/20190625/', 'b20a6ea7cee822116f471155926b524c.jpg', 'bg.jpg', '1862900', 'jpg', '1', '1561448691');
INSERT INTO `ct_imgs_resource` VALUES ('13', '31', 'uploads/20190815/', 'e090c7ddde7a68e2aaa1e16653f8a2bb.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1565837610');
INSERT INTO `ct_imgs_resource` VALUES ('14', '31', 'uploads/20190815/', '92d301cc47fa7f30cf0da873215ed972.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1565837621');
INSERT INTO `ct_imgs_resource` VALUES ('15', '31', 'uploads/20190815/', 'a1566e44cab3bf1b04bedcf3861a41ef.jpg', '01c31455fd49c432f875a13222aef9.jpg@900w_1l_2o_100sh.jpg', '70329', 'jpg', '1', '1565838732');
INSERT INTO `ct_imgs_resource` VALUES ('16', '33', 'uploads/20190815/', 'e82e64c08e9a682d750210e0c80afb2c.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '1', '1565839235');
INSERT INTO `ct_imgs_resource` VALUES ('17', '33', 'uploads/20190815/', '8b5677b307fca623d611d1b77b63458f.png', 'LOGO-TEAM.png', '14944', 'png', '1', '1565839772');
INSERT INTO `ct_imgs_resource` VALUES ('18', '33', 'uploads/20190815/', '52539890a148ac4b5d34e25345b8ca2b.png', 'LOGO-TEAM.png', '14944', 'png', '0', '1565851311');
INSERT INTO `ct_imgs_resource` VALUES ('19', '33', 'uploads/20190815/', 'b95a44466f6ab9556d485550503a65e2.jpg', '9ae8a12b3e7a89542c024f207071453f_1.jpg', '39233', 'jpg', '0', '1565851319');

-- ----------------------------
-- Table structure for `ct_role_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ct_role_admin`;
CREATE TABLE `ct_role_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色管理表',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `desc` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '角色状态',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色管理表';

-- ----------------------------
-- Records of ct_role_admin
-- ----------------------------
INSERT INTO `ct_role_admin` VALUES ('1', '超级管理员', '拥有所有菜单权限,且不可修改', '1', '0');

-- ----------------------------
-- Table structure for `ct_role_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ct_role_admin_menu`;
CREATE TABLE `ct_role_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色-菜单对应表',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `permission_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3712 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-菜单对应表';

-- ----------------------------
-- Records of ct_role_admin_menu
-- ----------------------------
INSERT INTO `ct_role_admin_menu` VALUES ('3', '1', '2');
INSERT INTO `ct_role_admin_menu` VALUES ('9', '1', '3');
INSERT INTO `ct_role_admin_menu` VALUES ('11', '1', '12');
INSERT INTO `ct_role_admin_menu` VALUES ('12', '1', '13');
INSERT INTO `ct_role_admin_menu` VALUES ('13', '1', '15');
INSERT INTO `ct_role_admin_menu` VALUES ('18', '1', '20');
INSERT INTO `ct_role_admin_menu` VALUES ('19', '1', '21');
INSERT INTO `ct_role_admin_menu` VALUES ('20', '1', '23');
INSERT INTO `ct_role_admin_menu` VALUES ('21', '1', '24');
INSERT INTO `ct_role_admin_menu` VALUES ('22', '1', '14');
INSERT INTO `ct_role_admin_menu` VALUES ('23', '1', '25');
INSERT INTO `ct_role_admin_menu` VALUES ('24', '1', '26');
INSERT INTO `ct_role_admin_menu` VALUES ('95', '1', '27');
INSERT INTO `ct_role_admin_menu` VALUES ('96', '1', '28');
INSERT INTO `ct_role_admin_menu` VALUES ('97', '1', '29');
INSERT INTO `ct_role_admin_menu` VALUES ('135', '1', '41');
INSERT INTO `ct_role_admin_menu` VALUES ('136', '1', '42');
INSERT INTO `ct_role_admin_menu` VALUES ('137', '1', '43');
INSERT INTO `ct_role_admin_menu` VALUES ('141', '1', '47');
INSERT INTO `ct_role_admin_menu` VALUES ('142', '1', '48');
INSERT INTO `ct_role_admin_menu` VALUES ('143', '1', '49');
INSERT INTO `ct_role_admin_menu` VALUES ('144', '1', '50');
INSERT INTO `ct_role_admin_menu` VALUES ('252', '1', '51');
INSERT INTO `ct_role_admin_menu` VALUES ('253', '1', '52');
INSERT INTO `ct_role_admin_menu` VALUES ('254', '1', '53');
INSERT INTO `ct_role_admin_menu` VALUES ('370', '1', '55');
INSERT INTO `ct_role_admin_menu` VALUES ('371', '1', '56');
INSERT INTO `ct_role_admin_menu` VALUES ('372', '1', '57');
INSERT INTO `ct_role_admin_menu` VALUES ('373', '1', '58');
INSERT INTO `ct_role_admin_menu` VALUES ('375', '1', '60');
INSERT INTO `ct_role_admin_menu` VALUES ('379', '1', '64');
INSERT INTO `ct_role_admin_menu` VALUES ('385', '1', '70');
INSERT INTO `ct_role_admin_menu` VALUES ('402', '1', '87');
INSERT INTO `ct_role_admin_menu` VALUES ('403', '1', '88');
INSERT INTO `ct_role_admin_menu` VALUES ('404', '1', '89');
INSERT INTO `ct_role_admin_menu` VALUES ('405', '1', '90');
INSERT INTO `ct_role_admin_menu` VALUES ('406', '1', '91');
INSERT INTO `ct_role_admin_menu` VALUES ('407', '1', '92');
INSERT INTO `ct_role_admin_menu` VALUES ('408', '1', '93');
INSERT INTO `ct_role_admin_menu` VALUES ('409', '1', '94');
INSERT INTO `ct_role_admin_menu` VALUES ('410', '1', '95');
INSERT INTO `ct_role_admin_menu` VALUES ('411', '1', '96');
INSERT INTO `ct_role_admin_menu` VALUES ('412', '1', '97');
INSERT INTO `ct_role_admin_menu` VALUES ('2382', '1', '486');
INSERT INTO `ct_role_admin_menu` VALUES ('2957', '1', '560');
INSERT INTO `ct_role_admin_menu` VALUES ('3570', '8', '2');
INSERT INTO `ct_role_admin_menu` VALUES ('3571', '8', '12');
INSERT INTO `ct_role_admin_menu` VALUES ('3572', '8', '51');
INSERT INTO `ct_role_admin_menu` VALUES ('3573', '8', '52');
INSERT INTO `ct_role_admin_menu` VALUES ('3574', '8', '87');
INSERT INTO `ct_role_admin_menu` VALUES ('3575', '8', '55');
INSERT INTO `ct_role_admin_menu` VALUES ('3576', '8', '56');
INSERT INTO `ct_role_admin_menu` VALUES ('3577', '8', '57');
INSERT INTO `ct_role_admin_menu` VALUES ('3578', '8', '88');
INSERT INTO `ct_role_admin_menu` VALUES ('3579', '8', '89');
INSERT INTO `ct_role_admin_menu` VALUES ('3580', '8', '13');
INSERT INTO `ct_role_admin_menu` VALUES ('3581', '8', '14');
INSERT INTO `ct_role_admin_menu` VALUES ('3582', '8', '24');
INSERT INTO `ct_role_admin_menu` VALUES ('3583', '8', '90');
INSERT INTO `ct_role_admin_menu` VALUES ('3584', '8', '91');
INSERT INTO `ct_role_admin_menu` VALUES ('3585', '8', '27');
INSERT INTO `ct_role_admin_menu` VALUES ('3586', '8', '28');
INSERT INTO `ct_role_admin_menu` VALUES ('3587', '8', '29');
INSERT INTO `ct_role_admin_menu` VALUES ('3588', '8', '92');
INSERT INTO `ct_role_admin_menu` VALUES ('3589', '8', '93');
INSERT INTO `ct_role_admin_menu` VALUES ('3590', '8', '97');
INSERT INTO `ct_role_admin_menu` VALUES ('3592', '8', '21');
INSERT INTO `ct_role_admin_menu` VALUES ('3593', '8', '25');
INSERT INTO `ct_role_admin_menu` VALUES ('3594', '8', '26');
INSERT INTO `ct_role_admin_menu` VALUES ('3595', '8', '53');
INSERT INTO `ct_role_admin_menu` VALUES ('3596', '8', '94');
INSERT INTO `ct_role_admin_menu` VALUES ('3597', '8', '95');
INSERT INTO `ct_role_admin_menu` VALUES ('3598', '8', '96');
INSERT INTO `ct_role_admin_menu` VALUES ('3599', '8', '41');
INSERT INTO `ct_role_admin_menu` VALUES ('3600', '8', '42');
INSERT INTO `ct_role_admin_menu` VALUES ('3601', '8', '43');
INSERT INTO `ct_role_admin_menu` VALUES ('3602', '8', '560');
INSERT INTO `ct_role_admin_menu` VALUES ('3679', '9', '2');
INSERT INTO `ct_role_admin_menu` VALUES ('3680', '9', '12');
INSERT INTO `ct_role_admin_menu` VALUES ('3681', '9', '51');
INSERT INTO `ct_role_admin_menu` VALUES ('3682', '9', '52');
INSERT INTO `ct_role_admin_menu` VALUES ('3683', '9', '87');
INSERT INTO `ct_role_admin_menu` VALUES ('3684', '9', '55');
INSERT INTO `ct_role_admin_menu` VALUES ('3685', '9', '56');
INSERT INTO `ct_role_admin_menu` VALUES ('3686', '9', '57');
INSERT INTO `ct_role_admin_menu` VALUES ('3687', '9', '88');
INSERT INTO `ct_role_admin_menu` VALUES ('3688', '9', '89');
INSERT INTO `ct_role_admin_menu` VALUES ('3689', '9', '13');
INSERT INTO `ct_role_admin_menu` VALUES ('3690', '9', '14');
INSERT INTO `ct_role_admin_menu` VALUES ('3691', '9', '24');
INSERT INTO `ct_role_admin_menu` VALUES ('3692', '9', '90');
INSERT INTO `ct_role_admin_menu` VALUES ('3693', '9', '91');
INSERT INTO `ct_role_admin_menu` VALUES ('3694', '9', '27');
INSERT INTO `ct_role_admin_menu` VALUES ('3695', '9', '28');
INSERT INTO `ct_role_admin_menu` VALUES ('3696', '9', '29');
INSERT INTO `ct_role_admin_menu` VALUES ('3697', '9', '92');
INSERT INTO `ct_role_admin_menu` VALUES ('3698', '9', '93');
INSERT INTO `ct_role_admin_menu` VALUES ('3699', '9', '97');
INSERT INTO `ct_role_admin_menu` VALUES ('3700', '9', '21');
INSERT INTO `ct_role_admin_menu` VALUES ('3701', '9', '25');
INSERT INTO `ct_role_admin_menu` VALUES ('3702', '9', '26');
INSERT INTO `ct_role_admin_menu` VALUES ('3703', '9', '53');
INSERT INTO `ct_role_admin_menu` VALUES ('3704', '9', '94');
INSERT INTO `ct_role_admin_menu` VALUES ('3705', '9', '95');
INSERT INTO `ct_role_admin_menu` VALUES ('3706', '9', '96');
INSERT INTO `ct_role_admin_menu` VALUES ('3707', '9', '41');
INSERT INTO `ct_role_admin_menu` VALUES ('3708', '9', '42');
INSERT INTO `ct_role_admin_menu` VALUES ('3709', '9', '43');
INSERT INTO `ct_role_admin_menu` VALUES ('3710', '9', '560');
INSERT INTO `ct_role_admin_menu` VALUES ('3711', '1', '561');

-- ----------------------------
-- Table structure for `ct_send_mail_log`
-- ----------------------------
DROP TABLE IF EXISTS `ct_send_mail_log`;
CREATE TABLE `ct_send_mail_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮件发送日志',
  `email` varchar(90) NOT NULL COMMENT '邮箱',
  `title` varchar(255) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `create_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COMMENT='邮件发送日志';

-- ----------------------------
-- Records of ct_send_mail_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ct_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `ct_system_config`;
CREATE TABLE `ct_system_config` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统配置表',
  `key` varchar(255) NOT NULL COMMENT 'key键',
  `value` varchar(255) NOT NULL COMMENT 'key值',
  `desc` varchar(255) NOT NULL COMMENT '配置项描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数据类型 0：本文 1：图片',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of ct_system_config
-- ----------------------------
INSERT INTO `ct_system_config` VALUES ('1', 'ip', '0', '允许登陆系统的IP地址，多个以逗号\",\"分隔，0为不限制', '0', '1540883635', '1544423120');
INSERT INTO `ct_system_config` VALUES ('2', 'login_jump', '1', '如果登陆后进入登录页，是否直接跳转至后台首页  1：是  0：否', '0', '1540883635', '1543036438');
INSERT INTO `ct_system_config` VALUES ('3', 'email_name', '13611626493php@gmail.com', '邮箱发送人', '0', '1540883635', null);
INSERT INTO `ct_system_config` VALUES ('4', 'email_account', 'php_tangpeng@foxmail.com', '邮箱发送账号', '0', '1540883635', '1554364669');
INSERT INTO `ct_system_config` VALUES ('5', 'email_pass', 'zvljzlocnpeqieif', '邮箱授权码', '0', '1540883635', '1560763232');
INSERT INTO `ct_system_config` VALUES ('18', 'captcha_text', 'qwertyuiopasdfghjklzxcvbnm', '验证码随机生成字符串', '0', '1540883635', '1557713445');
INSERT INTO `ct_system_config` VALUES ('19', 'global_menu_animate', '-1', '所有菜单动态加载设置\r\n-1：全部静态；\r\n1 ：全部动态；\r\n其它：跟随菜单设置；', '0', '1540889073', '1557908930');
INSERT INTO `ct_system_config` VALUES ('21', 'msgAudio', '0', '操作提示音\r\n1：开启；\r\n其它：关闭；', '0', '1540977865', '1559526915');
INSERT INTO `ct_system_config` VALUES ('63', 'admin_footer_text', '©13611626493php@gmail.com', '站点底部版权内容', '0', '1561195521', '1561426498');
INSERT INTO `ct_system_config` VALUES ('64', 'admin_footer_url', 'https://github.com/xiaotangGitHub', '站点底部版权说明跳转链接', '0', '1561195553', '1561426518');
INSERT INTO `ct_system_config` VALUES ('84', 'qiNiuStatus', '1', '【 是否启用七牛云 】 1：启用  0：禁用', '0', '1565837492', '1565851348');
INSERT INTO `ct_system_config` VALUES ('82', 'admin_logo', 'b95a44466f6ab9556d485550503a65e2.jpg', '后台LOGO', '1', '1561450832', '1565851387');

-- ----------------------------
-- Table structure for `ct_system_exception`
-- ----------------------------
DROP TABLE IF EXISTS `ct_system_exception`;
CREATE TABLE `ct_system_exception` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统异常错误日志',
  `code` int(6) unsigned DEFAULT NULL COMMENT '错误码',
  `message` text COMMENT '错误信息',
  `file` varchar(255) DEFAULT NULL COMMENT '错误文件',
  `line` int(4) unsigned DEFAULT NULL COMMENT '错误行数',
  `create_time` int(10) unsigned NOT NULL COMMENT '发生错误时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2786 DEFAULT CHARSET=utf8 COMMENT='系统异常错误日志';

-- ----------------------------
-- Records of ct_system_exception
-- ----------------------------
INSERT INTO `ct_system_exception` VALUES ('1752', '0', 'Illegal offset type in isset or empty', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Session.php', '275', '1561191649');
INSERT INTO `ct_system_exception` VALUES ('1753', '0', 'Illegal offset type in isset or empty', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Session.php', '275', '1561191694');
INSERT INTO `ct_system_exception` VALUES ('1754', '0', 'module not exists:program', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561191772');
INSERT INTO `ct_system_exception` VALUES ('1755', '0', 'module not exists:system', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561191878');
INSERT INTO `ct_system_exception` VALUES ('1756', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '203', '1561191883');
INSERT INTO `ct_system_exception` VALUES ('1757', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192014');
INSERT INTO `ct_system_exception` VALUES ('1758', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '203', '1561192026');
INSERT INTO `ct_system_exception` VALUES ('1759', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192043');
INSERT INTO `ct_system_exception` VALUES ('1760', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192056');
INSERT INTO `ct_system_exception` VALUES ('1761', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192057');
INSERT INTO `ct_system_exception` VALUES ('1762', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192058');
INSERT INTO `ct_system_exception` VALUES ('1763', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '218', '1561192058');
INSERT INTO `ct_system_exception` VALUES ('1764', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '203', '1561192060');
INSERT INTO `ct_system_exception` VALUES ('1765', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '199', '1561192074');
INSERT INTO `ct_system_exception` VALUES ('1766', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '199', '1561192074');
INSERT INTO `ct_system_exception` VALUES ('1767', '0', 'Fatal error: Cannot use object of type think\\db\\Query as array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '205', '1561192079');
INSERT INTO `ct_system_exception` VALUES ('1768', '0', 'controller not exists:app\\common\\middleware\\ipAuth', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1561192202');
INSERT INTO `ct_system_exception` VALUES ('1769', '0', 'controller not exists:app\\common\\middleware\\ipAuth', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1561192223');
INSERT INTO `ct_system_exception` VALUES ('1770', '0', 'controller not exists:app\\admin\\middleware\\ipAuth', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1561192242');
INSERT INTO `ct_system_exception` VALUES ('1771', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\header.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192284');
INSERT INTO `ct_system_exception` VALUES ('1772', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\left.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192336');
INSERT INTO `ct_system_exception` VALUES ('1773', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\imgs.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192753');
INSERT INTO `ct_system_exception` VALUES ('1774', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\imgs.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192753');
INSERT INTO `ct_system_exception` VALUES ('1775', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\imgs.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192754');
INSERT INTO `ct_system_exception` VALUES ('1776', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\imgs.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192755');
INSERT INTO `ct_system_exception` VALUES ('1777', '0', 'template not exists:D:\\wamp\\www\\shop\\application\\common\\view\\public\\imgs.html', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\Template.php', '1243', '1561192756');
INSERT INTO `ct_system_exception` VALUES ('1778', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561192843');
INSERT INTO `ct_system_exception` VALUES ('1779', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194753');
INSERT INTO `ct_system_exception` VALUES ('1780', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194754');
INSERT INTO `ct_system_exception` VALUES ('1781', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194754');
INSERT INTO `ct_system_exception` VALUES ('1782', '0', 'class not exists:app\\admin\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194767');
INSERT INTO `ct_system_exception` VALUES ('1783', '0', 'class not exists:app\\common\\widget\\Imgs', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194779');
INSERT INTO `ct_system_exception` VALUES ('1784', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194800');
INSERT INTO `ct_system_exception` VALUES ('1785', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194852');
INSERT INTO `ct_system_exception` VALUES ('1786', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194864');
INSERT INTO `ct_system_exception` VALUES ('1787', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194881');
INSERT INTO `ct_system_exception` VALUES ('1788', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194897');
INSERT INTO `ct_system_exception` VALUES ('1789', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194898');
INSERT INTO `ct_system_exception` VALUES ('1790', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194898');
INSERT INTO `ct_system_exception` VALUES ('1791', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194899');
INSERT INTO `ct_system_exception` VALUES ('1792', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194900');
INSERT INTO `ct_system_exception` VALUES ('1793', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194901');
INSERT INTO `ct_system_exception` VALUES ('1794', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194902');
INSERT INTO `ct_system_exception` VALUES ('1795', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194905');
INSERT INTO `ct_system_exception` VALUES ('1796', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194906');
INSERT INTO `ct_system_exception` VALUES ('1797', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194907');
INSERT INTO `ct_system_exception` VALUES ('1798', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561194931');
INSERT INTO `ct_system_exception` VALUES ('1799', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194933');
INSERT INTO `ct_system_exception` VALUES ('1800', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194934');
INSERT INTO `ct_system_exception` VALUES ('1801', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561194935');
INSERT INTO `ct_system_exception` VALUES ('1802', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561195008');
INSERT INTO `ct_system_exception` VALUES ('1803', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195123');
INSERT INTO `ct_system_exception` VALUES ('1804', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195124');
INSERT INTO `ct_system_exception` VALUES ('1805', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195125');
INSERT INTO `ct_system_exception` VALUES ('1806', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195128');
INSERT INTO `ct_system_exception` VALUES ('1807', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195129');
INSERT INTO `ct_system_exception` VALUES ('1808', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195160');
INSERT INTO `ct_system_exception` VALUES ('1809', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195162');
INSERT INTO `ct_system_exception` VALUES ('1810', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195163');
INSERT INTO `ct_system_exception` VALUES ('1811', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195224');
INSERT INTO `ct_system_exception` VALUES ('1812', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195271');
INSERT INTO `ct_system_exception` VALUES ('1813', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195273');
INSERT INTO `ct_system_exception` VALUES ('1814', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195275');
INSERT INTO `ct_system_exception` VALUES ('1815', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195282');
INSERT INTO `ct_system_exception` VALUES ('1816', '0', 'module not exists:add', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195285');
INSERT INTO `ct_system_exception` VALUES ('1817', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195286');
INSERT INTO `ct_system_exception` VALUES ('1818', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195289');
INSERT INTO `ct_system_exception` VALUES ('1819', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195291');
INSERT INTO `ct_system_exception` VALUES ('1820', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195336');
INSERT INTO `ct_system_exception` VALUES ('1821', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195338');
INSERT INTO `ct_system_exception` VALUES ('1822', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195344');
INSERT INTO `ct_system_exception` VALUES ('1823', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195349');
INSERT INTO `ct_system_exception` VALUES ('1824', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195366');
INSERT INTO `ct_system_exception` VALUES ('1825', '0', 'module not exists:program', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195382');
INSERT INTO `ct_system_exception` VALUES ('1826', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195389');
INSERT INTO `ct_system_exception` VALUES ('1827', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195396');
INSERT INTO `ct_system_exception` VALUES ('1828', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195398');
INSERT INTO `ct_system_exception` VALUES ('1829', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195399');
INSERT INTO `ct_system_exception` VALUES ('1830', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195401');
INSERT INTO `ct_system_exception` VALUES ('1831', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195403');
INSERT INTO `ct_system_exception` VALUES ('1832', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195404');
INSERT INTO `ct_system_exception` VALUES ('1833', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195405');
INSERT INTO `ct_system_exception` VALUES ('1834', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195421');
INSERT INTO `ct_system_exception` VALUES ('1835', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195422');
INSERT INTO `ct_system_exception` VALUES ('1836', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195423');
INSERT INTO `ct_system_exception` VALUES ('1837', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195425');
INSERT INTO `ct_system_exception` VALUES ('1838', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195426');
INSERT INTO `ct_system_exception` VALUES ('1839', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195435');
INSERT INTO `ct_system_exception` VALUES ('1840', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195436');
INSERT INTO `ct_system_exception` VALUES ('1841', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195437');
INSERT INTO `ct_system_exception` VALUES ('1842', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195439');
INSERT INTO `ct_system_exception` VALUES ('1843', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195440');
INSERT INTO `ct_system_exception` VALUES ('1844', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195488');
INSERT INTO `ct_system_exception` VALUES ('1845', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195493');
INSERT INTO `ct_system_exception` VALUES ('1846', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195495');
INSERT INTO `ct_system_exception` VALUES ('1847', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195522');
INSERT INTO `ct_system_exception` VALUES ('1848', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195525');
INSERT INTO `ct_system_exception` VALUES ('1849', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561195554');
INSERT INTO `ct_system_exception` VALUES ('1850', '0', 'Fatal error: Using $this when not in object context', 'D:\\wamp\\www\\shop\\application\\admin\\common.php', '183', '1561196029');
INSERT INTO `ct_system_exception` VALUES ('1851', '0', 'Fatal error: Class \'app\\admin\\model\\SystemConfig\' not found', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '187', '1561196469');
INSERT INTO `ct_system_exception` VALUES ('1852', '0', 'Fatal error: Class \'app\\admin\\model\\SystemConfig\' not found', 'D:\\wamp\\www\\shop\\application\\admin\\middleware\\ipAuth.php', '35', '1561196503');
INSERT INTO `ct_system_exception` VALUES ('1853', '0', 'module not exists:login', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278230');
INSERT INTO `ct_system_exception` VALUES ('1854', '0', 'module not exists:login', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278231');
INSERT INTO `ct_system_exception` VALUES ('1855', '0', 'module not exists:login', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278233');
INSERT INTO `ct_system_exception` VALUES ('1856', '0', 'module not exists:system', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278235');
INSERT INTO `ct_system_exception` VALUES ('1857', '0', 'module not exists:system', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278236');
INSERT INTO `ct_system_exception` VALUES ('1858', '0', 'module not exists:login', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561278244');
INSERT INTO `ct_system_exception` VALUES ('1859', '0', 'controller not exists:app\\admin\\controller\\Index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1561278407');
INSERT INTO `ct_system_exception` VALUES ('1860', '0', 'controller not exists:S]', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1561278411');
INSERT INTO `ct_system_exception` VALUES ('1861', '0', 'Fatal error: Class \'app\\admin\\model\\SystemConfig\' not found', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Login.php', '41', '1561278413');
INSERT INTO `ct_system_exception` VALUES ('1862', '0', 'module not exists:program', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279186');
INSERT INTO `ct_system_exception` VALUES ('1863', '0', 'Type error: Argument 1 passed to arrayGroups() must be of the type array, object given, called in D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php on line 123', 'D:\\wamp\\www\\shop\\application\\common.php', '119', '1561279302');
INSERT INTO `ct_system_exception` VALUES ('1864', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\System::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '45', '1561279364');
INSERT INTO `ct_system_exception` VALUES ('1865', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279561');
INSERT INTO `ct_system_exception` VALUES ('1866', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279563');
INSERT INTO `ct_system_exception` VALUES ('1867', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279568');
INSERT INTO `ct_system_exception` VALUES ('1868', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279572');
INSERT INTO `ct_system_exception` VALUES ('1869', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279575');
INSERT INTO `ct_system_exception` VALUES ('1870', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279578');
INSERT INTO `ct_system_exception` VALUES ('1871', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279581');
INSERT INTO `ct_system_exception` VALUES ('1872', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279584');
INSERT INTO `ct_system_exception` VALUES ('1873', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279590');
INSERT INTO `ct_system_exception` VALUES ('1874', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279688');
INSERT INTO `ct_system_exception` VALUES ('1875', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279692');
INSERT INTO `ct_system_exception` VALUES ('1876', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279739');
INSERT INTO `ct_system_exception` VALUES ('1877', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279757');
INSERT INTO `ct_system_exception` VALUES ('1878', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279805');
INSERT INTO `ct_system_exception` VALUES ('1879', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279869');
INSERT INTO `ct_system_exception` VALUES ('1880', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279872');
INSERT INTO `ct_system_exception` VALUES ('1881', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279875');
INSERT INTO `ct_system_exception` VALUES ('1882', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'123\' for key \'key\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561279879');
INSERT INTO `ct_system_exception` VALUES ('1883', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279879');
INSERT INTO `ct_system_exception` VALUES ('1884', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279906');
INSERT INTO `ct_system_exception` VALUES ('1885', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279912');
INSERT INTO `ct_system_exception` VALUES ('1886', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Menu::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Menu.php', '54', '1561279967');
INSERT INTO `ct_system_exception` VALUES ('1887', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561279970');
INSERT INTO `ct_system_exception` VALUES ('1888', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280050');
INSERT INTO `ct_system_exception` VALUES ('1889', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280053');
INSERT INTO `ct_system_exception` VALUES ('1890', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280056');
INSERT INTO `ct_system_exception` VALUES ('1891', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280057');
INSERT INTO `ct_system_exception` VALUES ('1892', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280059');
INSERT INTO `ct_system_exception` VALUES ('1893', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280069');
INSERT INTO `ct_system_exception` VALUES ('1894', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280218');
INSERT INTO `ct_system_exception` VALUES ('1895', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280220');
INSERT INTO `ct_system_exception` VALUES ('1896', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280224');
INSERT INTO `ct_system_exception` VALUES ('1897', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Animate::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Animate.php', '38', '1561280227');
INSERT INTO `ct_system_exception` VALUES ('1898', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280228');
INSERT INTO `ct_system_exception` VALUES ('1899', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280361');
INSERT INTO `ct_system_exception` VALUES ('1900', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280372');
INSERT INTO `ct_system_exception` VALUES ('1901', '0', 'method not exist:app\\admin\\model\\SystemException->getList', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Query.php', '180', '1561280374');
INSERT INTO `ct_system_exception` VALUES ('1902', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561280376');
INSERT INTO `ct_system_exception` VALUES ('1903', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Animate::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Animate.php', '38', '1561280381');
INSERT INTO `ct_system_exception` VALUES ('1904', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561281299');
INSERT INTO `ct_system_exception` VALUES ('1905', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561281315');
INSERT INTO `ct_system_exception` VALUES ('1906', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281325');
INSERT INTO `ct_system_exception` VALUES ('1907', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281338');
INSERT INTO `ct_system_exception` VALUES ('1908', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281454');
INSERT INTO `ct_system_exception` VALUES ('1909', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281541');
INSERT INTO `ct_system_exception` VALUES ('1910', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281564');
INSERT INTO `ct_system_exception` VALUES ('1911', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281599');
INSERT INTO `ct_system_exception` VALUES ('1912', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281601');
INSERT INTO `ct_system_exception` VALUES ('1913', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281605');
INSERT INTO `ct_system_exception` VALUES ('1914', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281609');
INSERT INTO `ct_system_exception` VALUES ('1915', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281613');
INSERT INTO `ct_system_exception` VALUES ('1916', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281615');
INSERT INTO `ct_system_exception` VALUES ('1917', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281618');
INSERT INTO `ct_system_exception` VALUES ('1918', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281623');
INSERT INTO `ct_system_exception` VALUES ('1919', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281626');
INSERT INTO `ct_system_exception` VALUES ('1920', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281628');
INSERT INTO `ct_system_exception` VALUES ('1921', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Menu::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Menu.php', '54', '1561281636');
INSERT INTO `ct_system_exception` VALUES ('1922', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561281647');
INSERT INTO `ct_system_exception` VALUES ('1923', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Menu::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Menu.php', '54', '1561281650');
INSERT INTO `ct_system_exception` VALUES ('1924', '0', 'module not exists:program', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283415');
INSERT INTO `ct_system_exception` VALUES ('1925', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283419');
INSERT INTO `ct_system_exception` VALUES ('1926', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283422');
INSERT INTO `ct_system_exception` VALUES ('1927', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283429');
INSERT INTO `ct_system_exception` VALUES ('1928', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283430');
INSERT INTO `ct_system_exception` VALUES ('1929', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283431');
INSERT INTO `ct_system_exception` VALUES ('1930', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283431');
INSERT INTO `ct_system_exception` VALUES ('1931', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283432');
INSERT INTO `ct_system_exception` VALUES ('1932', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283433');
INSERT INTO `ct_system_exception` VALUES ('1933', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283434');
INSERT INTO `ct_system_exception` VALUES ('1934', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283449');
INSERT INTO `ct_system_exception` VALUES ('1935', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283450');
INSERT INTO `ct_system_exception` VALUES ('1936', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283451');
INSERT INTO `ct_system_exception` VALUES ('1937', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283455');
INSERT INTO `ct_system_exception` VALUES ('1938', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283457');
INSERT INTO `ct_system_exception` VALUES ('1939', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283571');
INSERT INTO `ct_system_exception` VALUES ('1940', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283572');
INSERT INTO `ct_system_exception` VALUES ('1941', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283573');
INSERT INTO `ct_system_exception` VALUES ('1942', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283573');
INSERT INTO `ct_system_exception` VALUES ('1943', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283574');
INSERT INTO `ct_system_exception` VALUES ('1944', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283576');
INSERT INTO `ct_system_exception` VALUES ('1945', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283579');
INSERT INTO `ct_system_exception` VALUES ('1946', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283580');
INSERT INTO `ct_system_exception` VALUES ('1947', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283581');
INSERT INTO `ct_system_exception` VALUES ('1948', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283581');
INSERT INTO `ct_system_exception` VALUES ('1949', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283586');
INSERT INTO `ct_system_exception` VALUES ('1950', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283588');
INSERT INTO `ct_system_exception` VALUES ('1951', '0', 'module not exists:specialist', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283598');
INSERT INTO `ct_system_exception` VALUES ('1952', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283600');
INSERT INTO `ct_system_exception` VALUES ('1953', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561283601');
INSERT INTO `ct_system_exception` VALUES ('1954', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283603');
INSERT INTO `ct_system_exception` VALUES ('1955', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283925');
INSERT INTO `ct_system_exception` VALUES ('1956', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561283926');
INSERT INTO `ct_system_exception` VALUES ('1957', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561283937');
INSERT INTO `ct_system_exception` VALUES ('1958', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284269');
INSERT INTO `ct_system_exception` VALUES ('1959', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284377');
INSERT INTO `ct_system_exception` VALUES ('1960', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284390');
INSERT INTO `ct_system_exception` VALUES ('1961', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284394');
INSERT INTO `ct_system_exception` VALUES ('1962', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284398');
INSERT INTO `ct_system_exception` VALUES ('1963', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284401');
INSERT INTO `ct_system_exception` VALUES ('1964', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284403');
INSERT INTO `ct_system_exception` VALUES ('1965', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284407');
INSERT INTO `ct_system_exception` VALUES ('1966', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284411');
INSERT INTO `ct_system_exception` VALUES ('1967', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284415');
INSERT INTO `ct_system_exception` VALUES ('1968', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284439');
INSERT INTO `ct_system_exception` VALUES ('1969', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284441');
INSERT INTO `ct_system_exception` VALUES ('1970', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284444');
INSERT INTO `ct_system_exception` VALUES ('1971', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284448');
INSERT INTO `ct_system_exception` VALUES ('1972', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284450');
INSERT INTO `ct_system_exception` VALUES ('1973', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284452');
INSERT INTO `ct_system_exception` VALUES ('1974', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284460');
INSERT INTO `ct_system_exception` VALUES ('1975', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284463');
INSERT INTO `ct_system_exception` VALUES ('1976', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284464');
INSERT INTO `ct_system_exception` VALUES ('1977', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284467');
INSERT INTO `ct_system_exception` VALUES ('1978', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284470');
INSERT INTO `ct_system_exception` VALUES ('1979', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284471');
INSERT INTO `ct_system_exception` VALUES ('1980', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284473');
INSERT INTO `ct_system_exception` VALUES ('1981', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284477');
INSERT INTO `ct_system_exception` VALUES ('1982', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284478');
INSERT INTO `ct_system_exception` VALUES ('1983', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284480');
INSERT INTO `ct_system_exception` VALUES ('1984', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284484');
INSERT INTO `ct_system_exception` VALUES ('1985', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284487');
INSERT INTO `ct_system_exception` VALUES ('1986', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284489');
INSERT INTO `ct_system_exception` VALUES ('1987', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284491');
INSERT INTO `ct_system_exception` VALUES ('1988', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284493');
INSERT INTO `ct_system_exception` VALUES ('1989', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284495');
INSERT INTO `ct_system_exception` VALUES ('1990', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284499');
INSERT INTO `ct_system_exception` VALUES ('1991', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284503');
INSERT INTO `ct_system_exception` VALUES ('1992', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284505');
INSERT INTO `ct_system_exception` VALUES ('1993', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284508');
INSERT INTO `ct_system_exception` VALUES ('1994', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284513');
INSERT INTO `ct_system_exception` VALUES ('1995', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284523');
INSERT INTO `ct_system_exception` VALUES ('1996', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284525');
INSERT INTO `ct_system_exception` VALUES ('1997', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284531');
INSERT INTO `ct_system_exception` VALUES ('1998', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Admin::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '58', '1561284534');
INSERT INTO `ct_system_exception` VALUES ('1999', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284535');
INSERT INTO `ct_system_exception` VALUES ('2000', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284536');
INSERT INTO `ct_system_exception` VALUES ('2001', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284546');
INSERT INTO `ct_system_exception` VALUES ('2002', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284547');
INSERT INTO `ct_system_exception` VALUES ('2003', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284550');
INSERT INTO `ct_system_exception` VALUES ('2004', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284557');
INSERT INTO `ct_system_exception` VALUES ('2005', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284563');
INSERT INTO `ct_system_exception` VALUES ('2006', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284567');
INSERT INTO `ct_system_exception` VALUES ('2007', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284599');
INSERT INTO `ct_system_exception` VALUES ('2008', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284607');
INSERT INTO `ct_system_exception` VALUES ('2009', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284608');
INSERT INTO `ct_system_exception` VALUES ('2010', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284613');
INSERT INTO `ct_system_exception` VALUES ('2011', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284618');
INSERT INTO `ct_system_exception` VALUES ('2012', '0', 'controller not exists:12312', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1561284619');
INSERT INTO `ct_system_exception` VALUES ('2013', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284621');
INSERT INTO `ct_system_exception` VALUES ('2014', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284626');
INSERT INTO `ct_system_exception` VALUES ('2015', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284629');
INSERT INTO `ct_system_exception` VALUES ('2016', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284631');
INSERT INTO `ct_system_exception` VALUES ('2017', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284633');
INSERT INTO `ct_system_exception` VALUES ('2018', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284637');
INSERT INTO `ct_system_exception` VALUES ('2019', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284640');
INSERT INTO `ct_system_exception` VALUES ('2020', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284646');
INSERT INTO `ct_system_exception` VALUES ('2021', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284650');
INSERT INTO `ct_system_exception` VALUES ('2022', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284663');
INSERT INTO `ct_system_exception` VALUES ('2023', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284664');
INSERT INTO `ct_system_exception` VALUES ('2024', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284665');
INSERT INTO `ct_system_exception` VALUES ('2025', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284666');
INSERT INTO `ct_system_exception` VALUES ('2026', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284667');
INSERT INTO `ct_system_exception` VALUES ('2027', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Admin::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '58', '1561284676');
INSERT INTO `ct_system_exception` VALUES ('2028', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561284678');
INSERT INTO `ct_system_exception` VALUES ('2029', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286100');
INSERT INTO `ct_system_exception` VALUES ('2030', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561286102');
INSERT INTO `ct_system_exception` VALUES ('2031', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286117');
INSERT INTO `ct_system_exception` VALUES ('2032', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286120');
INSERT INTO `ct_system_exception` VALUES ('2033', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286204');
INSERT INTO `ct_system_exception` VALUES ('2034', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286205');
INSERT INTO `ct_system_exception` VALUES ('2035', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286206');
INSERT INTO `ct_system_exception` VALUES ('2036', '0', 'property not exists:app\\admin\\model\\Admin->weather', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\model\\concern\\Attribute.php', '559', '1561286522');
INSERT INTO `ct_system_exception` VALUES ('2037', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286622');
INSERT INTO `ct_system_exception` VALUES ('2038', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286631');
INSERT INTO `ct_system_exception` VALUES ('2039', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286632');
INSERT INTO `ct_system_exception` VALUES ('2040', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286632');
INSERT INTO `ct_system_exception` VALUES ('2041', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286636');
INSERT INTO `ct_system_exception` VALUES ('2042', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286680');
INSERT INTO `ct_system_exception` VALUES ('2043', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286698');
INSERT INTO `ct_system_exception` VALUES ('2044', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286725');
INSERT INTO `ct_system_exception` VALUES ('2045', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286727');
INSERT INTO `ct_system_exception` VALUES ('2046', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286740');
INSERT INTO `ct_system_exception` VALUES ('2047', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286742');
INSERT INTO `ct_system_exception` VALUES ('2048', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286757');
INSERT INTO `ct_system_exception` VALUES ('2049', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286760');
INSERT INTO `ct_system_exception` VALUES ('2050', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286764');
INSERT INTO `ct_system_exception` VALUES ('2051', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286767');
INSERT INTO `ct_system_exception` VALUES ('2052', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286770');
INSERT INTO `ct_system_exception` VALUES ('2053', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286773');
INSERT INTO `ct_system_exception` VALUES ('2054', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286777');
INSERT INTO `ct_system_exception` VALUES ('2055', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286780');
INSERT INTO `ct_system_exception` VALUES ('2056', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1257390133@qq.com\' for key \'email\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561286783');
INSERT INTO `ct_system_exception` VALUES ('2057', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286787');
INSERT INTO `ct_system_exception` VALUES ('2058', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286812');
INSERT INTO `ct_system_exception` VALUES ('2059', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286821');
INSERT INTO `ct_system_exception` VALUES ('2060', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286824');
INSERT INTO `ct_system_exception` VALUES ('2061', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286827');
INSERT INTO `ct_system_exception` VALUES ('2062', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286830');
INSERT INTO `ct_system_exception` VALUES ('2063', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286830');
INSERT INTO `ct_system_exception` VALUES ('2064', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286833');
INSERT INTO `ct_system_exception` VALUES ('2065', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286834');
INSERT INTO `ct_system_exception` VALUES ('2066', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286837');
INSERT INTO `ct_system_exception` VALUES ('2067', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286837');
INSERT INTO `ct_system_exception` VALUES ('2068', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286840');
INSERT INTO `ct_system_exception` VALUES ('2069', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286840');
INSERT INTO `ct_system_exception` VALUES ('2070', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286843');
INSERT INTO `ct_system_exception` VALUES ('2071', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286843');
INSERT INTO `ct_system_exception` VALUES ('2072', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286846');
INSERT INTO `ct_system_exception` VALUES ('2073', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286846');
INSERT INTO `ct_system_exception` VALUES ('2074', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286850');
INSERT INTO `ct_system_exception` VALUES ('2075', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286850');
INSERT INTO `ct_system_exception` VALUES ('2076', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286853');
INSERT INTO `ct_system_exception` VALUES ('2077', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286853');
INSERT INTO `ct_system_exception` VALUES ('2078', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286856');
INSERT INTO `ct_system_exception` VALUES ('2079', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286856');
INSERT INTO `ct_system_exception` VALUES ('2080', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286859');
INSERT INTO `ct_system_exception` VALUES ('2081', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286859');
INSERT INTO `ct_system_exception` VALUES ('2082', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286863');
INSERT INTO `ct_system_exception` VALUES ('2083', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286863');
INSERT INTO `ct_system_exception` VALUES ('2084', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286866');
INSERT INTO `ct_system_exception` VALUES ('2085', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286866');
INSERT INTO `ct_system_exception` VALUES ('2086', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286869');
INSERT INTO `ct_system_exception` VALUES ('2087', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286869');
INSERT INTO `ct_system_exception` VALUES ('2088', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286872');
INSERT INTO `ct_system_exception` VALUES ('2089', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286873');
INSERT INTO `ct_system_exception` VALUES ('2090', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286876');
INSERT INTO `ct_system_exception` VALUES ('2091', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286876');
INSERT INTO `ct_system_exception` VALUES ('2092', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286879');
INSERT INTO `ct_system_exception` VALUES ('2093', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286879');
INSERT INTO `ct_system_exception` VALUES ('2094', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286882');
INSERT INTO `ct_system_exception` VALUES ('2095', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286882');
INSERT INTO `ct_system_exception` VALUES ('2096', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286885');
INSERT INTO `ct_system_exception` VALUES ('2097', '0', 'Declaration of app\\admin\\model\\RoleAdmin::whereFind($where) should be compatible with app\\common\\model\\Base::whereFind($where, $field = \'*\', $order = Array)', 'D:\\wamp\\www\\shop\\application\\admin\\model\\RoleAdmin.php', '42', '1561286886');
INSERT INTO `ct_system_exception` VALUES ('2098', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286900');
INSERT INTO `ct_system_exception` VALUES ('2099', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286910');
INSERT INTO `ct_system_exception` VALUES ('2100', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286914');
INSERT INTO `ct_system_exception` VALUES ('2101', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286921');
INSERT INTO `ct_system_exception` VALUES ('2102', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286923');
INSERT INTO `ct_system_exception` VALUES ('2103', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286926');
INSERT INTO `ct_system_exception` VALUES ('2104', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286946');
INSERT INTO `ct_system_exception` VALUES ('2105', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286975');
INSERT INTO `ct_system_exception` VALUES ('2106', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286977');
INSERT INTO `ct_system_exception` VALUES ('2107', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561286992');
INSERT INTO `ct_system_exception` VALUES ('2108', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287040');
INSERT INTO `ct_system_exception` VALUES ('2109', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287042');
INSERT INTO `ct_system_exception` VALUES ('2110', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287051');
INSERT INTO `ct_system_exception` VALUES ('2111', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287052');
INSERT INTO `ct_system_exception` VALUES ('2112', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287114');
INSERT INTO `ct_system_exception` VALUES ('2113', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'tangpeng\' for key \'user_name\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561287142');
INSERT INTO `ct_system_exception` VALUES ('2114', '10501', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'tangpeng\' for key \'user_name\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561287146');
INSERT INTO `ct_system_exception` VALUES ('2115', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287148');
INSERT INTO `ct_system_exception` VALUES ('2116', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287159');
INSERT INTO `ct_system_exception` VALUES ('2117', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287165');
INSERT INTO `ct_system_exception` VALUES ('2118', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287172');
INSERT INTO `ct_system_exception` VALUES ('2119', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287173');
INSERT INTO `ct_system_exception` VALUES ('2120', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287185');
INSERT INTO `ct_system_exception` VALUES ('2121', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287187');
INSERT INTO `ct_system_exception` VALUES ('2122', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287189');
INSERT INTO `ct_system_exception` VALUES ('2123', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287208');
INSERT INTO `ct_system_exception` VALUES ('2124', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287218');
INSERT INTO `ct_system_exception` VALUES ('2125', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287252');
INSERT INTO `ct_system_exception` VALUES ('2126', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287265');
INSERT INTO `ct_system_exception` VALUES ('2127', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287276');
INSERT INTO `ct_system_exception` VALUES ('2128', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287278');
INSERT INTO `ct_system_exception` VALUES ('2129', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287280');
INSERT INTO `ct_system_exception` VALUES ('2130', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287317');
INSERT INTO `ct_system_exception` VALUES ('2131', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287319');
INSERT INTO `ct_system_exception` VALUES ('2132', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287322');
INSERT INTO `ct_system_exception` VALUES ('2133', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287324');
INSERT INTO `ct_system_exception` VALUES ('2134', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287331');
INSERT INTO `ct_system_exception` VALUES ('2135', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287350');
INSERT INTO `ct_system_exception` VALUES ('2136', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287352');
INSERT INTO `ct_system_exception` VALUES ('2137', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287353');
INSERT INTO `ct_system_exception` VALUES ('2138', '0', 'htmlentities() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\runtime\\temp\\6bd82b9f10096502c7348e9bce09e6bd.php', '131', '1561287447');
INSERT INTO `ct_system_exception` VALUES ('2139', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287461');
INSERT INTO `ct_system_exception` VALUES ('2140', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287492');
INSERT INTO `ct_system_exception` VALUES ('2141', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287493');
INSERT INTO `ct_system_exception` VALUES ('2142', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287496');
INSERT INTO `ct_system_exception` VALUES ('2143', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287498');
INSERT INTO `ct_system_exception` VALUES ('2144', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287500');
INSERT INTO `ct_system_exception` VALUES ('2145', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287519');
INSERT INTO `ct_system_exception` VALUES ('2146', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287521');
INSERT INTO `ct_system_exception` VALUES ('2147', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287538');
INSERT INTO `ct_system_exception` VALUES ('2148', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287542');
INSERT INTO `ct_system_exception` VALUES ('2149', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Role::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Role.php', '55', '1561287560');
INSERT INTO `ct_system_exception` VALUES ('2150', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287568');
INSERT INTO `ct_system_exception` VALUES ('2151', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287571');
INSERT INTO `ct_system_exception` VALUES ('2152', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287591');
INSERT INTO `ct_system_exception` VALUES ('2153', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287595');
INSERT INTO `ct_system_exception` VALUES ('2154', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287602');
INSERT INTO `ct_system_exception` VALUES ('2155', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287608');
INSERT INTO `ct_system_exception` VALUES ('2156', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287611');
INSERT INTO `ct_system_exception` VALUES ('2157', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287616');
INSERT INTO `ct_system_exception` VALUES ('2158', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287623');
INSERT INTO `ct_system_exception` VALUES ('2159', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287629');
INSERT INTO `ct_system_exception` VALUES ('2160', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287631');
INSERT INTO `ct_system_exception` VALUES ('2161', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287632');
INSERT INTO `ct_system_exception` VALUES ('2162', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287633');
INSERT INTO `ct_system_exception` VALUES ('2163', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287635');
INSERT INTO `ct_system_exception` VALUES ('2164', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287636');
INSERT INTO `ct_system_exception` VALUES ('2165', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561287636');
INSERT INTO `ct_system_exception` VALUES ('2166', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Role::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Role.php', '55', '1561287638');
INSERT INTO `ct_system_exception` VALUES ('2167', '10501', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'asc\' in \'order clause\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '687', '1561288041');
INSERT INTO `ct_system_exception` VALUES ('2168', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288075');
INSERT INTO `ct_system_exception` VALUES ('2169', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288109');
INSERT INTO `ct_system_exception` VALUES ('2170', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288121');
INSERT INTO `ct_system_exception` VALUES ('2171', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288121');
INSERT INTO `ct_system_exception` VALUES ('2172', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288148');
INSERT INTO `ct_system_exception` VALUES ('2173', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288149');
INSERT INTO `ct_system_exception` VALUES ('2174', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288149');
INSERT INTO `ct_system_exception` VALUES ('2175', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288150');
INSERT INTO `ct_system_exception` VALUES ('2176', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288155');
INSERT INTO `ct_system_exception` VALUES ('2177', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288156');
INSERT INTO `ct_system_exception` VALUES ('2178', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288157');
INSERT INTO `ct_system_exception` VALUES ('2179', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288169');
INSERT INTO `ct_system_exception` VALUES ('2180', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288169');
INSERT INTO `ct_system_exception` VALUES ('2181', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288213');
INSERT INTO `ct_system_exception` VALUES ('2182', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288214');
INSERT INTO `ct_system_exception` VALUES ('2183', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288214');
INSERT INTO `ct_system_exception` VALUES ('2184', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '130', '1561288227');
INSERT INTO `ct_system_exception` VALUES ('2185', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '135', '1561288249');
INSERT INTO `ct_system_exception` VALUES ('2186', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '135', '1561288250');
INSERT INTO `ct_system_exception` VALUES ('2187', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '135', '1561288250');
INSERT INTO `ct_system_exception` VALUES ('2188', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '135', '1561288250');
INSERT INTO `ct_system_exception` VALUES ('2189', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '135', '1561288251');
INSERT INTO `ct_system_exception` VALUES ('2190', '0', 'Use of undefined constant superAdminId - assumed \'superAdminId\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '134', '1561288287');
INSERT INTO `ct_system_exception` VALUES ('2191', '0', 'Use of undefined constant superAdminId - assumed \'superAdminId\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '134', '1561288312');
INSERT INTO `ct_system_exception` VALUES ('2192', '0', 'Use of undefined constant superAdminId - assumed \'superAdminId\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '134', '1561288332');
INSERT INTO `ct_system_exception` VALUES ('2193', '0', 'Use of undefined constant superAdminId - assumed \'superAdminId\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '134', '1561288333');
INSERT INTO `ct_system_exception` VALUES ('2194', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '134', '1561288339');
INSERT INTO `ct_system_exception` VALUES ('2195', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288370');
INSERT INTO `ct_system_exception` VALUES ('2196', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288371');
INSERT INTO `ct_system_exception` VALUES ('2197', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288371');
INSERT INTO `ct_system_exception` VALUES ('2198', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288371');
INSERT INTO `ct_system_exception` VALUES ('2199', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288371');
INSERT INTO `ct_system_exception` VALUES ('2200', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288504');
INSERT INTO `ct_system_exception` VALUES ('2201', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '136', '1561288504');
INSERT INTO `ct_system_exception` VALUES ('2202', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561288555');
INSERT INTO `ct_system_exception` VALUES ('2203', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561288567');
INSERT INTO `ct_system_exception` VALUES ('2204', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561288572');
INSERT INTO `ct_system_exception` VALUES ('2205', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288581');
INSERT INTO `ct_system_exception` VALUES ('2206', '0', 'Undefined variable: superAdminId', 'D:\\wamp\\www\\shop\\runtime\\temp\\874e8a9ebebaeca6ada79ca7f7a0c5b7.php', '133', '1561288591');
INSERT INTO `ct_system_exception` VALUES ('2207', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561288612');
INSERT INTO `ct_system_exception` VALUES ('2208', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288626');
INSERT INTO `ct_system_exception` VALUES ('2209', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288634');
INSERT INTO `ct_system_exception` VALUES ('2210', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288639');
INSERT INTO `ct_system_exception` VALUES ('2211', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288646');
INSERT INTO `ct_system_exception` VALUES ('2212', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288648');
INSERT INTO `ct_system_exception` VALUES ('2213', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288651');
INSERT INTO `ct_system_exception` VALUES ('2214', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288683');
INSERT INTO `ct_system_exception` VALUES ('2215', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288686');
INSERT INTO `ct_system_exception` VALUES ('2216', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288686');
INSERT INTO `ct_system_exception` VALUES ('2217', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288688');
INSERT INTO `ct_system_exception` VALUES ('2218', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288689');
INSERT INTO `ct_system_exception` VALUES ('2219', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288691');
INSERT INTO `ct_system_exception` VALUES ('2220', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288706');
INSERT INTO `ct_system_exception` VALUES ('2221', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288709');
INSERT INTO `ct_system_exception` VALUES ('2222', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288727');
INSERT INTO `ct_system_exception` VALUES ('2223', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288734');
INSERT INTO `ct_system_exception` VALUES ('2224', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288736');
INSERT INTO `ct_system_exception` VALUES ('2225', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288745');
INSERT INTO `ct_system_exception` VALUES ('2226', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288746');
INSERT INTO `ct_system_exception` VALUES ('2227', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288756');
INSERT INTO `ct_system_exception` VALUES ('2228', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288757');
INSERT INTO `ct_system_exception` VALUES ('2229', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288764');
INSERT INTO `ct_system_exception` VALUES ('2230', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288768');
INSERT INTO `ct_system_exception` VALUES ('2231', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288770');
INSERT INTO `ct_system_exception` VALUES ('2232', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288772');
INSERT INTO `ct_system_exception` VALUES ('2233', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288773');
INSERT INTO `ct_system_exception` VALUES ('2234', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288776');
INSERT INTO `ct_system_exception` VALUES ('2235', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288778');
INSERT INTO `ct_system_exception` VALUES ('2236', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288780');
INSERT INTO `ct_system_exception` VALUES ('2237', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288782');
INSERT INTO `ct_system_exception` VALUES ('2238', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288785');
INSERT INTO `ct_system_exception` VALUES ('2239', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288787');
INSERT INTO `ct_system_exception` VALUES ('2240', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288790');
INSERT INTO `ct_system_exception` VALUES ('2241', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288791');
INSERT INTO `ct_system_exception` VALUES ('2242', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288795');
INSERT INTO `ct_system_exception` VALUES ('2243', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288800');
INSERT INTO `ct_system_exception` VALUES ('2244', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288803');
INSERT INTO `ct_system_exception` VALUES ('2245', '0', 'strtoupper() expects parameter 1 to be string, object given', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Query.php', '1574', '1561288805');
INSERT INTO `ct_system_exception` VALUES ('2246', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288874');
INSERT INTO `ct_system_exception` VALUES ('2247', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288877');
INSERT INTO `ct_system_exception` VALUES ('2248', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288879');
INSERT INTO `ct_system_exception` VALUES ('2249', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288881');
INSERT INTO `ct_system_exception` VALUES ('2250', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288882');
INSERT INTO `ct_system_exception` VALUES ('2251', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288883');
INSERT INTO `ct_system_exception` VALUES ('2252', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288885');
INSERT INTO `ct_system_exception` VALUES ('2253', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288928');
INSERT INTO `ct_system_exception` VALUES ('2254', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561288930');
INSERT INTO `ct_system_exception` VALUES ('2255', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289293');
INSERT INTO `ct_system_exception` VALUES ('2256', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289296');
INSERT INTO `ct_system_exception` VALUES ('2257', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289299');
INSERT INTO `ct_system_exception` VALUES ('2258', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289303');
INSERT INTO `ct_system_exception` VALUES ('2259', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289306');
INSERT INTO `ct_system_exception` VALUES ('2260', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '174', '1561289309');
INSERT INTO `ct_system_exception` VALUES ('2261', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '175', '1561289312');
INSERT INTO `ct_system_exception` VALUES ('2262', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '175', '1561289316');
INSERT INTO `ct_system_exception` VALUES ('2263', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '175', '1561289319');
INSERT INTO `ct_system_exception` VALUES ('2264', '0', 'Fatal error: Call to a member function toArray() on array', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Admin.php', '175', '1561289322');
INSERT INTO `ct_system_exception` VALUES ('2265', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289376');
INSERT INTO `ct_system_exception` VALUES ('2266', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289391');
INSERT INTO `ct_system_exception` VALUES ('2267', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289398');
INSERT INTO `ct_system_exception` VALUES ('2268', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289405');
INSERT INTO `ct_system_exception` VALUES ('2269', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289410');
INSERT INTO `ct_system_exception` VALUES ('2270', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289417');
INSERT INTO `ct_system_exception` VALUES ('2271', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289419');
INSERT INTO `ct_system_exception` VALUES ('2272', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289421');
INSERT INTO `ct_system_exception` VALUES ('2273', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289423');
INSERT INTO `ct_system_exception` VALUES ('2274', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289424');
INSERT INTO `ct_system_exception` VALUES ('2275', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289426');
INSERT INTO `ct_system_exception` VALUES ('2276', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289427');
INSERT INTO `ct_system_exception` VALUES ('2277', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289430');
INSERT INTO `ct_system_exception` VALUES ('2278', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289431');
INSERT INTO `ct_system_exception` VALUES ('2279', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289490');
INSERT INTO `ct_system_exception` VALUES ('2280', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289500');
INSERT INTO `ct_system_exception` VALUES ('2281', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289512');
INSERT INTO `ct_system_exception` VALUES ('2282', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289515');
INSERT INTO `ct_system_exception` VALUES ('2283', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289517');
INSERT INTO `ct_system_exception` VALUES ('2284', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289520');
INSERT INTO `ct_system_exception` VALUES ('2285', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289522');
INSERT INTO `ct_system_exception` VALUES ('2286', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289526');
INSERT INTO `ct_system_exception` VALUES ('2287', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289532');
INSERT INTO `ct_system_exception` VALUES ('2288', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289533');
INSERT INTO `ct_system_exception` VALUES ('2289', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289536');
INSERT INTO `ct_system_exception` VALUES ('2290', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289539');
INSERT INTO `ct_system_exception` VALUES ('2291', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289542');
INSERT INTO `ct_system_exception` VALUES ('2292', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289544');
INSERT INTO `ct_system_exception` VALUES ('2293', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289545');
INSERT INTO `ct_system_exception` VALUES ('2294', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289551');
INSERT INTO `ct_system_exception` VALUES ('2295', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289561');
INSERT INTO `ct_system_exception` VALUES ('2296', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289563');
INSERT INTO `ct_system_exception` VALUES ('2297', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289573');
INSERT INTO `ct_system_exception` VALUES ('2298', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289579');
INSERT INTO `ct_system_exception` VALUES ('2299', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289597');
INSERT INTO `ct_system_exception` VALUES ('2300', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289601');
INSERT INTO `ct_system_exception` VALUES ('2301', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289605');
INSERT INTO `ct_system_exception` VALUES ('2302', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561289608');
INSERT INTO `ct_system_exception` VALUES ('2303', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339236');
INSERT INTO `ct_system_exception` VALUES ('2304', '0', 'module not exists:favicon.ico', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339237');
INSERT INTO `ct_system_exception` VALUES ('2305', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339245');
INSERT INTO `ct_system_exception` VALUES ('2306', '0', 'module not exists:yx.ico', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339249');
INSERT INTO `ct_system_exception` VALUES ('2307', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339254');
INSERT INTO `ct_system_exception` VALUES ('2308', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339267');
INSERT INTO `ct_system_exception` VALUES ('2309', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339270');
INSERT INTO `ct_system_exception` VALUES ('2310', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339271');
INSERT INTO `ct_system_exception` VALUES ('2311', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339272');
INSERT INTO `ct_system_exception` VALUES ('2312', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339273');
INSERT INTO `ct_system_exception` VALUES ('2313', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339273');
INSERT INTO `ct_system_exception` VALUES ('2314', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339279');
INSERT INTO `ct_system_exception` VALUES ('2315', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Logs::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Logs.php', '33', '1561339295');
INSERT INTO `ct_system_exception` VALUES ('2316', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339297');
INSERT INTO `ct_system_exception` VALUES ('2317', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339298');
INSERT INTO `ct_system_exception` VALUES ('2318', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339299');
INSERT INTO `ct_system_exception` VALUES ('2319', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339300');
INSERT INTO `ct_system_exception` VALUES ('2320', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339300');
INSERT INTO `ct_system_exception` VALUES ('2321', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339301');
INSERT INTO `ct_system_exception` VALUES ('2322', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339302');
INSERT INTO `ct_system_exception` VALUES ('2323', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\Logs::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Logs.php', '33', '1561339308');
INSERT INTO `ct_system_exception` VALUES ('2324', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561339329');
INSERT INTO `ct_system_exception` VALUES ('2325', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339368');
INSERT INTO `ct_system_exception` VALUES ('2326', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339528');
INSERT INTO `ct_system_exception` VALUES ('2327', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339529');
INSERT INTO `ct_system_exception` VALUES ('2328', '0', 'method not exist:app\\admin\\model\\SystemException->getList', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Query.php', '180', '1561339530');
INSERT INTO `ct_system_exception` VALUES ('2329', '0', 'method not exist:app\\admin\\model\\SystemException->getList', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Query.php', '180', '1561339557');
INSERT INTO `ct_system_exception` VALUES ('2330', '0', 'method not exist:app\\admin\\model\\SystemException->getList', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Query.php', '180', '1561339568');
INSERT INTO `ct_system_exception` VALUES ('2331', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339585');
INSERT INTO `ct_system_exception` VALUES ('2332', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339930');
INSERT INTO `ct_system_exception` VALUES ('2333', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339932');
INSERT INTO `ct_system_exception` VALUES ('2334', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339932');
INSERT INTO `ct_system_exception` VALUES ('2335', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339933');
INSERT INTO `ct_system_exception` VALUES ('2336', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339935');
INSERT INTO `ct_system_exception` VALUES ('2337', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339936');
INSERT INTO `ct_system_exception` VALUES ('2338', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339936');
INSERT INTO `ct_system_exception` VALUES ('2339', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561339937');
INSERT INTO `ct_system_exception` VALUES ('2340', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340095');
INSERT INTO `ct_system_exception` VALUES ('2341', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340095');
INSERT INTO `ct_system_exception` VALUES ('2342', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340223');
INSERT INTO `ct_system_exception` VALUES ('2343', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340223');
INSERT INTO `ct_system_exception` VALUES ('2344', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340225');
INSERT INTO `ct_system_exception` VALUES ('2345', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340327');
INSERT INTO `ct_system_exception` VALUES ('2346', '0', 'Fatal error: Call to undefined method app\\admin\\controller\\AdminUser::data_empty()', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\AdminUser.php', '102', '1561340329');
INSERT INTO `ct_system_exception` VALUES ('2347', '0', 'class not exists:app\\common\\widget\\Page', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\App.php', '730', '1561340352');
INSERT INTO `ct_system_exception` VALUES ('2348', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340382');
INSERT INTO `ct_system_exception` VALUES ('2349', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561340540');
INSERT INTO `ct_system_exception` VALUES ('2350', '0', 'htmlentities() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\runtime\\temp\\41bd36e67e2cb56c0f9dcc5bd4ae909b.php', '115', '1561340566');
INSERT INTO `ct_system_exception` VALUES ('2351', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340574');
INSERT INTO `ct_system_exception` VALUES ('2352', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561340589');
INSERT INTO `ct_system_exception` VALUES ('2353', '0', 'htmlentities() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\runtime\\temp\\41bd36e67e2cb56c0f9dcc5bd4ae909b.php', '123', '1561340782');
INSERT INTO `ct_system_exception` VALUES ('2354', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341001');
INSERT INTO `ct_system_exception` VALUES ('2355', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341006');
INSERT INTO `ct_system_exception` VALUES ('2356', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341010');
INSERT INTO `ct_system_exception` VALUES ('2357', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341014');
INSERT INTO `ct_system_exception` VALUES ('2358', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341016');
INSERT INTO `ct_system_exception` VALUES ('2359', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341016');
INSERT INTO `ct_system_exception` VALUES ('2360', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341018');
INSERT INTO `ct_system_exception` VALUES ('2361', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341019');
INSERT INTO `ct_system_exception` VALUES ('2362', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341019');
INSERT INTO `ct_system_exception` VALUES ('2363', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341020');
INSERT INTO `ct_system_exception` VALUES ('2364', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341022');
INSERT INTO `ct_system_exception` VALUES ('2365', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341034');
INSERT INTO `ct_system_exception` VALUES ('2366', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341038');
INSERT INTO `ct_system_exception` VALUES ('2367', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341071');
INSERT INTO `ct_system_exception` VALUES ('2368', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341076');
INSERT INTO `ct_system_exception` VALUES ('2369', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341081');
INSERT INTO `ct_system_exception` VALUES ('2370', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341088');
INSERT INTO `ct_system_exception` VALUES ('2371', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341092');
INSERT INTO `ct_system_exception` VALUES ('2372', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341094');
INSERT INTO `ct_system_exception` VALUES ('2373', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341095');
INSERT INTO `ct_system_exception` VALUES ('2374', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341096');
INSERT INTO `ct_system_exception` VALUES ('2375', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341098');
INSERT INTO `ct_system_exception` VALUES ('2376', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341098');
INSERT INTO `ct_system_exception` VALUES ('2377', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341100');
INSERT INTO `ct_system_exception` VALUES ('2378', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341101');
INSERT INTO `ct_system_exception` VALUES ('2379', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341162');
INSERT INTO `ct_system_exception` VALUES ('2380', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341162');
INSERT INTO `ct_system_exception` VALUES ('2381', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341163');
INSERT INTO `ct_system_exception` VALUES ('2382', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341163');
INSERT INTO `ct_system_exception` VALUES ('2383', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341165');
INSERT INTO `ct_system_exception` VALUES ('2384', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341166');
INSERT INTO `ct_system_exception` VALUES ('2385', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341166');
INSERT INTO `ct_system_exception` VALUES ('2386', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341167');
INSERT INTO `ct_system_exception` VALUES ('2387', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341167');
INSERT INTO `ct_system_exception` VALUES ('2388', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341168');
INSERT INTO `ct_system_exception` VALUES ('2389', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341169');
INSERT INTO `ct_system_exception` VALUES ('2390', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341173');
INSERT INTO `ct_system_exception` VALUES ('2391', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341173');
INSERT INTO `ct_system_exception` VALUES ('2392', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341174');
INSERT INTO `ct_system_exception` VALUES ('2393', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341174');
INSERT INTO `ct_system_exception` VALUES ('2394', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341176');
INSERT INTO `ct_system_exception` VALUES ('2395', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341176');
INSERT INTO `ct_system_exception` VALUES ('2396', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341177');
INSERT INTO `ct_system_exception` VALUES ('2397', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341177');
INSERT INTO `ct_system_exception` VALUES ('2398', '0', 'module not exists:common', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561341258');
INSERT INTO `ct_system_exception` VALUES ('2399', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561342938');
INSERT INTO `ct_system_exception` VALUES ('2400', '0', 'where express error:\'user_name\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Builder.php', '309', '1561342950');
INSERT INTO `ct_system_exception` VALUES ('2401', '0', 'where express error:\'user_name\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Builder.php', '309', '1561342959');
INSERT INTO `ct_system_exception` VALUES ('2402', '0', 'where express error:\'user_name\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Builder.php', '309', '1561342965');
INSERT INTO `ct_system_exception` VALUES ('2403', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561343720');
INSERT INTO `ct_system_exception` VALUES ('2404', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561343721');
INSERT INTO `ct_system_exception` VALUES ('2405', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561343722');
INSERT INTO `ct_system_exception` VALUES ('2406', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561344507');
INSERT INTO `ct_system_exception` VALUES ('2407', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561344795');
INSERT INTO `ct_system_exception` VALUES ('2408', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561344795');
INSERT INTO `ct_system_exception` VALUES ('2409', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561344807');
INSERT INTO `ct_system_exception` VALUES ('2410', '0', 'long2ip() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\application\\common.php', '39', '1561344814');
INSERT INTO `ct_system_exception` VALUES ('2411', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344836');
INSERT INTO `ct_system_exception` VALUES ('2412', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344839');
INSERT INTO `ct_system_exception` VALUES ('2413', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344872');
INSERT INTO `ct_system_exception` VALUES ('2414', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344876');
INSERT INTO `ct_system_exception` VALUES ('2415', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344877');
INSERT INTO `ct_system_exception` VALUES ('2416', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344882');
INSERT INTO `ct_system_exception` VALUES ('2417', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344883');
INSERT INTO `ct_system_exception` VALUES ('2418', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344884');
INSERT INTO `ct_system_exception` VALUES ('2419', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344885');
INSERT INTO `ct_system_exception` VALUES ('2420', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344885');
INSERT INTO `ct_system_exception` VALUES ('2421', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344886');
INSERT INTO `ct_system_exception` VALUES ('2422', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344887');
INSERT INTO `ct_system_exception` VALUES ('2423', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344887');
INSERT INTO `ct_system_exception` VALUES ('2424', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561344888');
INSERT INTO `ct_system_exception` VALUES ('2425', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345223');
INSERT INTO `ct_system_exception` VALUES ('2426', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345225');
INSERT INTO `ct_system_exception` VALUES ('2427', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345226');
INSERT INTO `ct_system_exception` VALUES ('2428', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345227');
INSERT INTO `ct_system_exception` VALUES ('2429', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345228');
INSERT INTO `ct_system_exception` VALUES ('2430', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345229');
INSERT INTO `ct_system_exception` VALUES ('2431', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561345230');
INSERT INTO `ct_system_exception` VALUES ('2432', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362175');
INSERT INTO `ct_system_exception` VALUES ('2433', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362178');
INSERT INTO `ct_system_exception` VALUES ('2434', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362179');
INSERT INTO `ct_system_exception` VALUES ('2435', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362180');
INSERT INTO `ct_system_exception` VALUES ('2436', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362181');
INSERT INTO `ct_system_exception` VALUES ('2437', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362181');
INSERT INTO `ct_system_exception` VALUES ('2438', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362182');
INSERT INTO `ct_system_exception` VALUES ('2439', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362183');
INSERT INTO `ct_system_exception` VALUES ('2440', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362184');
INSERT INTO `ct_system_exception` VALUES ('2441', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362184');
INSERT INTO `ct_system_exception` VALUES ('2442', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362185');
INSERT INTO `ct_system_exception` VALUES ('2443', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362186');
INSERT INTO `ct_system_exception` VALUES ('2444', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561362186');
INSERT INTO `ct_system_exception` VALUES ('2445', '0', 'module not exists:index', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425212');
INSERT INTO `ct_system_exception` VALUES ('2446', '0', 'module not exists:favicon.ico', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425214');
INSERT INTO `ct_system_exception` VALUES ('2447', '0', 'module not exists:yx.ico', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425229');
INSERT INTO `ct_system_exception` VALUES ('2448', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425236');
INSERT INTO `ct_system_exception` VALUES ('2449', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425238');
INSERT INTO `ct_system_exception` VALUES ('2450', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425239');
INSERT INTO `ct_system_exception` VALUES ('2451', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425239');
INSERT INTO `ct_system_exception` VALUES ('2452', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425240');
INSERT INTO `ct_system_exception` VALUES ('2453', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425241');
INSERT INTO `ct_system_exception` VALUES ('2454', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425563');
INSERT INTO `ct_system_exception` VALUES ('2455', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425564');
INSERT INTO `ct_system_exception` VALUES ('2456', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425567');
INSERT INTO `ct_system_exception` VALUES ('2457', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425568');
INSERT INTO `ct_system_exception` VALUES ('2458', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425570');
INSERT INTO `ct_system_exception` VALUES ('2459', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561425575');
INSERT INTO `ct_system_exception` VALUES ('2460', '0', 'Parse error: syntax error, unexpected \'$listEmpty\' (T_VARIABLE)', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\Base.php', '204', '1561426112');
INSERT INTO `ct_system_exception` VALUES ('2461', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426120');
INSERT INTO `ct_system_exception` VALUES ('2462', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426137');
INSERT INTO `ct_system_exception` VALUES ('2463', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426140');
INSERT INTO `ct_system_exception` VALUES ('2464', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426159');
INSERT INTO `ct_system_exception` VALUES ('2465', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426478');
INSERT INTO `ct_system_exception` VALUES ('2466', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426488');
INSERT INTO `ct_system_exception` VALUES ('2467', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426493');
INSERT INTO `ct_system_exception` VALUES ('2468', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426496');
INSERT INTO `ct_system_exception` VALUES ('2469', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426499');
INSERT INTO `ct_system_exception` VALUES ('2470', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426501');
INSERT INTO `ct_system_exception` VALUES ('2471', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426508');
INSERT INTO `ct_system_exception` VALUES ('2472', '0', 'module not exists:www.baidu.com', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426509');
INSERT INTO `ct_system_exception` VALUES ('2473', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426515');
INSERT INTO `ct_system_exception` VALUES ('2474', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426519');
INSERT INTO `ct_system_exception` VALUES ('2475', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426542');
INSERT INTO `ct_system_exception` VALUES ('2476', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561426714');
INSERT INTO `ct_system_exception` VALUES ('2477', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427034');
INSERT INTO `ct_system_exception` VALUES ('2478', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427036');
INSERT INTO `ct_system_exception` VALUES ('2479', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427082');
INSERT INTO `ct_system_exception` VALUES ('2480', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427091');
INSERT INTO `ct_system_exception` VALUES ('2481', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427093');
INSERT INTO `ct_system_exception` VALUES ('2482', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427098');
INSERT INTO `ct_system_exception` VALUES ('2483', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427101');
INSERT INTO `ct_system_exception` VALUES ('2484', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427109');
INSERT INTO `ct_system_exception` VALUES ('2485', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427115');
INSERT INTO `ct_system_exception` VALUES ('2486', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427119');
INSERT INTO `ct_system_exception` VALUES ('2487', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427121');
INSERT INTO `ct_system_exception` VALUES ('2488', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427122');
INSERT INTO `ct_system_exception` VALUES ('2489', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427135');
INSERT INTO `ct_system_exception` VALUES ('2490', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427137');
INSERT INTO `ct_system_exception` VALUES ('2491', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427139');
INSERT INTO `ct_system_exception` VALUES ('2492', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427141');
INSERT INTO `ct_system_exception` VALUES ('2493', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427148');
INSERT INTO `ct_system_exception` VALUES ('2494', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427231');
INSERT INTO `ct_system_exception` VALUES ('2495', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427235');
INSERT INTO `ct_system_exception` VALUES ('2496', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427270');
INSERT INTO `ct_system_exception` VALUES ('2497', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427276');
INSERT INTO `ct_system_exception` VALUES ('2498', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427284');
INSERT INTO `ct_system_exception` VALUES ('2499', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427299');
INSERT INTO `ct_system_exception` VALUES ('2500', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427305');
INSERT INTO `ct_system_exception` VALUES ('2501', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427306');
INSERT INTO `ct_system_exception` VALUES ('2502', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427311');
INSERT INTO `ct_system_exception` VALUES ('2503', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427350');
INSERT INTO `ct_system_exception` VALUES ('2504', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427351');
INSERT INTO `ct_system_exception` VALUES ('2505', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561427381');
INSERT INTO `ct_system_exception` VALUES ('2506', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429340');
INSERT INTO `ct_system_exception` VALUES ('2507', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429343');
INSERT INTO `ct_system_exception` VALUES ('2508', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429355');
INSERT INTO `ct_system_exception` VALUES ('2509', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429358');
INSERT INTO `ct_system_exception` VALUES ('2510', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429360');
INSERT INTO `ct_system_exception` VALUES ('2511', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429362');
INSERT INTO `ct_system_exception` VALUES ('2512', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429364');
INSERT INTO `ct_system_exception` VALUES ('2513', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429372');
INSERT INTO `ct_system_exception` VALUES ('2514', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429374');
INSERT INTO `ct_system_exception` VALUES ('2515', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429379');
INSERT INTO `ct_system_exception` VALUES ('2516', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429382');
INSERT INTO `ct_system_exception` VALUES ('2517', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429387');
INSERT INTO `ct_system_exception` VALUES ('2518', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429389');
INSERT INTO `ct_system_exception` VALUES ('2519', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429395');
INSERT INTO `ct_system_exception` VALUES ('2520', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561429398');
INSERT INTO `ct_system_exception` VALUES ('2521', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430172');
INSERT INTO `ct_system_exception` VALUES ('2522', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430275');
INSERT INTO `ct_system_exception` VALUES ('2523', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430294');
INSERT INTO `ct_system_exception` VALUES ('2524', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430297');
INSERT INTO `ct_system_exception` VALUES ('2525', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430504');
INSERT INTO `ct_system_exception` VALUES ('2526', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430514');
INSERT INTO `ct_system_exception` VALUES ('2527', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430910');
INSERT INTO `ct_system_exception` VALUES ('2528', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430953');
INSERT INTO `ct_system_exception` VALUES ('2529', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430993');
INSERT INTO `ct_system_exception` VALUES ('2530', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561430997');
INSERT INTO `ct_system_exception` VALUES ('2531', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431008');
INSERT INTO `ct_system_exception` VALUES ('2532', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431030');
INSERT INTO `ct_system_exception` VALUES ('2533', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431036');
INSERT INTO `ct_system_exception` VALUES ('2534', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431066');
INSERT INTO `ct_system_exception` VALUES ('2535', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431080');
INSERT INTO `ct_system_exception` VALUES ('2536', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431096');
INSERT INTO `ct_system_exception` VALUES ('2537', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431103');
INSERT INTO `ct_system_exception` VALUES ('2538', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431107');
INSERT INTO `ct_system_exception` VALUES ('2539', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431114');
INSERT INTO `ct_system_exception` VALUES ('2540', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431120');
INSERT INTO `ct_system_exception` VALUES ('2541', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431219');
INSERT INTO `ct_system_exception` VALUES ('2542', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431222');
INSERT INTO `ct_system_exception` VALUES ('2543', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431323');
INSERT INTO `ct_system_exception` VALUES ('2544', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431325');
INSERT INTO `ct_system_exception` VALUES ('2545', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431334');
INSERT INTO `ct_system_exception` VALUES ('2546', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431335');
INSERT INTO `ct_system_exception` VALUES ('2547', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431337');
INSERT INTO `ct_system_exception` VALUES ('2548', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431338');
INSERT INTO `ct_system_exception` VALUES ('2549', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431340');
INSERT INTO `ct_system_exception` VALUES ('2550', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431341');
INSERT INTO `ct_system_exception` VALUES ('2551', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431343');
INSERT INTO `ct_system_exception` VALUES ('2552', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431355');
INSERT INTO `ct_system_exception` VALUES ('2553', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431357');
INSERT INTO `ct_system_exception` VALUES ('2554', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431410');
INSERT INTO `ct_system_exception` VALUES ('2555', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431418');
INSERT INTO `ct_system_exception` VALUES ('2556', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431433');
INSERT INTO `ct_system_exception` VALUES ('2557', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431441');
INSERT INTO `ct_system_exception` VALUES ('2558', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431462');
INSERT INTO `ct_system_exception` VALUES ('2559', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431472');
INSERT INTO `ct_system_exception` VALUES ('2560', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431489');
INSERT INTO `ct_system_exception` VALUES ('2561', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431491');
INSERT INTO `ct_system_exception` VALUES ('2562', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431494');
INSERT INTO `ct_system_exception` VALUES ('2563', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431495');
INSERT INTO `ct_system_exception` VALUES ('2564', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '194', '1561431504');
INSERT INTO `ct_system_exception` VALUES ('2565', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '194', '1561431507');
INSERT INTO `ct_system_exception` VALUES ('2566', '10501', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'imgs_cide\' in \'where clause\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561431512');
INSERT INTO `ct_system_exception` VALUES ('2567', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561431514');
INSERT INTO `ct_system_exception` VALUES ('2568', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '194', '1561431956');
INSERT INTO `ct_system_exception` VALUES ('2569', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432061');
INSERT INTO `ct_system_exception` VALUES ('2570', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '195', '1561432062');
INSERT INTO `ct_system_exception` VALUES ('2571', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432076');
INSERT INTO `ct_system_exception` VALUES ('2572', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432082');
INSERT INTO `ct_system_exception` VALUES ('2573', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '195', '1561432082');
INSERT INTO `ct_system_exception` VALUES ('2574', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432091');
INSERT INTO `ct_system_exception` VALUES ('2575', '0', 'Undefined index: domain', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '194', '1561432094');
INSERT INTO `ct_system_exception` VALUES ('2576', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432126');
INSERT INTO `ct_system_exception` VALUES ('2577', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432141');
INSERT INTO `ct_system_exception` VALUES ('2578', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432204');
INSERT INTO `ct_system_exception` VALUES ('2579', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432230');
INSERT INTO `ct_system_exception` VALUES ('2580', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432284');
INSERT INTO `ct_system_exception` VALUES ('2581', '10501', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'imgs_cide\' in \'where clause\'', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\db\\Connection.php', '764', '1561432300');
INSERT INTO `ct_system_exception` VALUES ('2582', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432301');
INSERT INTO `ct_system_exception` VALUES ('2583', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432361');
INSERT INTO `ct_system_exception` VALUES ('2584', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432381');
INSERT INTO `ct_system_exception` VALUES ('2585', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432429');
INSERT INTO `ct_system_exception` VALUES ('2586', '0', 'module not exists:common', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432445');
INSERT INTO `ct_system_exception` VALUES ('2587', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432862');
INSERT INTO `ct_system_exception` VALUES ('2588', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432868');
INSERT INTO `ct_system_exception` VALUES ('2589', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432881');
INSERT INTO `ct_system_exception` VALUES ('2590', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432960');
INSERT INTO `ct_system_exception` VALUES ('2591', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432963');
INSERT INTO `ct_system_exception` VALUES ('2592', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432965');
INSERT INTO `ct_system_exception` VALUES ('2593', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561432967');
INSERT INTO `ct_system_exception` VALUES ('2594', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433208');
INSERT INTO `ct_system_exception` VALUES ('2595', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433304');
INSERT INTO `ct_system_exception` VALUES ('2596', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433318');
INSERT INTO `ct_system_exception` VALUES ('2597', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433362');
INSERT INTO `ct_system_exception` VALUES ('2598', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433365');
INSERT INTO `ct_system_exception` VALUES ('2599', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433366');
INSERT INTO `ct_system_exception` VALUES ('2600', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433366');
INSERT INTO `ct_system_exception` VALUES ('2601', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433367');
INSERT INTO `ct_system_exception` VALUES ('2602', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433368');
INSERT INTO `ct_system_exception` VALUES ('2603', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433370');
INSERT INTO `ct_system_exception` VALUES ('2604', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433371');
INSERT INTO `ct_system_exception` VALUES ('2605', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433372');
INSERT INTO `ct_system_exception` VALUES ('2606', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561433373');
INSERT INTO `ct_system_exception` VALUES ('2607', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561440250');
INSERT INTO `ct_system_exception` VALUES ('2608', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561440252');
INSERT INTO `ct_system_exception` VALUES ('2609', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561440253');
INSERT INTO `ct_system_exception` VALUES ('2610', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561440264');
INSERT INTO `ct_system_exception` VALUES ('2611', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561440397');
INSERT INTO `ct_system_exception` VALUES ('2612', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561441907');
INSERT INTO `ct_system_exception` VALUES ('2613', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561441955');
INSERT INTO `ct_system_exception` VALUES ('2614', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561441986');
INSERT INTO `ct_system_exception` VALUES ('2615', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561441997');
INSERT INTO `ct_system_exception` VALUES ('2616', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561442016');
INSERT INTO `ct_system_exception` VALUES ('2617', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561442027');
INSERT INTO `ct_system_exception` VALUES ('2618', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443068');
INSERT INTO `ct_system_exception` VALUES ('2619', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443111');
INSERT INTO `ct_system_exception` VALUES ('2620', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443156');
INSERT INTO `ct_system_exception` VALUES ('2621', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443167');
INSERT INTO `ct_system_exception` VALUES ('2622', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443174');
INSERT INTO `ct_system_exception` VALUES ('2623', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443189');
INSERT INTO `ct_system_exception` VALUES ('2624', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443590');
INSERT INTO `ct_system_exception` VALUES ('2625', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443592');
INSERT INTO `ct_system_exception` VALUES ('2626', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443636');
INSERT INTO `ct_system_exception` VALUES ('2627', '0', 'module not exists:common', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443710');
INSERT INTO `ct_system_exception` VALUES ('2628', '0', 'module not exists:common', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443725');
INSERT INTO `ct_system_exception` VALUES ('2629', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443789');
INSERT INTO `ct_system_exception` VALUES ('2630', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443829');
INSERT INTO `ct_system_exception` VALUES ('2631', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443904');
INSERT INTO `ct_system_exception` VALUES ('2632', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443906');
INSERT INTO `ct_system_exception` VALUES ('2633', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561443907');
INSERT INTO `ct_system_exception` VALUES ('2634', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444014');
INSERT INTO `ct_system_exception` VALUES ('2635', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444016');
INSERT INTO `ct_system_exception` VALUES ('2636', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444285');
INSERT INTO `ct_system_exception` VALUES ('2637', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444292');
INSERT INTO `ct_system_exception` VALUES ('2638', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444295');
INSERT INTO `ct_system_exception` VALUES ('2639', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444636');
INSERT INTO `ct_system_exception` VALUES ('2640', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444689');
INSERT INTO `ct_system_exception` VALUES ('2641', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444700');
INSERT INTO `ct_system_exception` VALUES ('2642', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444705');
INSERT INTO `ct_system_exception` VALUES ('2643', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444717');
INSERT INTO `ct_system_exception` VALUES ('2644', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444768');
INSERT INTO `ct_system_exception` VALUES ('2645', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444774');
INSERT INTO `ct_system_exception` VALUES ('2646', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444779');
INSERT INTO `ct_system_exception` VALUES ('2647', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444780');
INSERT INTO `ct_system_exception` VALUES ('2648', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561444788');
INSERT INTO `ct_system_exception` VALUES ('2649', '0', 'implode(): Invalid arguments passed', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '44', '1561445046');
INSERT INTO `ct_system_exception` VALUES ('2650', '0', 'htmlentities() expects parameter 1 to be string, array given', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '118', '1561445058');
INSERT INTO `ct_system_exception` VALUES ('2651', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561445109');
INSERT INTO `ct_system_exception` VALUES ('2652', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447300');
INSERT INTO `ct_system_exception` VALUES ('2653', '0', 'Undefined index: type', 'D:\\wamp\\www\\shop\\runtime\\temp\\dc1941cc97e59fc349fe4d13e10ae9a8.php', '97', '1561447301');
INSERT INTO `ct_system_exception` VALUES ('2654', '0', 'Undefined index: type', 'D:\\wamp\\www\\shop\\runtime\\temp\\dc1941cc97e59fc349fe4d13e10ae9a8.php', '97', '1561447323');
INSERT INTO `ct_system_exception` VALUES ('2655', '0', 'Undefined index: type', 'D:\\wamp\\www\\shop\\runtime\\temp\\dc1941cc97e59fc349fe4d13e10ae9a8.php', '101', '1561447336');
INSERT INTO `ct_system_exception` VALUES ('2656', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447343');
INSERT INTO `ct_system_exception` VALUES ('2657', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447389');
INSERT INTO `ct_system_exception` VALUES ('2658', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447430');
INSERT INTO `ct_system_exception` VALUES ('2659', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447435');
INSERT INTO `ct_system_exception` VALUES ('2660', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447437');
INSERT INTO `ct_system_exception` VALUES ('2661', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447438');
INSERT INTO `ct_system_exception` VALUES ('2662', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447441');
INSERT INTO `ct_system_exception` VALUES ('2663', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447444');
INSERT INTO `ct_system_exception` VALUES ('2664', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447776');
INSERT INTO `ct_system_exception` VALUES ('2665', '0', 'Undefined variable: type', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '119', '1561447779');
INSERT INTO `ct_system_exception` VALUES ('2666', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447791');
INSERT INTO `ct_system_exception` VALUES ('2667', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561447793');
INSERT INTO `ct_system_exception` VALUES ('2668', '0', 'unlink(uploads/20190625/42d8d6cd1ed8f4a8bf74444635487e61.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '94', '1561447803');
INSERT INTO `ct_system_exception` VALUES ('2669', '0', 'unlink(uploads/20190625/a45f1c1aef34b1db83d5035a304d4ed0.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '95', '1561447938');
INSERT INTO `ct_system_exception` VALUES ('2670', '0', 'unlink(/uploads/20190625/cb62c8cee381472fa282cee8a0955487.jpg): No such file or directory', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '95', '1561447973');
INSERT INTO `ct_system_exception` VALUES ('2671', '0', 'unlink(uploads/20190625/089347ccad4241d125f07332a6a10edb.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '96', '1561448067');
INSERT INTO `ct_system_exception` VALUES ('2672', '0', 'unlink(/uploads/20190625/5d256462302d669a0dfc0b2d7058c754.jpg): No such file or directory', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '96', '1561448086');
INSERT INTO `ct_system_exception` VALUES ('2673', '0', 'unlink(uploads/20190625/715f79a9229fc5e936d5e901ab2450a0.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '98', '1561448255');
INSERT INTO `ct_system_exception` VALUES ('2674', '0', 'unlink(uploads/20190625/1c3cd43b9ae8bcb5b2a08475e761868d.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '99', '1561448272');
INSERT INTO `ct_system_exception` VALUES ('2675', '0', 'unlink(uploads/20190625/bab77d8b744eff574a1aed4306996d74.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '99', '1561448406');
INSERT INTO `ct_system_exception` VALUES ('2676', '0', 'unlink(D:/wamp/www/shop/public/uploads/20190625/640428992b1c069728dc176879f0c2b0.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '99', '1561448451');
INSERT INTO `ct_system_exception` VALUES ('2677', '0', 'unlink(D:/wamp/www/shop/public/uploads/20190625/b20a6ea7cee822116f471155926b524c.jpg): Permission denied', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\CommonAction.php', '99', '1561448692');
INSERT INTO `ct_system_exception` VALUES ('2678', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561448765');
INSERT INTO `ct_system_exception` VALUES ('2679', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561448780');
INSERT INTO `ct_system_exception` VALUES ('2680', '0', 'Undefined variable: v', 'D:\\wamp\\www\\shop\\application\\common.php', '195', '1561449250');
INSERT INTO `ct_system_exception` VALUES ('2681', '0', 'Undefined variable: strstr', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '120', '1561449757');
INSERT INTO `ct_system_exception` VALUES ('2682', '0', 'strstr() expects at least 2 parameters, 1 given', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '120', '1561449776');
INSERT INTO `ct_system_exception` VALUES ('2683', '0', 'Parse error: syntax error, unexpected \',\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '120', '1561449827');
INSERT INTO `ct_system_exception` VALUES ('2684', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561449838');
INSERT INTO `ct_system_exception` VALUES ('2685', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561449857');
INSERT INTO `ct_system_exception` VALUES ('2686', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561449869');
INSERT INTO `ct_system_exception` VALUES ('2687', '0', 'Parse error: syntax error, unexpected \',\'', 'D:\\wamp\\www\\shop\\runtime\\temp\\0d4c9d57a2587e514facb4f63e70f5a2.php', '121', '1561449967');
INSERT INTO `ct_system_exception` VALUES ('2688', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561449978');
INSERT INTO `ct_system_exception` VALUES ('2689', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450046');
INSERT INTO `ct_system_exception` VALUES ('2690', '0', 'Undefined index: value', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\template\\taglib\\Cx.php', '350', '1561450081');
INSERT INTO `ct_system_exception` VALUES ('2691', '0', 'Undefined index: value', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\template\\taglib\\Cx.php', '350', '1561450101');
INSERT INTO `ct_system_exception` VALUES ('2692', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450111');
INSERT INTO `ct_system_exception` VALUES ('2693', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450123');
INSERT INTO `ct_system_exception` VALUES ('2694', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450222');
INSERT INTO `ct_system_exception` VALUES ('2695', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450236');
INSERT INTO `ct_system_exception` VALUES ('2696', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450242');
INSERT INTO `ct_system_exception` VALUES ('2697', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450265');
INSERT INTO `ct_system_exception` VALUES ('2698', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450270');
INSERT INTO `ct_system_exception` VALUES ('2699', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450274');
INSERT INTO `ct_system_exception` VALUES ('2700', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450306');
INSERT INTO `ct_system_exception` VALUES ('2701', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450392');
INSERT INTO `ct_system_exception` VALUES ('2702', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450396');
INSERT INTO `ct_system_exception` VALUES ('2703', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450408');
INSERT INTO `ct_system_exception` VALUES ('2704', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450473');
INSERT INTO `ct_system_exception` VALUES ('2705', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450579');
INSERT INTO `ct_system_exception` VALUES ('2706', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450583');
INSERT INTO `ct_system_exception` VALUES ('2707', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450592');
INSERT INTO `ct_system_exception` VALUES ('2708', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450594');
INSERT INTO `ct_system_exception` VALUES ('2709', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450605');
INSERT INTO `ct_system_exception` VALUES ('2710', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450611');
INSERT INTO `ct_system_exception` VALUES ('2711', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450619');
INSERT INTO `ct_system_exception` VALUES ('2712', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450621');
INSERT INTO `ct_system_exception` VALUES ('2713', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450628');
INSERT INTO `ct_system_exception` VALUES ('2714', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450630');
INSERT INTO `ct_system_exception` VALUES ('2715', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450636');
INSERT INTO `ct_system_exception` VALUES ('2716', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450639');
INSERT INTO `ct_system_exception` VALUES ('2717', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450643');
INSERT INTO `ct_system_exception` VALUES ('2718', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450646');
INSERT INTO `ct_system_exception` VALUES ('2719', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450649');
INSERT INTO `ct_system_exception` VALUES ('2720', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450652');
INSERT INTO `ct_system_exception` VALUES ('2721', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450656');
INSERT INTO `ct_system_exception` VALUES ('2722', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450659');
INSERT INTO `ct_system_exception` VALUES ('2723', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450662');
INSERT INTO `ct_system_exception` VALUES ('2724', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450665');
INSERT INTO `ct_system_exception` VALUES ('2725', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450669');
INSERT INTO `ct_system_exception` VALUES ('2726', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450672');
INSERT INTO `ct_system_exception` VALUES ('2727', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450675');
INSERT INTO `ct_system_exception` VALUES ('2728', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450678');
INSERT INTO `ct_system_exception` VALUES ('2729', '0', 'Undefined index: imgs', 'D:\\wamp\\www\\shop\\application\\admin\\controller\\System.php', '55', '1561450682');
INSERT INTO `ct_system_exception` VALUES ('2730', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450686');
INSERT INTO `ct_system_exception` VALUES ('2731', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450697');
INSERT INTO `ct_system_exception` VALUES ('2732', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450698');
INSERT INTO `ct_system_exception` VALUES ('2733', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450703');
INSERT INTO `ct_system_exception` VALUES ('2734', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450711');
INSERT INTO `ct_system_exception` VALUES ('2735', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450715');
INSERT INTO `ct_system_exception` VALUES ('2736', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450735');
INSERT INTO `ct_system_exception` VALUES ('2737', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450758');
INSERT INTO `ct_system_exception` VALUES ('2738', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450765');
INSERT INTO `ct_system_exception` VALUES ('2739', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450795');
INSERT INTO `ct_system_exception` VALUES ('2740', '0', 'module not exists:static', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450833');
INSERT INTO `ct_system_exception` VALUES ('2741', '0', 'module not exists:640428992b1c069728dc176879f0c2b0.jpg', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450954');
INSERT INTO `ct_system_exception` VALUES ('2742', '0', 'module not exists:640428992b1c069728dc176879f0c2b0.jpg', 'D:\\wamp\\www\\shop\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561450961');
INSERT INTO `ct_system_exception` VALUES ('2743', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561459779');
INSERT INTO `ct_system_exception` VALUES ('2744', '0', 'module not exists:favicon.ico', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561459780');
INSERT INTO `ct_system_exception` VALUES ('2745', '0', 'module not exists:yx.ico', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1561459791');
INSERT INTO `ct_system_exception` VALUES ('2746', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565834521');
INSERT INTO `ct_system_exception` VALUES ('2747', '0', 'controller not exists:app\\admin\\controller\\Index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1565834529');
INSERT INTO `ct_system_exception` VALUES ('2748', '0', 'module not exists:login', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565834534');
INSERT INTO `ct_system_exception` VALUES ('2749', '0', 'controller not exists:app\\admin\\controller\\Index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '97', '1565836476');
INSERT INTO `ct_system_exception` VALUES ('2750', '0', 'Parse error: syntax error, unexpected \']\'', 'D:\\wamp\\www\\cool-t\\application\\admin\\controller\\CommonAction.php', '194', '1565837812');
INSERT INTO `ct_system_exception` VALUES ('2751', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838684');
INSERT INTO `ct_system_exception` VALUES ('2752', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2753', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2754', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2755', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2756', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2757', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2758', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2759', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2760', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2761', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2762', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838912');
INSERT INTO `ct_system_exception` VALUES ('2763', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2764', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2765', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2766', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2767', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2768', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2769', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2770', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2771', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2772', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2773', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838917');
INSERT INTO `ct_system_exception` VALUES ('2774', '0', 'controller not exists:20190625', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Url.php', '64', '1565838921');
INSERT INTO `ct_system_exception` VALUES ('2775', '10501', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'imgs_cide\' in \'where clause\'', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\db\\Connection.php', '764', '1565838945');
INSERT INTO `ct_system_exception` VALUES ('2776', '0', 'Parse error: syntax error, unexpected \'$this\' (T_VARIABLE)', 'D:\\wamp\\www\\cool-t\\application\\admin\\widget\\Imgs.php', '26', '1565839830');
INSERT INTO `ct_system_exception` VALUES ('2777', '0', 'method not exists:app\\admin\\controller\\System->in1dex()', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '127', '1565839934');
INSERT INTO `ct_system_exception` VALUES ('2778', '0', 'Undefined index: ', 'D:\\wamp\\www\\cool-t\\application\\common.php', '240', '1565840093');
INSERT INTO `ct_system_exception` VALUES ('2779', '0', 'Undefined index: ', 'D:\\wamp\\www\\cool-t\\application\\common.php', '241', '1565840133');
INSERT INTO `ct_system_exception` VALUES ('2780', '0', 'module not exists:static', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565840747');
INSERT INTO `ct_system_exception` VALUES ('2781', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565859595');
INSERT INTO `ct_system_exception` VALUES ('2782', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565859603');
INSERT INTO `ct_system_exception` VALUES ('2783', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565859606');
INSERT INTO `ct_system_exception` VALUES ('2784', '0', 'module not exists:index', 'D:\\wamp\\www\\oa\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565859620');
INSERT INTO `ct_system_exception` VALUES ('2785', '0', 'module not exists:index', 'D:\\wamp\\www\\cool-t\\thinkphp\\library\\think\\route\\dispatch\\Module.php', '63', '1565861132');
