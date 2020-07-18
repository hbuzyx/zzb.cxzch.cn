<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/4/13
 * Time: 18:03
 */
//header("Location:http://www.baidu.com");
// 禁用缓存
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");
header("Cache-Control: no-cache, must-revalidate");
header("Pramga: no-cache");


if(isset($_POST["check"])&&isset($_SESSION["user_id"])){
//    header( "Content-Type" , "text/html; charset=utf-8" );
//    $conn = mysql_connect("miao.51eway.com","root","miaomiao");
//    mysql_query("set names utf8");
//    mysql_select_db("miaozaimai");
    require_once("./common.php");
    $sql1="select * from miao_list where (id={$_POST['list']})";
       // echo $sql1;
    $rs1=mysql_query($sql1);
        $row1=mysql_fetch_array($rs1);
    //echo "#2#";

        //添加充值   并修改状态
        // 根据数据库中充钱的数量乘以2进行充值
       // echo $row1["status"];
        if($row1["status"]==2){
            $sql2="select money from miao_user where user_id='{$_SESSION["user_id"]}'";
//            echo $sql2;echo "#1#";
            $rs2=mysql_query($sql2);
            $row2=mysql_fetch_array($rs2);
//            print_r($row2);echo "#2#";
            $money=$row2["money"]+$row1["price"]*2;
            $sql3="update miao_user set money='{$money}' where (user_id={$_SESSION['user_id']})";

            $sql4="update miao_list set status=3 where (id={$_POST['list']})";

           if( mysql_query($sql3)==1&&mysql_query($sql4)==1){
                echo "ok";
           }else{echo "no";}
        }else{echo "no";}


    }else{echo "no";}

//    print_r($row1);echo "|3|";
//    print_r(count($row1));echo "|4|";
//    print_r(count($row2));echo "|5|";
//    print_r(mysql_query($sql3));echo "|6|";










































