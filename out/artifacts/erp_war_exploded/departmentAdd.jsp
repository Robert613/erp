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
	<div class="larry-personal"> 
		<div class="larry-personal-body clearfix changepwd" id="departmentController">
			<form class="layui-form col-lg-4">
			 <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>部门名称:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="depname" name="depname"  lay-verify="required"
                  autocomplete="off" class="layui-input" v-model="department.depname">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>部门经理:
              </label>
              <div class="layui-input-inline">
                   
                  <input type="text" id="depmanager" name="depmanager" lay-verify="phone"
                  autocomplete="off" class="layui-input" v-model="department.depmanager">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>部门人数:
              </label>
              <div class="layui-input-inline">
                  <input type="number" id="depcount" min="1" name="depcount" lay-verify="numer"
                  autocomplete="off" class="layui-input" v-model="department.depcount">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>是否启用:
              </label>
              <div class="layui-input-inline">
                   <select id="isuse" name="isuse" class="valid" >
                    <option  value="0">启用</option>
                    <option  value="1">停用</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="button"  class="layui-btn" @click="addDepartment()" value="添加"/>
              <button type="reset" class="layui-btn layui-btn-normal">重置</button>
          </div>
		</form>
		</div>	
	</div>
</section>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">

		 var departmentVue =  new Vue({
			el:"#departmentController",
			data:{
				department:{
					depname:"",
					depmanager:"",
					depcount:""
				}
			},
			methods:{
				addDepartment:function(){
					var params={"depname":this.department.depname,
							"depmanager":this.department.depmanager,
							"depcount":	this.department.depcount,
							"isuse":	$("#isuse option:selected").val()
					};
					//发送Ajax请求
					this.$http.post("addDepartment.action",params,{emulateJSON:true}).then(
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