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
		<div class="layui-form-item">
			<label class="layui-form-label">商品名：</label>
			<div class="layui-input-inline">
				<input class="layui-input newsName" placeholder="请输入商品名" type="text" id="gname" name="gname">
			</div>
			<div class="layui-input-inline">
				<input type="button"  class="layui-btn"  @click="goodsDetail();" value="查询">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label for="username" class="layui-form-label"> 客户编号: </label>
				<div class="layui-input-inline">
					<input class="layui-input newsName" id="cid" name="cid" placeholder="请输入客户编号"
						type="text">
				</div>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn"  value="查询"  @click="javascript:findCustomer();"/>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label for="username" class="layui-form-label"> 客户姓名: </label>
			<div class="layui-input-inline">
				<input type="text" id="username" name="username"  
					class="layui-input" :value="customer.cname">
			</div>
			<label for="username" class="layui-form-label"> 联系电话: </label>
			<div class="layui-input-inline">
				<input type="text" id="username" name="username" 
					autocomplete="off" class="layui-input" :value="customer.phone">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">家庭住址：</label>
			<div class="layui-input-block">
				<input class="layui-input newsName" type="text" :value="customer.addr">
			</div>

		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label for="username" class="layui-form-label"> 订单项目名: </label>
				<div class="layui-input-inline">
					<input class="layui-input newsName" type="text" id="project">
				</div>

			</div>
			<div class="layui-inline">
				<label for="username" class="layui-form-label"> 支付状态: </label>
				<div class="layui-input-inline">
					<select id="order_status" name="order_status">
						<option>--请选择支付状态--</option>
						<option>已支付</option>
						<option>未支付</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label for="username" class="layui-form-label"> 支付方式: </label>
				<div class="layui-input-inline">
					<select id="order_type" name="order_type">
						<option>--请选择支付方式--</option>
						<option>支付宝</option>
						<option>微信</option>
						<option>现金</option>
						<option>刷卡</option>
					</select>
				</div>
			</div>   
		</div>
		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label"> </label> <input
				type="button" class="layui-btn"   value="客户信息添加到订单" @click="javascript:addOrderInfo();" />

		</div>
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
							<td>{{goods.gid}}</td>
							<td>{{goods.gname}}</td>
							<td>{{goods.count}}</td>
							<td><input type="text" class="layui-input" id="sale_price"/></td>
							<td><input type="text" class="layui-input" id="order_account"/></td>
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
		    <label for="R_repass" class="layui-form-label"> </label> <input
				type="button" class="layui-btn" value="1.生成订单" @click="javascript:addOrder();"//>
			<label for="L_repass" class="layui-form-label"> </label> <input
				type="button" class="layui-btn" value="2.完成出库" @click="javascript:addDeliery();"/>
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
					recorder:""					
				},
				goods:{
					gid:"",
					gname:"",
					gprice:"",
					count:"",
					total:""
				},
				customer:{
					cid:"",
					cname:"",
					sex:"",
					phone:"",
					addr:"",
					profession:"",
					source:"",
					type:"",
					isDel:""
				},
				oid:""
			},
			methods:{
				addOrder:function(){
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
				},
			goodsDetail:function(){
				var gname = $("#gname").val();
				//设置编码
				gname=encodeURI(encodeURI(gname));
				x_admin_show('商品信息','./goodsList.jsp?gname='+gname,800,300);
			},
			findCustomer:function(){
				var cid =$("#cid").val();
				cname = encodeURI(encodeURI(cid));
				//发送Ajax请求
				this.$http.post("findCustomerById.action",{"cid":cid},{emulateJSON:true}).then(
				function(res){
					 	  if(res.data.cid==null){
					 		 layer.msg("你查询的客户没有找到 !",{icon:1,time:1000});
					 	  }else{
					 		  this.customer.cname = res.data.cname;
					 		  this.customer.phone = res.data.phone;
					 		  this.customer.addr = res.data.addr;
					 	  }
				},
				function(res){
					//响应失败
					console.log(res);
				});
				
			},
			addOrderInfo:function(){
				$("#name").html(this.customer.cname);
				$("#phone").html(this.customer.phone);
				$("#addr").html(this.customer.addr);
				$("#project_name").html($("#project").val());
				this.order.order_type=$("#order_type  option:selected").text();
				this.order.order_status=$("#order_status  option:selected").text()
			},
			addDeliery:function(oid){
				var params = {
						"gid":this.goods.gid,
						"salePrice":$("#sale_price").val(),
						"count": this.goods.count,
						"account":$("#order_account").val(),
						"saleName":"${sessionScope.admin.adminname}",
						"oid":this.oid
				};
				//发送Ajax请求
				this.$http.post("addDelivery.action",params,{emulateJSON:true}).then(
				function(res){
					    window.parent.location.reload(); //刷新父页面
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
						parent.layer.close(index); // 关闭layer
				},
				function(res){
					//响应失败
					console.log(res);
				});
			}
			},
			created:function(){
				//发送Ajax请求
				this.$http.post("getGoods.action",{emulateJSON:true}).then(
				function(res){
					if(res.data != null){
						 this.goods.gid = res.data.gid;
						 this.goods.gname = res.data.gname;
						 this.goods.count = res.data.total;						 
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