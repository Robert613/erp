<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
	<title>企业事务管理系统-主页</title>
  <meta name="renderer" content="webkit"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">  
  <meta name="format-detection" content="telephone=no"> 
  <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css">
	<link rel="stylesheet" type="text/css" href="css/main.css" media="all">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
</head>
<body>
<section class="larry-wrapper">
    <!-- overview -->
 
	<!-- overview end -->
	<div class="row" id="mainContainer">
		<div class="col-lg-6">
			<section class="panel">
				<header class="panel-heading bm0">
					<span class='span-title'>系统概览</span>
					<span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
				</header>
				<div class="panel-body" >
					<table class="table table-hover personal-task">
                         <tbody>
                         	<tr>
                         		<td> 版本信息：
                         			<strong id="version"></strong> 

                         		</td>
                         		<td>

                         		</td>
                         	</tr>
                         	<tr>
                         		<td>开发作者：
                                <strong id="hostName"></strong> 

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>网站域名：
                                <strong id="domainName"></strong> 
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>服务器IP：
                                <strong id="serverIp"></strong> 
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>服务器环境：
                                <strong  id="serverInfo"></strong>
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>数据库版本：
                                <strong id="databaseVersion"></strong>

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>当前登录用户：
                                <strong id="loginName"></strong>
                                </td>
                                <td></td>
                         	</tr>
                         </tbody>
					</table>
				</div>
			</section>
      <section class="panel">
                  <header class="panel-heading bm0">
                       <span class='span-title'>系统数据统计</span>
                       <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body laery-seo-box">
                        <div class="larry-seo-stats" id="larry-seo-stats1"></div>
                  </div>
                  <div class="panel-body laery-seo-box">
                        <div class="larry-seo-stats" id="larry-seo-stats"></div>
                  </div>
                   
      </section>
		</div>		 
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="jsplug/echarts.min.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
<script type="text/javascript" src="js/vue-resource.js"></script>
<script type="text/javascript">
var loginVue =  new Vue({
	el:"#mainContainer",
	methods:{
		userLogin:function(){
			//alert("哈哈哈");
			var params={"phone":this.admin.phone,"password":this.admin.password};
			//发送Ajax请求
			this.$http.post("login.action",params,{emulateJSON:true}).then(
			function(res){
				console.log(res.data);
				 if(res.data.result=="OK"){
					location.href="index.jsp";
					 }
				 else{
					  this.error="你的手机号和密码不匹配,请检查后再输入";					   
					 }
			},
			function(res){
				//响应失败
				console.log(res);
			});
		} 
	},
	created:function(){
		this.$http.post("getSystemInfo.action",{emulateJSON:true}).then(
				function(res){
					 $("#version").html(res.data.version);
					 $("#hostName").html(res.data.hostName);
					 $("#domainName").html(res.data.domainName);
					 $("#serverIp").html(res.data.serverIp);
					 $("#serverInfo").html(res.data.serverInfo);
					 $("#databaseVersion").html(res.data.databaseVersion);
					 $("#loginName").html(res.data.loginName);
					 var depName = res.data.depName;
					 var count = res.data.count;
					 var values = res.data.values;	 
					 var  json = [  
					                {value:values[0],name:'朋友推荐'},  
					                {value:values[1],name:'网络渠道'},
					                {value:values[2],name:'企业直访'},  
					                {value:values[3],name:'市场专员'}   
					             ]; 
					 var myChart = echarts.init(document.getElementById('larry-seo-stats'));
					 var myChart1 = echarts.init(document.getElementById('larry-seo-stats1'));
					 var option = {
							    title : {
							        text: '客户来源统计',
							        x:'center'
							    },
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient: 'vertical',
							        left: 'left',
							        data: ['朋友推荐','网络渠道','企业直访','市场专员']
							    },
							    series : [
							        {
							            name: '客户来源统计',
							            type: 'pie',
							            radius : '55%',
							            center: ['50%', '60%'],
							            data:json,
							            itemStyle: {
							                emphasis: {
							                    shadowBlur: 10,
							                    shadowOffsetX: 0,
							                    shadowColor: 'rgba(0, 0, 0, 0.5)'
							                }
							            }
							        }
							    ]
							};
					 var option1 = {
								title: {
									text: '部门人数统计'
								},
								tooltip: {},
								legend: {
									data: ['人数']
								},
								xAxis: {
									data : depName,
									max:13
								},
								yAxis: {},
								series: [{
									name: '人数',
									type: 'bar',
									data: count
								}]
							};
					 myChart.setOption(option);
					 myChart1.setOption(option1);
				},
				function(res){
					//响应失败
					console.log(res);
				});
	}
   });
 layui.use(['jquery','layer','element'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
    window.element = layui.element();

   $('.panel .tools .iconpx-chevron-down').click(function(){
   	   var el = $(this).parents(".panel").children(".panel-body");
   	   if($(this).hasClass("iconpx-chevron-down")){
   	   	   $(this).removeClass("iconpx-chevron-down").addClass("iconpx-chevron-up");
   	   	   el.slideUp(200);
   	   }else{
   	   	   $(this).removeClass("iconpx-chevron-up").addClass("iconpx-chevron-down");
   	   	   el.slideDown(200);
   	   }
   })

}); 
</script>
</body>
</html>