<?php

namespace Home\Controller;

use Think\Controller;

class PayController extends HomeCommonController {

    /**
     * 支付宝支付结果返回
     */
    public function notify() {
        if ($_POST || $_GET) {
            $out_trade_no = I("post.out_trade_no");
            $data['status'] = 1;
            $data['update_time'] = time();
            $info = M("pay")->field("uid,points,money")->where("out_trade_no = '" . $out_trade_no . "' AND status = 0")->find();
            if ($info) {
                M("pay")->where(array('out_trade_no' => $out_trade_no))->save($data);
                $points = $info['points'];
                //addPoints("pay", $points, $info['uid'], 5, 1);
				
				//记录积分操作
				$log['uid'] = $info['uid'];
				$log['scoreinfo'] = '+'.$points;
				$log['type'] = 1;
				$log['addtime'] = time();
				$log['descrip'] = '充值成功，积分+'.C('LOGIN_SCORE');
				M('member_slog')->add($log);
				M('member')->where(array('id' => $info['uid']))->setInc('score',$points);  //增加积分
				
            }
            $this->redirect("Member/order");
            exit;
        }
    }

    public function pay() {
        if (IS_POST) {
            $symbol = I('post.symbol') == 1 ? 1 : 0;
            $unit_name = "积分";
            if ($symbol == 1) {
                $unit_name = "金币";
            }
            //页面上通过表单选择在线支付类型，支付宝为alipay 财付通为tenpay
            $paytype = I('post.paytype');
			/*echo $paytype;
			exit;*/
			$payment = array();
			if($paytype == 'alipay'){
				$payment = array(
				// 收款账号邮箱
				'email' => C('ALIPAY_EMAIL'),
				// 加密key，开通支付宝账户后给予
				'key' => C('ALIPAY_KEY'),
				// 合作者ID，支付宝有该配置，开通易宝账户后给予
				'partner' => C('ALIPAY_PARTNER')
				);
			}else{
				$this->error('请选择支付方式！');
			}

            $pay = new \Think\Pay($paytype, $payment);
            $order_money = I('post.money'); //支付金额
            if ($symbol == 1) {
                $points = getMoneyjinbi($order_money);
            } else {
                $points = getMoneyPoints($order_money);
            }

            $title = "充值" . $points . $unit_name;
            $order_no = $pay->createOrderNo();
            $url_return = C("CFG_WEBURL") . "Member/order";
            $url_notify = C("CFG_WEBURL") . "Pay/notify";
            M("Pay")->add(array(
                'out_trade_no' => $order_no,
                'symbol' => $symbol,
                'money' => $order_money,
                'status' => 0,
                'uid' => intval(get_cookie('uid')),
                'points' => $points,
                'addtime' => time(),
                'update_time' => time()
            ));
            $vo = new \Think\Pay\PayVo();
            $vo->setBody("充值" . $unit_name)->setFee($order_money)->setOrderNo($order_no)->setTitle($title)->setUrl($url_return)->setCallback($url_notify);
            echo $pay->buildRequestForm($vo);
        }
    }

    public function pay_month() {

        if (IS_POST) {
            $paytype = I('post.paytype');
			$payment = array();
			if($paytype == 'alipay'){
				$payment = array(
				// 收款账号邮箱
				'email' => C('ALIPAY_EMAIL'),
				// 加密key，开通支付宝账户后给予
				'key' => C('ALIPAY_KEY'),
				// 合作者ID，支付宝有该配置，开通易宝账户后给予
				'partner' => C('ALIPAY_PARTNER')
				);
			}else{
				$this->error('请选择支付方式！');
			}
            $pay = new \Think\Pay($paytype, $payment);
            $order_no = $pay->createOrderNo();

            $id = I("post.month");
            $pay_month = M("pay_month")->where("id = " . $id . "")->find();
            $order_money = $pay_month['money'];
            $month = $pay_month['month'];
            $name = $pay_month['name'];
            M("Order_month")->add(array(
                'order_num' => $order_no,
                'month' => $month,
                'money' => $order_money,
                'status' => 0,
                'uid' => intval(get_cookie('uid')),
                'addtime' => time(),
                'update_time' => 0
            ));
            $title = "充值" . $name . "会员";
            $body = $id;
            $url_return = C("CFG_WEBURL") . "Member/pay";
            $url_notify = C("CFG_WEBURL") . "Pay/notify_month";
            $vo = new \Think\Pay\PayVo();
            $vo->setBody($body)->setFee($order_money)->setOrderNo($order_no)->setTitle($title)->setUrl($url_return)->setCallback($url_notify);
            echo $pay->buildRequestForm($vo);
        }
    }
	
	public function wxpay() {
		if (IS_POST) {
			$symbol = I('post.symbol') == 1 ? 1 : 0;
			$sub_money = I('post.money',0,'intval');
			if(!$sub_money){
				$this->error('请输入充值金额！');
			}
			if($symbol==0){
				//$url1 = $notify->GetPrePayUrl("123456789");
				//唯一订单号
				$order_no = createOrderNo();
				//充值积分
				$points = getMoneyPoints($sub_money);
				$now_time = time();
				M("Pay")->add(array(
					'out_trade_no' => $order_no,
					'symbol' => $symbol,
					'money' => $sub_money,
					'status' => 0,
					'uid' => intval(get_cookie('uid')),
					'points' => $points,
					'addtime' => time(),
					'update_time' => time()
				));
				$title = "充值".$points."积分";

			}else{
				//唯一订单号
				$order_no = createOrderNo();
				//充值金币
				$points = getMoneyjinbi($sub_money);
				$now_time = time();
				M("Pay")->add(array(
					'out_trade_no' => $order_no,
					'symbol' => $symbol,
					'money' => $sub_money,
					'status' => 0,
					'uid' => intval(get_cookie('uid')),
					'jinbi' => $points,
					'addtime' => time(),
					'update_time' => time()
				));
				//执行sql语句，完全面向对象的
				$title = "充值".$points."金币";
			}
			//模式二
			/**
			 * 流程：
			 * 1、调用统一下单，取得code_url，生成二维码
			 * 2、用户扫描二维码，进行支付
			 * 3、支付完成之后，微信服务器会通知支付成功
			 * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
			 */
			Vendor('Wxpay.lib.WxPay#Api');
			Vendor('Wxpay.pay.WxPay#NativePay');
			$host = 'http://'.$_SERVER['HTTP_HOST']; //获取当前域名
			$weixin_money = $sub_money*100;
			//$weixin_money = $sub_money;
			$input = new \WxPayUnifiedOrder();
			$notify = new \WxPayNativePay();
			$input->SetBody("$title");   //商品描述
			$input->SetAttach(""); //附加数据
			$input->SetOut_trade_no($order_no);
			$input->SetTotal_fee("$weixin_money"); // 总金额
			$input->SetTime_start(date("YmdHis"));
			$input->SetTime_expire(date("YmdHis", time() + 600));
			$input->SetGoods_tag(""); //商品标记，代金券或立减优惠功能的参数，说明详见
			$input->SetNotify_url($host."/Pay/wxnotify.html");
			$input->SetTrade_type("NATIVE");
			$input->SetProduct_id("$order_no"); //商品ID 或订单编号
			$result = $notify->GetPayUrl($input);
			$codeurl = $result["code_url"];
		}
		$this->assign('title', $title);
		$this->assign('codeurl', $codeurl);
		$this->assign('order_no', $order_no);
		$this->display();
	}
	
	public function wxcheck() {
		$orderNo = I('tradeno');
		if(isset($orderNo)){
			$order = M("pay")->where(array('out_trade_no' => $orderNo))->find();
			$order_status = $order['status'];
			// 1代表已支付
		   // 2其它代表未支付
			if($order_status==1){
				echo 1;
				exit;
			}else{
				echo 9;
				exit;
			}
		}
	}
	
	public function wxnotify() {
		Vendor('Wxpay.lib.WxPay#Api');
		$xml = $GLOBALS['HTTP_RAW_POST_DATA']; //返回的xml
		file_put_contents(dirname(__FILE__).'/xml.txt',$xml); //记录日志 支付成功后查看xml.txt文件是否有内容 如果有xml格式文件说明回调成功
		//file_get_contents(dirname(__FILE__).'/xml.txt');
		$xmlObj=simplexml_load_string($xml,'SimplexmlElement',LIBxml_NOCDATA); 
		$xmlArr=json_decode(json_encode($xmlObj),true);
		$out_trade_no=$xmlArr['out_trade_no']; //订单号
		$total_fee=$xmlArr['total_fee']/100; //回调回来的xml文件中金额是以分为单位的
		$result_code=$xmlArr['result_code']; //状态
		
		if($result_code=='SUCCESS'){ //数据库操作
			//处理数据库操作 例如修改订单状态 给账户充值等等 
			echo 'SUCCESS'; //返回成功给微信端 一定要带上不然微信会一直回调8次
			exit;	
		}else{ //失败
			return;
			exit;
		}
	}
	
	//生成微信支付二维码
	public function qrcode(){
		vendor('Wxpay.phpqrcode.phpqrcode');
		$url = I('get.data');
		\QRcode::png($url);
	}

    /*public function wxpay() {


        include_once "weixinpay/lib/WxPay.Api.php";
        include_once "weixinpay/pay/WxPay.NativePay.php";

        $id = I("post.month");

        $pay_month = M("pay_month")->where("id = " . $id . "")->find();
        $order_money = $pay_month['money'];

        $name = $pay_month['name'];
        $NativePay = new \NativePay();
        $order_num = date("YmdHis") . rand(10000, 99999);

        $title = "充值" . $name . "会员";
        M("order_month")->add(array(
            'order_num' => $order_num,
            'month' => $pay_month['month'],
            'money' => $order_money,
            'status' => 0,
            'uid' => getUserid(),
            'addtime' => time(),
            'update_time' => 0
        ));
        $url_notify = C('CFG_WEBURL')."/weixinpay/pay/notify2.php";
//        $url_notify = "http://".$_SERVER['SERVER_NAME']."/weixinpay/pay/notify2.php";
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($title);   //商品描述
        $input->SetAttach(""); //附加数据
        $input->SetOut_trade_no($order_num);
        $input->SetTotal_fee($order_money * 100); // 总金额
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag(""); //商品标记，代金券或立减优惠功能的参数，说明详见
        $input->SetNotify_url($url_notify);
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id($order_num); //商品ID 或订单编号
        $result = $NativePay->GetPayUrl($input);

        $code_url = $result["code_url"];
        $this->assign("code_url", urlencode($code_url));
        $this->assign("order_num", $order_num);
        $this->display();
    }

    public function notify_month() {
        include_once "weixinpay/lib/WxPay.Api.php";
        include_once "weixinpay/lib/WxPay.Notify.php";
        file_put_contents("pay.txt", "json: " . date("Y-m-d H:i:s") . json_encode($_REQUEST) . "\r\n", FILE_APPEND);
//         file_put_contents("pay.txt", "json: " . date("Y-m-d H:i:s") . '1233221' . "\r\n");
        // file_put_contents("pay.txt", "json: ".date("Y-m-d H:i:s").json_encode($_POST)."\r\n", FILE_APPEND);
        $out_trade_no = I("post.out_trade_no");
        $trade_num = I("post.trade_no");
        if ($out_trade_no && $trade_num) {
            $order_month = M("order_month")->field("id,uid,money,month")->where("order_num = '" . $out_trade_no . "' AND status = 0")->find();
            if ($order_month) {
                M("order_month")->where(array('order_num' => $out_trade_no))->save(array("status" => 1, "update_time" => time(), "trade_num" => $trade_num));
                $userinfo = M("user")->field("vip_time")->where("id = " . $order_month['uid'] . "")->find();
                $vip_time = $userinfo['vip_time'];
                if ($vip_time < time()) {
                    $vip_time = time();
                }
                $vip_time_last = $vip_time + $order_month['month'] * 3600 * 24 * 30;
                M("user")->where("id = " . $order_month['uid'] . "")->save(array("vip_time" => $vip_time_last));
            }
            exit;
        }
    }*/

    public function check_month() {
        $order_num = I("post.order_num");
        $order_month = M("order_month")->field("id")->where("order_num = '" . $order_num . "' AND status = 1")->find();
        echo $order_month['id'];
    }

}
?>