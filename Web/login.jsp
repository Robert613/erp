<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
	<title>企业事务管理系统-登录</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/login.css" media="all">
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login" >
	<h1>
		 <strong>企业事务管理系统</strong>
		 <em>Enterprise Affairs Management System</em>
	</h1>
	<form action="login.action" method="post">
	<div class="layui-user-icon larry-login">
		 <input type="text" placeholder="手机号" class="login_txtbx" id="phone" name="phone" value="${phone}"/>
	</div>
	<div class="layui-pwd-icon larry-login">
		 <input type="password" placeholder="密码" class="login_txtbx" id="password" name="password" value="${password}"/>
	</div>
    <center style="color:red; font-size: 14px;" id="error">${error}</center>
    <div class="layui-submit larry-login">
    	<input type="submit" value="登录" class="submit_btn"/>
    </div>
    </form>
    
    <div class="layui-login-text">
    	<p>© 2018-2021 云汇信息科技有限公司 版权所有</p>
    </div>
</div>
<script type="text/javascript" src="common/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="jsplug/jparticle.jquery.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">
$(function(){
	 $(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	}); 
	var loginVue =  new Vue({
		el:".layui-layout-login",
		data:{
			admin:{
				phone:"",
				password:""
			},
			error:""   //错误信息显示
		},
		methods:{
			userLogin:function(){
				//alert("哈哈哈");
				var params={"phone":this.admin.phone,"password":this.admin.password};
				//发送Ajax请求
				this.$http.post("login.action",params,{emulateJSON:true}).then(
				function(res){
					 if(res.data.result=="OK"){
						location.href="index.jsp";
						 }
					 else{
						  this.error="你的手机号和密码不匹配,请检查后再输入";
						   
						 }
				},
				function(res){
					//响应失败
					console.log(res);
				});
			} 
		}
	   });
	
     });
</script>
</body>
</html>