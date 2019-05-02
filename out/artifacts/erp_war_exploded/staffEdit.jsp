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
	<script type="text/javascript" src="common/layui/layui.js" ></script>
	<script type="text/javascript" src="js/province.js" ></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal" id="staffController"> 
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-4">
			<div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="staff.name" v-model="staff.name">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工性别:
              </label>
              <div class="layui-input-inline">
                  <select id="sex" name="sex" class="valid">
                    <option value="0">男</option>
                    <option value="1">女</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工年龄:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="age" name="age"   lay-verify="required"
                  autocomplete="off" class="layui-input" :value="staff.age" v-model="staff.age">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>联系电话:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" :value="staff.phone" v-model="staff.phone">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>身份证号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cardid" name="cardid" lay-verify="phone"
                  autocomplete="off" class="layui-input" :value="staff.cardid" v-model="staff.cardid">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>工资卡号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="bankid" name="bankid"  lay-verify="required"  
                  autocomplete="off" class="layui-input" :value="staff.bankid" v-model="staff.bankid">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>籍贯:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="place" name="place" lay-verify="required"
                  autocomplete="off" class="layui-input" :value="staff.place" v-model="staff.place">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                     <span class="x-red">*</span>家庭住址:
              </label>
              <div class="layui-input-block">
                  <input type="text" id="addr" name="addr"  lay-verify="required"
                  autocomplete="off" class="layui-input" :value="staff.addr" v-model="staff.addr">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>婚姻状态:
              </label>
              <div class="layui-input-inline">
                  <select id="marriage" name="marriage" class="valid">
                    <option value="0">已婚</option>
                    <option value="1">未婚</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>是否社保:
              </label>
              <div class="layui-input-inline">
                  <select id="social" name="social" class="valid">
                    <option   value="0">是</option>
                    <option   value="1">否</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                     <span class="x-red">*</span>加入公司时间:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input newsTime" id="jointime" name="jointime" lay-verify="required|date" onClick="layui.laydate({elem:this})" type="text" :value="staff.jointime">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="button"  class="layui-btn" value="修改员工信息" @click="javascript:editStaff();">
          </div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">
		
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#join' //指定元素
			  });
			}); 

		 var staffVue =  new Vue({
			el:"#staffController",
			data:{
				staff:{
					sid:0,
					name:"",
					sex:"",
					age:"",
					phone:"",
					cardid:"",
					bankid:"",
					place:"",
					addr:"",
					marriage:0,
					social:0,
					jointime:""					
				}
			},
			methods:{
				editStaff:function(){
					var params={
							"sid": getQueryString("sid"),
							"name":this.staff.name,
							"sex":$("#sex option:selected").text(),
							"age":	this.staff.age,
							"phone":this.staff.phone,
							"cardid":this.staff.cardid,
							"bankid":this.staff.bankid,
							"place":this.staff.place,
							"addr":this.staff.addr,
							"marriage":$("#marriage option:selected").val(),
							"social":$("#social option:selected").val(),
							"jointime":$("#jointime").val()
					};
					//发送Ajax请求
					this.$http.post("editStaff.action",params,{emulateJSON:true}).then(
					function(res){
						 if(res.data.result=="OK"){
							    window.parent.location.reload(); //刷新父页面
								var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index); // 关闭layer
						 }else{
							 layer.msg("修改失败!",{icon:1,time:1000});
						 }	  
					},
					function(res){
						//响应失败
						console.log(res);
					});
				} 
			},
		 created:function(){
				var params={"sid":getQueryString("sid")};
				//发送Ajax请求
				this.$http.post("getStaffInfo.action",params,{emulateJSON:true}).then(function(res){
					this.staff=res.data;
					
					if(this.staff.sex=='男'){
						 $("#sex").find("option:contains('男')").attr("selected",true);
					}else{
						$("#sex").find("option:contains('女')").attr("selected",true);
					}
					
					if(this.staff.marriage==0){
						  $("#marriage").val("0");
					}else{
						 $("#marriage").val("1");
					}
					
					if(this.staff.social==0){
						  $("#social").val("0");
					}else{
						 $("#social").val("1");
					}
					
					this.staff.jointime = new Date(this.staff.jointime).format("yyyy-MM-dd");        
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