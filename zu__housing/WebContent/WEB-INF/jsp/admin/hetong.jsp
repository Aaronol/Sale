<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/text2/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/text2/css/main.css"/>
    <script type="text/javascript" src="/text2/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/text2/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/text2/js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="/text2/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/text2/css/jquery-ui.css"/>
    <style type="text/css">
    .title{
      margin:10px auto;
      text-align:center;
      font-size:30px;
    }
    .button{
    margin:10px auto;
    text-align:center;
    }
    </style>
    <script type="text/javascript">
    function to_dayin(){
    	alert("打印中...");
    }
   
    </script>
</head>
<body>
<div><br />
	<form name="hetong" action="/text2/hetong/updatehetong.action">
	<div class="title">房屋买卖协议</div>
	<input type="hidden" name="house_id" value="${hetong.house_id}"/>
	<p>出售方：<span name="chuzu">${hetong.chuzu}</span>（以下简称甲方）；</p>　　　
	<p>购买方：<span name="zuke">${hetong.zuke}</span>（以下简称乙方）。　</p>　
	<p>房屋地址：<span name="zuke">${hetong.address}</span>　</p>　
	<p>依据《中华人民共和国合同法》有关条款，甲乙双方经过充分协商，就乙方购买甲方房屋事宜达成如下协议：</p>
	<p>一、乙方购买甲方房屋，以下简称购买房屋。</p>
	<p>二、经甲乙双方共同协商，甲方将位于<span name="zuke">${hetong.address}</span>的住宅壹套出售给乙方。甲方保证对其所售房屋拥有完全的所有权，没有抵押等各种负担</p>　　　　
	<p>三、违约处理：</p>　
	<p>甲方违约：</p>　
	<p>1．如甲方未能及时将房屋交付乙方，甲方每月应按房屋总价的10％向乙方支付违约金；</p>
	<p>2．如甲方提供的维修服务项目与协议不相符，乙方有权解除物业，甲方应全额退还剩余服务费。</p>
	<p>乙方违约：</p>　　
	<p>1．如乙方未按时支付售金，甲方有权在二十天后收回房屋,再做处理，由此造成的定金损失由乙方负责；</p>　
	<p>四、本协议书一式两份，甲乙双方各执一份；本协议甲乙双方签字后生效。补充协议亦属于合同的一部分。</p>　
		　<br />　　甲方（盖章）：_________　　　　　　　　乙方（盖章）：_________　　<br />　
		　法定代表人（签字）：_________　　　　　法定代表人（签字）：_________　　<br />　　
		担保人（签章）：_________　　<br />　　
		_________年____月____日　　　　　　　　_________年____月____日　　<br />　　
		签订地点：_________　　　　　　　　　　签订地点：_________ 
		<div class="button">			
		<input class="btn btn-primary btn6 mr10"  value="修改合同" type="submit">
        <input class="btn btn6" onclick="javascript:to_dayin()" value="打印合同" type="button">
        <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
        </div>
	</form>
</div>
</body>
</html>
