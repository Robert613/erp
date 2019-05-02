<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
	<script type="text/javascript" src="common/layui/layui.js"></script>
	<script type="text/javascript" src="js/xadmin.js" ></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal" id="adminController">
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action="">
			 	<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="adminname"  autocomplete="off"  class="layui-input" disabled="disabled" :value="admin.adminname" v-model="admin.adminname">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系电话</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="phone"  autocomplete="off"  class="layui-input"  :value="admin.phone" v-model="admin.phone">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="title"  autocomplete="off"  class="layui-input" :value="admin.password">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">  
					  	<input type="password" name="password" id="newpassword1" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">  
					  	<input type="password" name="newpassword2" id="newpassword2"  autocomplete="off"  class="layui-input" @mouseleave="checkPassword();">
					</div>
				</div>
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<input type="button" class="layui-btn" lay-filter="demo1" value="修改" @click="editAdminInfo();"/> 
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">

		 var customerVue =  new Vue({
			el:"#adminController",
			data:{
				admin:{
					id:"",
					adminname:"",
					phone:"",
					password:""					 				 	
			}
			},
			methods:{
				editAdminInfo:function(){
					var params={
							"id":getQueryString("id"),
							"adminname":this.admin.adminname,
							"phone":this.admin.phone,
							"password":$("#newpassword2").val()
					};
					//发送Ajax请求
					this.$http.post("editAdminInfo.action",params,{emulateJSON:true}).then(
					function(res){
						 if(res.data.result=="OK"){
								var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index); // 关闭layer
								//window.location.href="login.jsp";
						 }else{
							 layer.msg("修改失败!",{icon:1,time:1000});
						 }	  
					},
					function(res){
						//响应失败
						console.log(res);
					});
				},
			checkPassword:function(){
				if($("#newpassword1").val() != $("#newpassword2").val()){
					layer.msg("请与新密码保持一致",{icon:1,time:1000});
				}
			}
			
			},
		    created:function(){
					var params={"id":getQueryString("id")};
					//发送Ajax请求
					 this.$http.post("getAdminInfo.action",params,{emulateJSON:true}).then(function(res){
						this.admin=res.data;	
					},
					function(res){
						//响应失败
						console.log(res);
					}); 
				}
		   });
		   
	  
</script>
</body>
</html>