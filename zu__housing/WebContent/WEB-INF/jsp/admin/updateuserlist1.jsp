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
    <script type="text/javascript" src="/text2/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/text2/js/jquery.validate.min.js"></script>
   
   <style>
   

.error {
  
  font-size:13px;
  color: red;
  
}

   </style>
    <script type="text/javascript">
        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单
            $("#myform").validate({

                rules : {
                    name : {
                        required : true,
                    },
                    loginname:{
                        required : true,
                    },
                    password:{
                        required : true,
                    },
                    idcard : {
                        required : true,


                    },
                    phone : {
                        required : true,
                        number: true

                    },
                    status : {
                        required : true

                    }

                },
                messages : {
                    name : {
                        required : "姓名不能为空！",
                    },
                    loginname:{
                        required : "登录名不能为空！",
                    },
                    password:{
                        required : "登录密码不能为空！",
                    },
                    idcard : {
                        required : "身份证号码不能为空！",

                    },
                    phone : {
                        required : "手机号码不能为空！",
                        number: "请输入正确的手机号码"

                    },
                    status : {
                        required : "账号类型不能为空！"

                    }

                }
            });
        })
	</script>
	
</head>
<body>

<div class="result-title">
<h1>完善个人资料</h1>
</div>
<div class="result-content">
<div class="sidebar-title">
        <form action="checkuserlist.action" method="post" id="myform" name="myform" enctype="multipart/form-data" autocomplete="off" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                        	<input type="hidden" name="id" value="${userlist.id}"/>
                            <input type="hidden" name="user_id" value="${userlist.user_id}"/>
                            <input type="hidden" name="user.id" value="${userlist.user.id}"/>
                            <tr>
                                <th><i class="require-red">*</i>姓名：</th>
                                <td>
                                    <input class="common-text required" value="${userlist.name}" id="name" name="name" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>登录名：</th>
                                <td>
                                    <input class="common-text required" value="${userlist.user.username}" id="loginname" name="user.username" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>密码：</th>
                                <td>
                                    <input class="common-text required" value="${userlist.user.password}" id="password" name="user.password" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>身份证号码：</th>
                                <td><input class="common-text" name="idcard" value="${userlist.idcard }" id="idcard" size="50" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>手机号码：</th>
                                <td><input class="common-text" name="phone" value="${userlist.phone }" id="phone" size="50" type="text" ></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>账号类型：</th>
                                <td>
                                    <select name="user.type" id="status" class="required">
                                        <option value="zuke" <c:if test="${userlist.user.type == 'zuke'}">selected</c:if>>用户</option>
                                        <option value="admin" <c:if test="${userlist.user.type == 'admin'}">selected</c:if>>管理员</option>
                                    </select>
                                </td>
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
