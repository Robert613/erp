<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src="js/province.js" ></script>
</head>
 <body>
    <div class="x-body" id="purchaseController">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>商品名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="gname" name="gname" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="purchase.gname">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>进货单价:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="gprice" name="gprice" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="purchase.gprice">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>数量:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="count" name="count" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="purchase.count">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>合计:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="total" name="total" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="purchase.total" :value="purchase.total" @click="compute();">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                <span class="x-red">*</span>供货商:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="supplier" name="supplier" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="purchase.supplier">
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  备注:
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" id="content" name="content" class="layui-textarea" v-model="purchase.content"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                <span class="x-red">*</span>进货人:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="Importer" name="Importer" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="purchase.importer" :value="purchase.importer">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="button"  class="layui-btn" lay-filter="add" type="button" value="添加入库" @click="javascript:addPurchase();"/>
          </div>
      </form>
    </div>
    <script type="text/javascript" src="js/vue.min.js"></script>
    <script type="text/javascript" src="js/vue-resource.js"></script>
    <script type="text/javascript">

		 var purchaseVue =  new Vue({
			el:"#purchaseController",
			data:{
				purchase:{
					gname:"",
					gprice:"",
					count:"",
					total:"",
					supplier:"",
					content:"",
					importer:"${sessionScope.admin.adminname}",
					time:"",				 	
			}
			},
			methods:{
				addPurchase:function(){
					var params={"gname":this.purchase.gname,
							"gprice":this.purchase.gprice,
							"count":this.purchase.count,
							"total":this.purchase.total,
							"supplier":this.purchase.supplier,
							"content":this.purchase.content,
							"importer":this.purchase.importer,
					};
					//发送Ajax请求
					this.$http.post("addPurchase.action",params,{emulateJSON:true}).then(
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
				},
			 compute:function(){
				 if($("#gprice").val()=="" || $("#count").val()=="" ){
					 $("#total").val("");
				 }else{
					  var gprice = Number.parseFloat($("#gprice").val());
					  var count = Number.parseInt($("#count").val());
					  this.purchase.total=gprice*count;
				 }		 
				  
			 }
			}
		   });
   </script>
   </body>
</html>