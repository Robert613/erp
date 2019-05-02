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
	<script type="text/javascript" src="js/zpageNav.js" ></script>
</head>
<body>
<section class="layui-larry-box">
		<div class="larry-personal" id="loginslistContainer">
	    <div class="layui-tab">
   <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text" id="searchInput">
		    </div>
		    <a class="layui-btn search_btn" @click="pageHandler(1);">查询</a>
		</div>	 
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th>序号</th>
                                  <th>用户名</th>
                                  <th>登录时间</th>
                                  <th>登录IP</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr v-for="(item,index) in loginstList">
                                <td>{{index+1}}</td>
                                <td>{{item.loginName}}</td>
                                <td>{{item.loginTime}}</td>
                                <td>{{item.loginIp}}</td>
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
			el:'#loginslistContainer',
			data:{
				loginstList:[],
				page: 1,
				prePage:1,
	            pageSize: 7,
	            total: 150,
	            maxPage:9
			},
			methods:{
				pageHandler: function (page) {
              this.page = page;
              var params = {"page":page,"row":this.pageSize,"loginName":$("#searchInput").val()}
          	this.$http.post("getLoginsList.action",params,{emulateJSON:true}).then(
						function(res){
							this.loginstList=res.data.list;
							for(var i=0;i<this.loginstList.length;i++){   
                              	 this.loginstList[i].loginTime = new Date(this.loginstList[i].loginTime).format("yyyy-MM-dd");                   
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
              } 
			},
			created:function(){	
				this.pageHandler(1);	 
				}
			});    
   </script>
</body>
</html>