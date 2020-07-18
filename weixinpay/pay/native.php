<?php
session_start();
require_once("./common.php");
$user_id = isset($_SESSION['userid'])?$_SESSION['userid']:1;
$return_url = isset($_SESSION['returnUrl'])?$_SESSION['returnUrl']:'';
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once "WxPay.NativePay.php";
//require_once 'log.php';
$notify = new NativePay();
//echo "<pre>";
//print_r($_POST);
//获取金钱
if(!empty($_POST['money'])){
    $sub_money = $_POST['money'];
}else{
    return false;
}

$symbol = isset($_POST['symbol'])?$_POST['symbol']:0;
if($symbol==0){
	
	//$url1 = $notify->GetPrePayUrl("123456789");
	/**
	建立订单号
	 * 1、getMoneyPoints 充值规则方法
	 * 2、createOrderNo 创建订单号方法
	 * 3、
	 **/

	function getMoneyPoints($money) {
		//$points = $money;
		if ($money >= 200) {
			$points = $money * 2*10;
		}else{
			$points = $money*10;
		}
		return $points;
	}
	/**
	 * 生成订单号
	 * 可根据自身的业务需求更改
	 */
	function createOrderNo() {
		$year_code = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
		return $year_code[intval(date('Y')) - 2010] .
		strtoupper(dechex(date('m'))) . date('d') .
		substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('d', rand(0, 99));
	}
	//唯一订单号
	$order_no = createOrderNo();
	//充值积分
	$points = getMoneyPoints($sub_money);
	$now_time = time();
	//$sql = "insert into sucai_pay (`out_trade_no`,`money`,`status`,`uid`,`points`,`addtime`,`update_time`) values ('".$order_no."',$sub_money,0,$user_id,$points,$now_time,$now_time)";
	$sql = "insert into sucai_pay (`out_trade_no`,`money`,`status`,`uid`,`symbol`,`points`,`huobi`,`addtime`,`update_time`) values ('".$order_no."',$sub_money,0,$user_id,0,$points,$points,$now_time,$now_time)";
	//执行sql语句，完全面向对象的
	$query = $mysqli->query($sql);
	if(!$query){
	return false;
	}
	$title = "充值".$points."积分";

}else{
	/**
	建立订单号
	 * 1、getMoneyPoints 充值规则方法
	 * 2、createOrderNo 创建订单号方法
	 * 3、
	 **/

	function getMoneyPoints($money) {
		//$points = $money;
		if ($money >= 200) {
			$points = $money+30;
		}elseif($money >= 100&&$money<200){
			$points = $money+10;
		}else{
			$points = $money;
		}
		return $points;
	}
	/**
	 * 生成订单号
	 * 可根据自身的业务需求更改
	 */
	function createOrderNo() {
		$year_code = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
		return $year_code[intval(date('Y')) - 2010] .
		strtoupper(dechex(date('m'))) . date('d') .
		substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('d', rand(0, 99));
	}
	//唯一订单号
	$order_no = createOrderNo();
	//充值积分
	$points = getMoneyPoints($sub_money);
	$now_time = time();
	$sql = "insert into sucai_pay (`out_trade_no`,`money`,`status`,`uid`,`symbol`,`points`,`huobi`,`addtime`,`update_time`) values ('".$order_no."',$sub_money,0,$user_id,1,$points,$points,$now_time,$now_time)";
	//执行sql语句，完全面向对象的
	$query = $mysqli->query($sql);
	if(!$query){
	return false;
	}
	$title = "素材火充值".$points."火币";
	
	
	
}
//模式二
/**
 * 流程：
 * 1、调用统一下单，取得code_url，生成二维码
 * 2、用户扫描二维码，进行支付
 * 3、支付完成之后，微信服务器会通知支付成功
 * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
 */
$weixin_money = $sub_money*100;
//$weixin_money = 1;
$input = new WxPayUnifiedOrder();
$input->SetBody("$title");   //商品描述
$input->SetAttach(""); //附加数据
$input->SetOut_trade_no($order_no);
$input->SetTotal_fee("$weixin_money"); // 总金额
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag(""); //商品标记，代金券或立减优惠功能的参数，说明详见
$input->SetNotify_url("http://".$_SERVER['SERVER_NAME']."/weixinpay/pay/notify.php");
$input->SetTrade_type("NATIVE");
$input->SetProduct_id("$order_no"); //商品ID 或订单编号
$result = $notify->GetPayUrl($input);
$url2 = isset($result["code_url"])?$result["code_url"]:'';
?>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>素材火微信扫码支付</title>
 <style>
 body{ background:#f5f5f5;}
 .wx_img{ margin-top:30px;}
 .wx_img img{ border:1px solid #ddd;}
 </style>   
</head>
<body>
	
	<div align="center" >
	<h1 style="color:red;">爱心赞助素材火-微信扫码支付</h1>
	<img src="http://pay.sucaihuo.com/pay_demo/Wxpay/img/WePayLogo.png" width="180px;" style="display:block; margin:0px auto; margin-top:100px;">
    <div class="wx_img"><img alt="微信扫码支付" src="/weixinpay/pay/qrcode.php?data=<?php echo urlencode($url2);?>"</div>
	 <input type="hidden" value="<?php echo $order_no;?>" id="check_order_statue"/>
	</div>
	<style>
	button{
	background-color: #7fbf4d;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #7fbf4d), color-stop(100%, #63a62f));
    background-image: -webkit-linear-gradient(top, #7fbf4d, #63a62f);
    background-image: -moz-linear-gradient(top, #7fbf4d, #63a62f);
    background-image: -ms-linear-gradient(top, #7fbf4d, #63a62f);
    background-image: -o-linear-gradient(top, #7fbf4d, #63a62f);
    background-image: linear-gradient(top, #7fbf4d, #63a62f);
    border: 1px solid #63a62f;
    border-bottom: 1px solid #5b992b;
    border-radius: 3px;
    -webkit-box-shadow: inset 0 1px 0 0 #96ca6d;
    box-shadow: inset 0 1px 0 0 #96ca6d;
    color: #fff;
    font: bold 11px/1 "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
    padding: 7px 0 8px 0;
    text-align: center;
    text-shadow: 0 -1px 0 #4c9021;
    width: 150px;
	}
	</style>
</body>
</html>
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/Public/js/jquery.js"></script>
<script>
    changeOrderStatues();
    function changeOrderStatues(){
        var outTradeNo =$("#check_order_statue").val();
        if (outTradeNo != 0 && outTradeNo != null) {
            $.ajax({
                url: "/weixinpay/pay/check2.php?tradeno=" + outTradeNo,
                type: "GET",
                dataType:"json",
                data: "",
                success: function (data){
                    if (data==1) {
                        //订单状态为1表示支付成功
                        alert("感谢您赞助，付款成功");
                        parent.location.href = "/Member/order.html"; //页面跳转
                    }},
                error: function (){
                    alert("请求订单状态出错"); }
            });
        }

        setTimeout("changeOrderStatues()", 3000);
    }



</script>