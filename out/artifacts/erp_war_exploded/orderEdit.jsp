<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>添加信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="css/personal.css"
	media="all">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript" src="js/newsadd.js"></script>
</head>
<body class="childrenBody">
   <div id="orderController">
	<form class="layui-form">
		<div class="layui-form-item layui-form-text">
			<div class="layui-input-block" style="margin-right: 120px;">
				<table class="layui-table">
					<thead>
						<tr>
							<th colspan="5">客户订单</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>姓名:</td>
							<td  id="name"></td>
							<td>联系电话:</td>
							<td colspan="2" id="phone"></td>
						</tr>
						<tr>
							<td>项目名:</td>
							<td colspan="2" id="project_name"></td>
							<td>家庭住址:</td>
							<td colspan="2" id="addr"></td>
						</tr>
						<tr>
							<td>商品编号</td>
							<td>商品名</td>
							<td>数量</td>
							<td>单价</td>
							<td>总计</td>
						</tr>
						<tr>
							<td id="gid"></td>
							<td id="gname"></td>
							<td id="count"></td>
							<td id="salePrice"></td>
							<td id="account"></td>
						</tr>
						<tr>
							<td>开单人:</td>
							<td colspan="2" id="recorder">${sessionScope.admin.adminname}</td>
							<td>客户签名</td>
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
				
			</div>
		</div>
		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label"> </label> <input
				type="button" class="layui-btn" value="打印订单" @click="javascript:printOrder();"/>
		</div>		 
	</form>
	</div>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	<script type="text/javascript">

	 var orderVue =  new Vue({
		el:"#orderController",
		data:{
			order:{
				oid:"",
				name:"",
				phone:"",
				addr:"",
				project_name:"",
				order_account:"",
				order_type:"",
				order_status:"",
				recorder:""	,
				delivery:{
					gid:"",
					salePrice:"",
					count:"",
					account:"",
					goods:{
						gname:""
					}
				}
			} 			 
		},
		methods:{
			printOrder:function(){
				var params = {"name":this.customer.cname,
						"phone":this.customer.phone,
						"addr":this.customer.addr,
						"projectname":$("#project").val(),
						"orderaccount":$("#order_account").val(),
						"ordertype":$("#order_type  option:selected").text(),
						"orderstatus":$("#order_status  option:selected").text(),
						"recorder":"${sessionScope.admin.adminname}"
				    };
				//发送Ajax请求
				this.$http.post("addOrder.action",params,{emulateJSON:true}).then(
				function(res){
					 if(res.data.result != "0"){
						    this.oid=res.data.result;
						    console.log(this.oid);
					 }else{
						 layer.msg("添加失败!",{icon:1,time:1000});
					 }	  
				},
				function(res){
					//响应失败
					console.log(res);
				});
			} 
		 
		},
		created:function(){
			//发送Ajax请求
			this.$http.post("getOrdersInfo.action",{"oid":getQueryString("oid")},{emulateJSON:true}).then(
			function(res){
				console.log(res.data);
				if(res.data != null){
					this.orders = res.data;	
					$("#name").html(this.orders.name);
					$("#phone").html(this.orders.phone);
					$("#project_name").html(this.orders.projectname);
					$("#addr").html(this.orders.addr);
					$("#gid").html(this.orders.delivery.gid);
					$("#count").html(this.orders.delivery.count);
					$("#gname").html(this.orders.delivery.goods.gname);
					$("#salePrice").html(this.orders.delivery.salePrice);
					$("#account").html(this.orders.delivery.account);
				}
			},
			function(res){
				//响应失败
				console.log(res);
			});
		}
	 }
   );
</script>
</body>
</html>