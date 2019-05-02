<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="404.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <meta name="author" content="order by dede58.com"/>
	<title>企业事务管理系统-主页</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
	<script type="text/javascript" src="js/xadmin.js" ></script>                                                                                                                                                                                        
	<script type="text/javascript" src="common/layui/layui.js"></script> 
	<script type="text/javascript" src="js/larry.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="index.jsp" style="font-size: 21px;">企业事务管理系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item first">
						<a href="javascript:;">			
							<cite id="adminName">${sessionScope.admin.adminname}</cite>
							<span class="layui-nav-more"></span>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a onclick="x_admin_show('修改个人信息','./changepwd.jsp?id=${sessionScope.admin.id}',600,400)">个人信息</a>
							</dd>
							<dd>
								<a href="exit.action">退出</a>
							</dd>
							
						</dl>
					</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="main.jsp">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>系统首页</span>
				</a>
			</li>
			<!-- 部门管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-jiaoseguanli2" ></i>
					   <span>部门管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="departmentList.jsp">
					    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
					    		   <span>部门查询</span>
					    		</a>
					    	</dd>
					    </dl>
			    </li>
			    <!-- 人事管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-jiaoseguanli2" ></i>
					   <span>人事管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="staffList.jsp">
					    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
					    		   <span>员工管理</span> 
					    		</a>
					    	</dd>
					    </dl>
			    </li>
			<!-- 客户管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>客户管理</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="customerList.jsp">
                            <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                            <span>客户查询</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<!-- 订单管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-wenzhang1" ></i>
					   <span>订单管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					   <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="orderList.jsp">
					    		   <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
					    		   <span>订单查询</span>
					    		</a>
					    	</dd>
					   </dl>
			   </li>
			
                 <!-- 出入库管理 -->
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-wenzhang1"></i>
					   <span>出入库管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					<dl class="layui-nav-child">
                           <dd>
                           	   <a href="javascript:;" data-url="storageList.jsp">
					              <i class="iconfont icon-wenzhang1"  data-icon='icon-zhuti'></i>
					              <span>入库管理</span>
					           </a>
                           </dd>
                           <dd>
                           	   <a href="javascript:;" data-url="delstorageList.jsp">
					              <i class="iconfont icon-wenzhang1"  data-icon='icon-zhuti'></i>
					              <span>出库管理</span>
					           </a>
                           </dd>
                    </dl>
				</li>
				<!-- 系统设置 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-xitong" ></i>
					   <span>系统设置</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="loginList.jsp">
					    		   <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
					    		   <span>登录记录</span>
					    		</a>
					    	</dd>
					    </dl>
				</li>
		</ul>
	    </div>
	</div>
	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>系统首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<!--  <ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>-->
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="main.jsp" name="hi"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>&copy;2018-2021 </span>
		    	云汇信息科技有限公司 版权所有
		    </p>
		</div>
	</div>
</div>
<script>
$("iframe[name=hi]").load(function(){ 
	if ($(this).data("send")) { 
	$(this).attr("src", "about:blank").data("send",false); 
	} 
	})


</script>
</body>
</html>