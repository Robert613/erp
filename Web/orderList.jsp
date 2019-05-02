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
	    <div class="layui-tab" id="orderlistController">
   <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入客户姓名" class="layui-input search_input" type="text" id="oname">
		    </div>
		    <a class="layui-btn search_btn" @click="javascript:pageHandler(1);">查询</a>
		</div><div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" onclick="x_admin_show('新增订单','./orderAdd.jsp',1000,400)"><i class="layui-icon">&#xe608;</i>新增订单</a>
		</div>
		 
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel" @click="javascript:batchDel();"><i class="layui-icon">&#xe640;</i>批量删除</a>
		</div>
		 
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>序号</th>
                                  <th>客户姓名</th>
                                  <th>联系电话</th>
                                  <th>家庭住址</th>
                                  <th>订单项目名</th>
                                  <th>订单金额</th>
                                  <th>支付状态</th>
                                  <th>订单创建时间</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr  v-for="(item,index) in ordersList">
                                <td><input type="checkbox" :value="item.oid"></td>
                                <td>{{index+1}}</td>
                                <td>{{item.name}}</td>
                                <td>{{item.phone}}</td>
                                <td>{{item.addr}}</td>
                                <td>{{item.projectname}}</td>
                                <td>{{item.orderaccount}}</td>
                                <td>{{item.orderstatus}}</td>
                                <td>{{item.createtime}}</td>
                                <td>
                                <button class="layui-btn layui-btn-mini news_edit" @click="javascript:orderDetail(item.oid);" href="javascript:;"><i class="iconfont icon-edit"></i>订单详情</button>    
								<buuton class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="5" @click="javascript:delOrder(item.oid,index);"><i class="layui-icon"></i> 删除</button>	
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
			el:'#orderlistController',
			data:{
				ordersList:[],
				page: 1,
				prePage:1,
	            pageSize: 7,
	            total: 150,
	            maxPage:9
			},
			methods:{
				pageHandler: function (page) {
              this.page = page;
              var params = {"page":page,"row":this.pageSize,"name":$("#oname").val()}
          	this.$http.post("getOrdersList.action",params,{emulateJSON:true}).then(
						function(res){
							this.ordersList=res.data.list;
							for(var i=0;i<this.ordersList.length;i++){   
                              	 this.ordersList[i].createtime = new Date(this.ordersList[i].createtime).format("yyyy-MM-dd");                   
								}
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
              orderDetail:function(oid){
            	  x_admin_show("订单详情","orderEdit.jsp?oid="+oid,900,400);
              },
              delOrder:function(oid,index){
              	var params={"oid":oid};
					//发送Ajax请求
					this.$http.post("delOrder.action",params,{emulateJSON:true}).then(function(res){
						if(res.data.result=="OK"){
							this.ordersList.splice(index,1);
							if(this.ordersList.length==0){
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
            	 var oIds = new Array();
            	 $("input:checked").each(function(){
            		 oIds.push($(this).val());
            	 });
            	 this.$http.post("batchdelOrder.action",{oIds:oIds},{emulateJSON:true}).then(function(res){
            		 
            		 if(this.ordersList.length==0){
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