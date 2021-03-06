<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>房产销售系统</title>
    <link rel="stylesheet" type="text/css" href="/text2/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/text2/css/main.css"/>
    <script type="text/javascript" src="/text2/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/text2/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/text2/js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="/text2/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/text2/css/jquery-ui.css"/>
   <style>
   

.error {
  
  font-size:13px;
  color: red;
  
}

   </style>
    <script type="text/javascript">
    $().ready(function() {
        // 在键盘按下并释放及提交后验证提交表单
        $("#fromdate").datepicker();
        $("#todate").datepicker();
        $("#myform").validate({
        	
            rules : {
            	house_id : {
                    required : true,
                },
               
                address : {
                    required : true,
                  
                },
                chuzu : {
                    required : true,
                   
                  
                },
                price: {
                    required : true,
                    min: 1
                  
                },
                chuzu_idcard: {
                    required : true,
                    
                  
                },
                zuke: {
                    required : true,
                    
                  
                },
                zuke_idcard: {
                    required : true,
                   
                  
                },
                fromdate: {
                    required : true,
                },
                todate: {
                    required : true,
                },
                payday: {
                    required : true,
                    min:0,
                    max:31,
                }
                
            },
            messages : {
            	house_id : {
                    required : "房屋id不能为空",
                },
               
                address : {
                    required : "房屋地址不能为空",
                  
                },
                chuzu : {
                    required : "买方不能为空",
                   
                  
                },
                price: {
                    required : "价格不能为空",
                    min: "请输入正确的价格"
                  
                },
                chuzu_idcard: {
                    required : "售方证件号不能为空",
                    
                  
                },
                zuke: {
                    required : "买方不能为空",
                    
                  
                },
                zuke_idcard: {
                    required : "买方证件号不能为空",
                   
                  
                }
            }
        });
    })
    
    
	</script>
	
</head>
<body>

<div class="result-title">
<h1>添加合同信息，请确定合同信息正确无误再提交！</h1>
</div>
<div class="result-content">
<div class="sidebar-title">
        <form action="/text2/hetong/inserthetong.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                                <th><i class="require-red">*</i>房屋id：</th>
                                <td>
                                    <input class="common-text required" value="${hetong.house_id}" id="house_id" name="house_id" size="50" type="text" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>地址：</th>
                                <td><input class="common-text" name="address" value="${hetong.address }" id="address" size="50" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>售方（甲方）：</th>
                                <td><input class="common-text" name="chuzu" value="${hetong.chuzu }" id="chuzu" size="50" type="text" ></td>
                            </tr>
                           <tr>
                                <th><i class="require-red">*</i>售方（甲方）证件号码：</th>
                                <td><input class="common-text" name="chuzu_idcard" value="${hetong.chuzu_idcard}" id="chuzu_idcard" size="50" type="text"></td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>买方（乙方）：</th>
                              <td><input class="common-text" name="zuke" value="${hetong.zuke}" id="zuke" size="50" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>买方（乙方）证件号码：</th>
                              <td><input class="common-text" name="zuke_idcard" value="${hetong.zuke_idcard}" id="zuke_idcard" size="50" type="text"></td>
                            </tr>
								<tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
							<tr>
                                <font id="error" color="red">${error }</font>
                            </tr>	
                        </tbody></table>
                </form>
          </div>
          </div>
    
</body>
</html>
