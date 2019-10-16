<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mall/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mall/layui/layui.all.js"></script>
<script type="text/javascript" src="/mall/layui/layui.js"></script>


</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
         <%--  <img src="/image/${photo}" class="layui-nav-img"> --%>
          [用户${staffname}] 欢迎登录
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:tui();">退出登录</a></li>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      
      
          <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">系统维护</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:openurl('/mall/web/customer/customer.jsp');">用户信息维护</a></dd>   
          </dl>
        </li>
      
      
      
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">商品信息维护</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:openurl('/mall/web/goods/goods.jsp');">商品信息维护</a></dd>
            <dd><a href="javascript:openurl('/mall/web/goods/goodsSort.jsp');">商品分类维护</a></dd>  
          </dl>
        </li>
        
        
        
         <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">订单信息维护</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:openurl('/mall/web/order/order.jsp');">订单信息维护</a></dd>   
             <dd><a href="javascript:openurl('/mall/web/order/addr.jsp');">地址信息维护</a></dd> 
             <dd><a href="javascript:openurl('/mall/web/order/acceptAddress.jsp');">用户收货地址</a></dd> 
          </dl>
        </li>
        
        
        
        
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    
	
	<iframe width="1160px" height="1000px" name="right" >
				
	</iframe>

	</div>

  
  <div class="layui-footer">
    <!-- 底部固定区域 -->

  </div>
</div>

<script>
			function openn (){   //弹窗
			layer.open({      // 按钮
			type:1,
			title:"信息维护",
			closeBtn:2,
			area:["500px","450px"],
			content:$("#aa").html(),
			success:function(){
				xuanran('');
				$("#queding").click(add);
				$("#quxiao").click(close);				
			}
			})	
}

		
	function xuanran(id){
		laydate.render({
			elem:"#date"+id,
			type:"date",
})
		form.render();
	}		
function close(){layer.close(layer.index)}
	

layui.use('element', function(){
  var element = layui.element;
  
  
});



var openurl=function(url){
	window.open(url,"right")
}

function tui (){
layer.confirm("是否退出",{
	title:"提示",
	icon:3,
	yes:function(){window.location.href="/mall/web/login.jsp";}
	
})	
}







</script>
</body>
</html>