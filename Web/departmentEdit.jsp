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
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		 
		<div class="larry-personal-body clearfix changepwd" id="depContainer">
			<form class="layui-form col-lg-4"  action="">
				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span>部门编号：</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="title"  autocomplete="off" lay-verify="required"  class="layui-input layui-disabled" disabled="disabled" :value="departmentInfo.depid">
					</div>
				</div>
			 	<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span>部门名字：</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="title"  autocomplete="off" lay-verify="required"  class="layui-input"  :value="departmentInfo.depname" v-model="departmentInfo.depname">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span>部门经理：</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="title"  autocomplete="off"  class="layui-input" :value="departmentInfo.depmanager" v-model="departmentInfo.depmanager">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span>部门人数：</label>
					<div class="layui-input-inline">  
					  	<input type="number" name="title" min="1"  autocomplete="off"  class="layui-input" :value="departmentInfo.depcount" v-model="departmentInfo.depcount">
					</div>
				</div>
				 
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<input type="button" class="layui-btn"   lay-filter="demo1" value="修改" @click="javascript:editDepartment();"/> 
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="js/util.js"></script>
<script type="text/javascript">
				var pvue=new Vue({
					el:'#depContainer',
					data:{
                          departmentInfo:{
                        	  depid:0,
                              depname:"",
                              depmanager:"",
                              depcount:0
                          } 
					},
					methods:{
                        editDepartment:function(){
                        	var params={"depid":this.departmentInfo.depid,
                        			"depname":this.departmentInfo.depname,
        							"depmanager":this.departmentInfo.depmanager,
        							"depcount":	this.departmentInfo.depcount};
    						//发送Ajax请求
    						this.$http.post("updateDepartmentInfo.action",params,{emulateJSON:true}).then(function(res){
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
						var params={"depid":getQueryString("depid")};
						//发送Ajax请求
						this.$http.post("getDepartmentInfo.action",params,{emulateJSON:true}).then(function(res){
							this.departmentInfo=res.data;	
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