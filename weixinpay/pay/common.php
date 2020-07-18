<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/6/7
 * Time: 11:10
 */


//date_default_timezone_set("PRC");
header( "Content-Type" , "text/html; charset=utf-8" );


//创建对象并打开连接，最后一个参数是选择的数据库名称
$mysqli = new mysqli('121.40.55.201','root','hxy@654321','sucai');
//检查连接是否成功
if (mysqli_connect_errno()){
    //注意mysqli_connect_error()新特性
    die('Unable to connect!'). mysqli_connect_error();
}
