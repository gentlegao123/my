<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>

<!DOCTYPE html>
<!-- saved from url=(0052)https://order.mi.com/buy/checkout?r=13094.1570166757 -->
<html lang="zh-CN" xml:lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<title>填写订单信息</title>
<meta name="viewport" content="width=1226">
<link rel="stylesheet" href="/mall/ordersList_fies/base.min.css">
<link rel="stylesheet" type="text/css" href="/mall/ordersList_fies/style.css">
 <link rel="stylesheet" type="text/css" href="/mall/res/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="/mall/res/static/css/main.css">
  <script type="text/javascript" src="/mall/res/layui/layui.all.js"></script>
  <script type="text/javascript" src="/mall/web/common.js"></script>
  <script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="shopMain.jsp">首页</a>
      </p>
      <div class="sn-quick-menu" id="if">
       
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
            <img src="../res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate onsubmit="return false">
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品" id="x">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="seach">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base commodity-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
             <a href="all.jsp?sortCode="+"">所有商品</a>
            <a href="today.jsp">今日团购</a>
            <a href="ask.jsp">母婴资讯</a>
            <a href="about.jsp">关于我们</a>
          </div>
        </div>
      </div>
    </div>
</div>	
	
	
<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./self_info.html">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div id="order_list" class="rtcont fr">
				<table class="layui-table">
		<colgroup>
			<col width="145px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			
			<col width="200px">
		</colgroup>
		<thead>
			<tr>
				<th>订单号</th>
				<th>状态</th>
				<th>地址</th>
				<th>时间</th>
				<th>详情</th>
							
				
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
			</table>
			<!-- <div class="ddxq">
				<div class="ddspt fl"><img src="./image/gwc_xiaomi6.jpg" alt=""></div>
				<div class="ddbh fl">订单号:1705205643098724</div>
				<div class="ztxx fr">
					<ul>
						<li>已发货</li>
						<li>￥2499.00</li>
						<li>2017/05/20 13:30</li>
						<li><a href="">订单详情></a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div> -->

		</div>
		<div id="pageInfoUser"
		style="text-align: right; padding-rignt: 30px"></div>
		</div>
		<div class="clear"></div>
		
	</div>
	<input type="hidden" name="pageIndex" value="1" />
	<input type="hidden" name="pageLimit" value="6" />

	
<script type="text/javascript">
var orderCode="<%= request.getParameter("orderCode")%>";
var customerCode="<%= request.getParameter("customerCode")%>";
if(orderCode!="null"){tj(orderCode);}
else if(customerCode!="null"){dian(customerCode);}
function tj(orderCode){
ajax('/mall/orderController/refresh.do',{'orderCode':orderCode},'json',function (data){
	$.each(data,function(i,dom){
   	 laytpl($('#demo').html()).render(dom,function(html){
  		  $("#order_list").append(html)
  		  
  	  })	
		
	}) 
})
}
//点击我的订单
function dian (){
	  ajax('/mall/orderController/refresh.do',{customerCode:customerCode},'json',function (data){
		  var html="";
			$.each(data,function(i,dom){
				tj(dom.orderCode)
			})
					  
	  })
	
}
//订单详情
function orderxq (orderCode){
	console.log("刷新"+orderCode);
	window.location.href="/mall/web/orderGoods.jsp?orderCode="+orderCode;
	
}

function tui (){
	  layer.confirm("是否退出",{
	  	title:"提示",
	  	icon:3,
	  	yes:function(){
	  	  ajax('/mall/customerController/tui.do',{},'json',function (data){
			if(data==1){window.location.href="/mall/web/login.jsp";}
			else{layer.msg("抱歉，退出失败！")}
			  }) 	  		
	  		}	  	
	  })  	
	  }

	ifif(); 
	   function ifif (){
			  ajax('/mall/customerController/loginif.do',{},'json',function (data){
				  	if(data==1){
                var html='<div class="login">${code}用户，你好！</div>'+
                '<div class="sp-cart"><a href="javascript:loginif();">购物车&nbsp;&nbsp;</a><span></span></div>'+
                '<div class="sp-cart"><a href="tjorder.jsp?customerCode="+customerCode+"">我的订单</a><span></span></div>'+
                '<div><a href="javascript:tui();">退出登录</a></div>'
				  	$("#if").html(html);			  		
				  	}
				  	else {
				  	var html='<div class="login"><a href="/mall/web/login.jsp">登录</a><a href="/mall/web/reg.jsp">&nbsp;注册</a></div>'+
			        '<div class="sp-cart"><a href="javascript:loginif();">购物车</a></div>'	
				  	$("#if").html(html);
				  	}		  
				  }) 	  
		  } 


	   function loginif (){
			  ajax('/mall/customerController/loginif.do',{},'json',function (data){
				  	if(data==1){window.location.href="/mall/web/shopCart.jsp";}
				  	else {layer.msg("抱歉，请先登录！")}		  
				  }) 	  
		  } 
	   
	   $("#seach").click(function(){
			var descr =$("#x").val();
			window.location.href="/mall/web/all.jsp?descr="+descr
		}) 	   
</script>
 
<script type="text/html" id="demo">
       <div class="ddxq">
				<div class="ddspt fl"><img src="/image/{{ d.imageName }}" alt="" width="80" height="80"></div>
				<div class="ddbh fl">订单号:{{d.orderCode}}</div>
				<div class="ztxx fr">
					<ul>
						<li>{{d.status}}</li>
						<li>{{d.addressCode}}</li>
						<li>{{d.time}}</li>
						<li><a href="javascript:orderxq({{d.orderCode}});">订单详情></a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
      </script> 
</html>