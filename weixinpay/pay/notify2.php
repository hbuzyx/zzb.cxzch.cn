<?php

function curl_post($url, $data) {
    $ch = curl_init();
    $headers[] = "Accept-Charset: utf-8";
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($ch, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);

    //关闭curl
    curl_close($ch);

    return $result;
}

//file_put_contents("notify2.txt", "json: " . date("Y-m-d H:i:s") . json_encode($_REQUEST) . "\r\n", FILE_APPEND);
ini_set('date.timezone', 'Asia/Shanghai');
error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';

class PayNotifyCallBack extends WxPayNotify {

    //重写回调处理函数
    public function NotifyProcess($data, &$msg) {
        $url = "http://www.sucaihuo.com/Public/notify_month";
        $arr = array(
            "out_trade_no" => $data['out_trade_no'],
            "trade_no" => $data['transaction_id']
        );
         curl_post($url, $arr);
        file_put_contents("notify6.txt", "json: " . date("Y-m-d H:i:s") . json_encode($data) . "\r\n", FILE_APPEND);
    }

}

$notify = new PayNotifyCallBack();
$notify->Handle(false);
?>