<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<iframe src="http://miao.51eway.com/weixinpay/pay/notify2.php?list=<?php echo $_GET["list"];?>">

</iframe>
</body>
<script>
    function callback(){
        alert"22222222222";
    }
    function callback1(){
        alert"1111111111";
    }
</script>
</html>