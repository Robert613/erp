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
    <script type="text/javascript" src="js/newsadd.js" ></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal"> 
		<div class="larry-personal-body clearfix" id="staffController">
			<form class="layui-form col-lg-4">
			<div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="staff.name">
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
                  <input type="text" id="age" name="age" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="staff.age">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>联系电话:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="staff.phone">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>身份证号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cardid" name="cardid" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="staff.cardid">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>工资卡号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="bankid" name="bankid" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="staff.bankid">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>籍贯:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="place" name="place" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="staff.place">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                     <span class="x-red">*</span>家庭住址:
              </label>
              <div class="layui-input-block">
                  <input type="text" id="addr" name="addr" lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="staff.addr">
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
                    <option value="0">是</option>
                    <option value="1">否</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                     <span class="x-red">*</span>加入公司时间:
              </label>
              <div class="layui-input-inline">
                 <input class="layui-input newsTime" id="jointime" name="jointime" lay-verify="required|date" onClick="layui.laydate({elem:this})" type="text"/>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="button"  class="layui-btn" value="添加员工" @click="javascript:addStaff();"/>
                  
         
          </div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">

		 var staffVue =  new Vue({
			el:"#staffController",
			data:{
				staff:{
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
				addStaff:function(){
					console.log($("#jointime").val());
					var params={"name":this.staff.name,
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
					this.$http.post("addStaff.action",params,{emulateJSON:true}).then(
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