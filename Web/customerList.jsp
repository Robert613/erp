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
	<script type="text/javascript" src="js/vue.min.js" ></script>
</head>
<body>
<section class="layui-larry-box">
		<div class="larry-personal" id="customerListContainer">
	    <div class="layui-tab">
   <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		     <input placeholder="请输入客户名" id="searchInput" class="layui-input search_input" type="text"/>
		    </div>
		    <a class="layui-btn search_btn" @click="pageHandler(1);">查询</a>
		</div><div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" onclick="x_admin_show('添加客户','./customerAdd.jsp',600,400)"><i class="layui-icon">&#xe608;</i>添加客户</a>
		</div>
		 
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel" @click="batchDel();"><i class="layui-icon">&#xe640;</i>批量删除</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel"><i class="layui-icon">&#xe640;</i>导出Excel表</a>
		</div>
		 
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>序号</th>
                                  <th>客户编号</th>
                                  <th>姓名</th>
                                  <th>性别</th>
                                  <th>联系电话</th>
                                  <th>家庭住址</th>
                                  <th>职业</th>
                                  <th>客户来源</th>
                                  <th>客户类别</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr v-for="(item,index) in customerList">
                                <td><input type="checkbox" :value="item.cid"></td>
                                <td>{{index+1}}</td>
                                <td>{{item.cid}}</td>
                                <td>{{item.cname}}</td>
                                <td>{{item.sex}}</td>
                                <td>{{item.phone}}</td>
                                <td>{{item.addr}}</td>
                                <td>{{item.profession}}</td>
                                <td>{{item.source}}</td>
                                <td>{{item.type}}</td>
                                <td>
                                <button class="layui-btn layui-btn-mini news_edit" @click="customerDetail(item.cid)"><i class="iconfont icon-edit"></i>编辑</button>    
								<buuton class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="5" @click="delCustomer(item.cid,index)"><i class="layui-icon"></i> 删除</button>	
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
 <script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script src="js/zpageNav.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">
              
		var vue1=new Vue({
			el:'#customerListContainer',
			data:{
				customerList:[],
				page: 1,
				prePage:1,
	            pageSize: 7,
	            total: 150,
	            maxPage:9
			},
			methods:{
				pageHandler: function (page) {
              this.page = page;
              var params = {"page":page,"row":this.pageSize,"cname":$("#searchInput").val()}
          	this.$http.post("getCustomers.action",params,{emulateJSON:true}).then(
						function(res){
							this.customerList=res.data.list;
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
              customerDetail:function(cid){
            	  x_admin_show("修改客户信息","customerEdit.jsp?cid="+cid,600,400);
              },
              delCustomer:function(cid,index){
              	var params={"cid":cid};
					//发送Ajax请求
					this.$http.post("delCustomer.action",params,{emulateJSON:true}).then(function(res){
						if(res.data.result=="OK"){
							this.customerList.splice(index,1);
							if(this.customerList.length==0){
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
            	 this.$http.post("batchdelCustomer.action",{cIds:delIds},{emulateJSON:true}).then(function(res){
            		 
            		 if(this.customerList.length==0){
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
             }
			},
			created:function(){	
				this.pageHandler(1);	 
				}
			});    
   </script>
</body>
</html>