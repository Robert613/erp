<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
	<title>添加信息</title>
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
	<link rel="stylesheet" href="css/zpageNav.css" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
</head>
<body class="childrenBody">
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box" id="goodsContainer">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob" id="goodstable">
                          <thead>
                              <tr>
                                 
                                  <th>序号</th>
                                  <th>商品编号</th>
                                  <th>商品名</th>
                                  <th>进货单价</th>
                                  <th>数量(初始数量为库存数)</th>
                                  <th>供货商</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr v-for="(item,index) in goodsList">      
                                <td>{{index+1}}</td>
                                <td>{{item.gid}}</td>
                                <td>{{item.gname}}</td>
                                <td>{{item.gprice}}</td>
                                <td><input type="text" class="layui-input"  :value="item.total" /></td>
                                <td>{{item.supplier}}</td>
                                <td>
                                <buuton class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="5" @click="chooseGoods(index+1);"><i class="layui-icon"></i>添加</button>	
                                </td>
                              </tr>  
                          </tbody>
                     </table>
                      
                     
			    </div>
			    <div class="larry-table-page clearfix">
                    <div class="wrap" id="wrap">
                    <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler"><zpagenav>
                     </div>
			         </div>
		    </div>
	<script type="text/javascript" src="js/util.js"></script>	
	<script type="text/javascript" src="js/vue.min.js"></script>
	<script src="js/zpageNav.js"></script>
	<script type="text/javascript" src="js/vue-resource.js"></script>
	 <script type="text/javascript">
	       
	           
			var vue1=new Vue({
				el:'#goodsContainer',
				data:{
					goodsList:[],
					page: 1,
					prePage:1,
		            pageSize: 3,
		            total: 150,
		            maxPage:9,
		            goods:{
		            	gid:"",
		            	gname:"",
		            	gprice:"",
		            	total:"",
		            	supplier:""
		            }
				},
				methods:{
					pageHandler: function (page) {
	              this.page = page;
	              var params = {"page":page,"row":this.pageSize,"gname":getQueryString("gname")}
	          	this.$http.post("getGoodsList.action",params,{emulateJSON:true}).then(
							function(res){
								this.goodsList=res.data.list;
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
				chooseGoods:function(index){
					var gid = $("#goodstable tr:eq("+index+") td:nth-child(2)").html();
					var gname = $("#goodstable tr:eq("+index+") td:nth-child(3)").html();
					var gprice = $("#goodstable tr:eq("+index+") td:nth-child(4)").html();
				    var total = $("#goodstable tr:eq("+index+") td:nth-child(5)").find("input").val();
				    var supplier = $("#goodstable tr:eq("+index+") td:nth-child(6)").html();
	                var params = {"gid": gid,
					               "gname":gname,
					               "gprice":gprice,
					               "total": total,
					               "supplier":supplier
					};
					
					//发送Ajax请求
					this.$http.post("saveGoods.action",params,{emulateJSON:true}).then(
					function(res){
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
					this.pageHandler(1);	 
					}
				});    
	   </script>
</body>
</html>