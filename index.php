<?php

// 检测PHP环境
if (version_compare(PHP_VERSION, '5.3.0', '<')) {
    die('require PHP > 5.3.0 !');
}

define('BIND_MODULE', 'Home');
define('APP_DEBUG', true); //是否调试//部署阶段注释或者设为false
define('APP_PATH', "./App/"); //项目路径
define('THINK_PATH', "./Include/");
// if(is_file($_SERVER['DOCUMENT_ROOT'].'/360safe/360webscan.php')){
//     require_once($_SERVER['DOCUMENT_ROOT'].'/360safe/360webscan.php');
// }

require THINK_PATH . 'ThinkPHP.php'; //加载ThinkPHP框架
