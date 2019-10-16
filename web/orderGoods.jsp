<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mall/layui/css/layui.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="/mall/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/mall/res/layui/css/layui.css">
  <script type="text/javascript" src="/mall/res/layui/layui.js"></script>
<script type="text/javascript" src="/mall/layui/layui.all.js"></script>
<script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/mall/web/common.js"></script>
<script type="text/javascript">
var layer=layui.layer;
var form = layui.form;
var laydate  = layui.laydate;
var upload = layui.upload;
</script>
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



	<table class="layui-table">
		<colgroup>
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			
			<col width="200px">
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>图片</th>
				<th>订单编号</th>
				<th>商品编号</th>
				<th>数量</th>
				<th>价格</th>			
				
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
			</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>

<script type="text/javascript">
var orderCode="<%= request.getParameter("orderCode")%>"

refresh();
function refresh(){

	  ajax('/mall/orderGoodsController/select.do',{orderCode:orderCode},'json',function (data){
		  var html="";
			$.each(data,function(i,dom){
				
			html+="<tr><td>"+(i+1)+"</td>"+
			"<td><img src='/image/"+dom.imageName+"'></td>"+
			"<td>"+dom.orderCode+"</td>"+
			"<td>"+dom.goodsCode+"</td>"+			
			"<td>"+dom.num+"</td>"+
			"<td>"+dom.price+"</td>"+
			"</td></tr>"})
			$("#tbody").html(html)			  
	  })	
};





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






</body>
</html>