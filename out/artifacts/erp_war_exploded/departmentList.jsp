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
	<link rel="stylesheet" type="text/css" href="common/global.css"/>
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<link rel="stylesheet" href="css/zpageNav.css" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
    <script type="text/javascript" src="common/layui/layui.js"></script>
	<script type="text/javascript" src="js/xadmin.js" ></script>
</head>
<body>
<section class="layui-larry-box">
		<div class="larry-personal">
	    <div class="layui-tab" id="dlistContainer">
   <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input placeholder="请输入关部门名" class="layui-input search_input" id="searchInput" type="text">
		    </div>
		    <a class="layui-btn search_btn" @click="pageHandler(1);">查询</a>
		</div><div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" onclick="x_admin_show('添加部门','./departmentAdd.jsp',600,400)"><i class="layui-icon">&#xe608;</i>添加部门</a>
		</div>
		 
		<div class="layui-inline">
			<button class="layui-btn layui-btn-danger batchDel" @click="batchDel();"><i class="layui-icon">&#xe640;</i>批量删除</button>
		</div>
		 
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all" class="header"></th>
                                  <th>序号</th>
                                  <th>部门编号</th>
                                  <th>部门名称</th>
                                  <th>部门经理</th>
                                  <th>部门人数</th>
                                  <th>是否启用</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr v-for="(item,index) in departmentList">
                                <td><input type="checkbox" id="selected-all" :value="item.depid"></td>
                                <td>{{index+1}}</td>
                                <td>{{item.depid}}</td>
                                <td>{{item.depname}}</td>
                                <td>{{item.depmanager}}</td>
                                <td>{{item.depcount}}</td>
                                <td class="td-status">
                                	<span v-if="item.isuse==0" class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>
								    <span v-else-if="item.isuse==1" class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已停用</span>
								</td>
                                <td>
                                <button v-if="item.isuse==0"  class="layui-btn layui-btn-normal layui-btn-mini" id="stop" @click="member_stop(item.depid)"    title="停用">
					                <i class="layui-icon">&#xe601;</i>停用
					             </button>
					             <button v-else-if="item.isuse==1"  class="layui-btn layui-btn-normal layui-btn-mini" id="stop" @click="member_stop(item.depid)"  title="停用">
					                <i class="layui-icon">&#xe601;</i>启用
					             </button>
                                <button  class="layui-btn layui-btn-mini news_edit" @click="departmentDetail(item.depid)"></i>编辑</button>    
								<buuton class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="5" @click="delDepartment(item.depid,index)"><i class="layui-icon"></i> 删除</button>	
                                </td>
                              </tr>                
                          </tbody>
                     </table>
                      <div class="larry-table-page clearfix">

				       <div class="wrap" id="wrap">
                    <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler"><zpagenav>
                     </div>
			         </div>
                     
			    </div>
		 
		    </div>
		</div>
	</div>
</section>
<script type="text/javascript" src="js/vue.min.js"></script>
<script src="js/zpageNav.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
 <script type="text/javascript">       
		var vue1=new Vue({
			el:'#dlistContainer',
			data:{
				departmentList:[],
				page: 1,
				prePage:1,
	            pageSize: 7,
	            total: 150,
	            maxPage:9
			},
			methods:{
				pageHandler: function (page) {
              this.page = page;
              var params = {"page":page,"row":this.pageSize,"depname":$("#searchInput").val()}
          	this.$http.post("getDepartments.action",params,{emulateJSON:true}).then(
						function(res){
							this.departmentList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.pages;
							if(res.data.prePage==0){
								this.prePage=1;
							}else{
								this.prePage=res.data.prePage;
							}
						},
						function(res){
							console.log(res);
						});		
              },
              departmentDetail:function(depid){
            	  x_admin_show("修改部门信息","departmentEdit.jsp?depid="+depid,600,400);
              },
              delDepartment:function(depid,index){
              	var params={"depid":depid};
					//发送Ajax请求
					this.$http.post("delDepartment.action",params,{emulateJSON:true}).then(function(res){
						if(res.data.result=="OK"){
							this.departmentList.splice(index,1);
							if(this.departmentList.length==0){
								this.pageHandler(this.prePage);
							}
							layer.msg("删除成功",{icon:1,time:1000});
						}else{
							layer.msg("删除失败",{icon:1,time:1000});
						}
					},
					function(res){
						//响应失败
						console.log(res);
					});
              },
             batchDel:function(){
            	 
            	 var delIds = new Array();
            	 $("input:checked").each(function(){
            		 delIds.push($(this).val());
            	 });
            	 this.$http.post("batchdelDepartment.action",{depIds:delIds},{emulateJSON:true}).then(function(res){
            		 
            		 if(this.departmentList.length==0){
							this.pageHandler(this.prePage);
					 }else{
	            		 window.location.reload(true);
					 }
            		 
            		 layer.msg("操作成功",{icon:1,time:1000});	 
					},
					function(res){
						//响应失败
						console.log(res);
					});
             },
            member_stop:function(id){

                    if($("#stop").attr('title')=='停用'){
                    	this.$http.post("updateDepartmentStatus.action",{"flag":1,"depid":id},{emulateJSON:true}).then(function(res){
                   		 if(res.data.result=="OK"){
                   		     //发异步把用户状态进行更改
                             $("#stop").attr('title','启用')
                             $("#stop").find('i').html('&#xe62f;');

                             $("#stop").parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                             layer.msg('停用',{icon: 5,time:1000});
                   		 }else{
                   			layer.msg('停用失败',{icon: 5,time:1000});
                   		 }
                   		  
       					},
       					function(res){
       						//响应失败
       						console.log(res);
       					});
                    }else{                  	
                    	this.$http.post("updateDepartmentStatus.action",{"flag":2,"depid":id},{emulateJSON:true}).then(function(res){
                      		 if(res.data.result=="OK"){
                      			$("#stop").attr('title','停用')
                                $("#stop").find('i').html('&#xe601;');

                                $("#stop").parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                                layer.msg('启用',{icon: 5,time:1000});
                      		 }else{
                      			layer.msg('启用失败',{icon: 5,time:1000});
                      		 }                     		  
          					},
          					function(res){
          						//响应失败
          						console.log(res);
          					});
                    }
            	
            }
			},
			created:function(){	
				this.pageHandler(1);	 
				}
			});    
   </script>
</body>
</html>