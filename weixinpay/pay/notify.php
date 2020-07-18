<?php
session_start();
ini_set('date.timezone', 'Asia/Shanghai');
error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';
require_once 'log.php';

function AddLog($log = '', $filePrefix = '', $fileSuffix = '.log', $time = 'day') {
    $time1 = date('Y-m-d H:i:s', time());
    if ($time == 'year') {
        $period = date('Y', time());
    } elseif ($time == 'month') {
        $period = date('Ym', time());
    } elseif ($time == 'hour') {
        $period = date('YmdH', time());
    } elseif ($time == 'minute') {
        $period = date('YmdHi', time());
    } elseif ($time == 'second') {
        $period = date('YmdHis', time());
    } else {
        $period = date('Ymd', time());
    }
    $filename = $filePrefix . $period . $fileSuffix;
    $fp = fopen($filename, 'a');
    if ($fp) {
        $wr = fwrite($fp, $time1 . "\n" . $log . "\n");
        if ($wr) {
            $close = fclose($fp);
            if ($close) {
                return 1;
            } else {
                return -1;
            }
        } else {
            return -2;
        }
    } else {
        return -3;
    }
}

$str = $_SESSION;
//AddLog($str,'boliufeng');
//初始化日志
$logHandler = new CLogFileHandler("../logs/" . date('Y-m-d') . '.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify {

    //查询订单
    public function Queryorder($transaction_id) {
        $input = new WxPayOrderQuery();
        $input->SetTransaction_id($transaction_id);
        $result = WxPayApi::orderQuery($input);
        Log::DEBUG("query:" . json_encode($result));
        if (array_key_exists("return_code", $result) && array_key_exists("result_code", $result) && $result["return_code"] == "SUCCESS" && $result["result_code"] == "SUCCESS") {

            echo '<script>parent.callback1();</script>';
            return true;
        }
        return false;
    }

    public function AddLog($log = '', $filePrefix = '', $fileSuffix = '.log', $time = 'day') {
        $time1 = date('Y-m-d H:i:s', time());
        if ($time == 'year') {
            $period = date('Y', time());
        } elseif ($time == 'month') {
            $period = date('Ym', time());
        } elseif ($time == 'hour') {
            $period = date('YmdH', time());
        } elseif ($time == 'minute') {
            $period = date('YmdHi', time());
        } elseif ($time == 'second') {
            $period = date('YmdHis', time());
        } else {
            $period = date('Ymd', time());
        }
        $filename = $filePrefix . $period . $fileSuffix;
        $fp = fopen($filename, 'a');
        if ($fp) {
            $wr = fwrite($fp, $time1 . "\n" . $log . "\n");
            if ($wr) {
                $close = fclose($fp);
                if ($close) {
                    return 1;
                } else {
                    return -1;
                }
            } else {
                return -2;
            }
        } else {
            return -3;
        }
    }

    //重写回调处理函数
    public function NotifyProcess($data, &$msg) {
        Log::DEBUG("call back:" . json_encode($data));
        $notfiyOutput = array();

        if (!array_key_exists("transaction_id", $data)) {
            $msg = "输入参数不正确";
            return false;
        }
        //查询订单，判断订单真实性
        if (!$this->Queryorder($data["transaction_id"])) {
            $msg = "订单查询失败";
            return false;
        }
        require_once("./common.php");
        $data["result_code"] = strtoupper($data["result_code"]);
        $data["return_code"] = strtoupper($data["return_code"]);
        $order_ids = $data["out_trade_no"];
        //$this->AddLog($order_ids,'boliufengorder_ids');
        $sqlStatues = "select status from sucai_pay where (`out_trade_no`='{$order_ids}')";
        $query = $mysqli->query($sqlStatues);
        $row = $query->fetch_array();
        $orderStatus = $row['status'];
        //$this->AddLog($orderStatus,'boliufeng$orderStatus');
        $money = $data["total_fee"] / 100;
        if ($orderStatus != 1) {

            if ($data["result_code"] == "SUCCESS" && $data["return_code"] == "SUCCESS") {
                $sql = "update sucai_pay set  status = 1,update_time='" . time() . "' ,money='" . $money . "'  where(out_trade_no='{$order_ids}') ";
                //$this->AddLog($sql,'boliufengsql1');
                if ($mysqli->query($sql)) {
                    // 查询订单的充值人
                    $sql2 = "select uid from sucai_pay where (out_trade_no='{$order_ids}')";
                    //$this->AddLog($sql2,'boliufengsql2');
                    $query2 = $mysqli->query($sql2);
                    $row1 = $query2->fetch_array();
                    $user_id = $row1['uid'];


                    //$this->AddLog($money,'boliufengmoney');
                    if ($money >= 200) {
                        $point = $money * 2 * 10;
                    } else {
                        $point = $money * 10;
                    }
                    $sql3 = "update sucai_user set money=money+$point where id =$user_id";
//					$this->AddLog($sql3,'boliufengsql3');
                    if ($mysqli->query($sql3)) {
                        echo "success";
                        return true;
                    }
                }
            }
        }


        //echo '<script>parent.callback();</script>';
        return true;
    }

}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
?>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>素材火-微信支付</title>
    </head>
    <body>

    </body>
    <script>
        parent.callback1();
    </script>
</html>