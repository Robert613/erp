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
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="common/layui/layui.js" ></script>
	<script type="text/javascript" src="js/xadmin.js"></script>
	<script type="text/javascript" src="js/data.js"></script>
	<script type="text/javascript" src="js/province.js" ></script>
	<script type="text/javascript" src="js/address.js" ></script>
</head>
 <body>
    <div class="x-body" id="deliveryController">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>商品名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.goods.gname">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>进货单价:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.goods.gprice">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>出货单价:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.salePrice">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>数量:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" :value="delivery.count">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>利润合计:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" :value="delivery.account">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                <span class="x-red">*</span>供货商:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.goods.supplier">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                <span class="x-red">*</span>订单编号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.oid">
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  备注:
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                <span class="x-red">*</span>出货人:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="delivery.saleName">
              </div>
          </div>
      </form>     
    </div>
   <script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">

		 var deliveryVue =  new Vue({
			el:"#deliveryController",
			data:{
				delivery:{
					did:"",
					gid:"",
					salePrice:"",
					count:"",
					account:"",
					time:"",
					saleName:"",
					oid:"",
					goods:{
						gid:"",
						gname:"",
						gprice:"",
						supplier:""
					}
				}
			},
		    created:function(){
					var params={"did":getQueryString("did")};
					//发送Ajax请求
					this.$http.post("getDeliveryInfo.action",params,{emulateJSON:true}).then(function(res){
						this.delivery=res.data;	
						this.delivery.time = new Date(this.delivery.time).format("yyyy-MM-dd");
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