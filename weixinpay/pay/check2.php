<?php
session_start();
require_once("./common.php");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");
header("Cache-Control: no-cache, must-revalidate");
header("Pramga: no-cache");
$orderNo = $_GET['tradeno'];
if(isset($orderNo)){
    $sql1="select status from sucai_pay where (`out_trade_no`='{$orderNo}')";
	$query2 = $mysqli->query($sql1);
    $row1 = $query2->fetch_array();
	$order_status=$row1['status'];
        // 1代表已支付
       // 2其它代表未支付
        if($order_status==1){
            echo 1;exit;
        }else{
            echo 9;exit;
        }
    }


?>







































