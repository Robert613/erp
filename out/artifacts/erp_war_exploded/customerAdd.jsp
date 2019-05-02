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
	<script type="text/javascript" src="js/province.js" ></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal"> 
		<div class="larry-personal-body clearfix" id="customerController">
			<form class="layui-form col-lg-4">
			 	<div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>客户姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cname" name="cname" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="customer.cname">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>客户性别:
              </label>
              <div class="layui-input-inline">
                  <select id="sex" name="sex" class="valid">
                    <option value="0">男</option>
                    <option value="1">女</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>联系电话:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="customer.phone">
              </div>
          </div>
            
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                     <span class="x-red">*</span>家庭住址:
              </label>
              <div class="layui-input-block">
                  <input type="text" id="addr" name="addr" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="customer.addr">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>职业:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="profession" name="profession" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="customer.profession">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>客户来源:
              </label>
              <div class="layui-input-inline">
                  <select id="source" name="source">
                  	<option>--请选择客户来源--</option>
                    <option>朋友推荐</option>
                    <option>网络渠道</option>
                    <option>企业直访</option>
                    <option>市场专员</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>客户类别:
              </label>
              <div class="layui-input-inline">
                  <select id="type" name="type">
                  	<option>--请选择客户类别--</option>
                    <option>普通客户</option>
                    <option>高端客户</option>
                    <option>企业代理</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="button"  class="layui-btn" value="添加" @click="javascript:addCustomer();"/>
          </div>
		</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">

		 var customerVue =  new Vue({
			el:"#customerController",
			data:{
				customer:{
					cname:"",
					sex:"",
					phone:"",
					addr:"",
					profession:"",
					source:"",
					type:"",
					isdel:0,				 	
			}
			},
			methods:{
				addCustomer:function(){
					var params={"cname":this.customer.cname,
							"sex":$("#sex option:selected").text(),
							"phone":this.customer.phone,
							"addr":this.customer.addr,
							"profession":this.customer.profession,
							"source":$("#source option:selected").text(),
							"type":$("#type option:selected").text()
					};
					//发送Ajax请求
					this.$http.post("addcustomer.action",params,{emulateJSON:true}).then(
					function(res){
						 if(res.data.result=="OK"){
							    window.parent.location.reload(); //刷新父页面
								var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index); // 关闭layer
						 }else{
							 layer.msg("添加失败!",{icon:1,time:1000});
						 }	  
					},
					function(res){
						//响应失败
						console.log(res);
					});
				} 
			}
		   });
</script>
</body>
</html>