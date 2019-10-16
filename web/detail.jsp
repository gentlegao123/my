<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/mall/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/mall/res/layui/css/layui.css">
  <script type="text/javascript" src="/mall/res/layui/layui.all.js"></script>
  <script type="text/javascript" src="/mall/web/common.js"></script>
  <script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>


  <script>
var layer=layui.layer
var form=layui.form;
  </script>
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
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
      <div class="crumb">
        <a href="shopMain.jsp">首页</a>
        <span>></span>
        <a href="all.jsp?sortCode="+"">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      
      
      
    
     <div class="product-intro layui-clear" id="detail">
  
      </div> 
     
      
      
      
      <div class="layui-clear">
        <div class="aside">
         <h4>热销推荐</h4>
          <div class="item-list">
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img src="../res/static/img/details_img2.jpg">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
          </div>
        </div>
        <div class="detail">
          <h4>详情</h4>
          <div class="item" id="t" style="width:740px;">
      
          </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
function a (){
  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery'],function(){
      var mm = layui.mm,$ = layui.$;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur)
      })
      
  })}
  
  var goodsCode="<%= request.getParameter("goodsCode")%>"
  var customerCode="<%= request.getSession().getAttribute("code")%>"
  var laytpl = layui.laytpl;
  //模板显示
    ajax('/mall/goodsController/refreshImage.do',{'goodsCode':goodsCode},'json',function (data){
        	$.each(data,function(i,dom){
           	 laytpl($('#model').html()).render(dom,function(html){
          		  $("#detail").html(html)
          		  a();
          	  })	
        		
        	}) 
})


//查询详情图
    ajax('/mall/goodsImageController/selectAll.do',{'goodsCode':goodsCode},'json',function (data){
        	var html="";
        	
    	$.each(data,function(i,dom){
          	html+= "<img src='/image/"+dom.imageName+"' width='800px' height='400px'>"
          	$("#t").html(html);
    	})
})


 //查询价格，加入
function addcart(){
    
    ajax('/mall/goodsController/select.do',{'goodsCode':goodsCode},'json',function (data){
    var price=data.price
    console.log(data+"123")
    var num =$("#num").val()
    var dat={"customerCode":customerCode,
    		"goodsCode":goodsCode,
    		"price":price,
    		 /* "number":num */
    		}
   
    console.log(dat)
    add(dat)
    
})	}

//加入购物车

function add(dat){
	
    	 ajax('/mall/shopcartController/insert.do?num='+num,dat,'json',function (data){
    			if(data==1){layer.msg("加入购物车成功!")}
    			else{layer.msg("加入失败!")}
 })
} 


//退出 	
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
           ' <div class="sp-cart"><a href="tjorder.jsp?customerCode="+customerCode+"">我的订单</a><span></span></div>'
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
  
 function order (){
	 window.location.href="/mall/web/order.jsp";
	 
	   $("#seach").click(function(){
			var descr =$("#x").val();
			window.location.href="/mall/web/all.jsp?descr="+descr
		}) 	 
 } 
  
  
  
  
  
  
  
  
 //模板
</script>
<script type="text/html" id='model'>

       <div class="preview-wrap">
          <a href="javascript:;"><img src='/image/{{ d.imageName }}'  width='360px' height='368px'></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4>{{ d.descr }}</h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
              <p class="reference"><span>参考价</span> <del>￥280.00</del></p>
              <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>{{ d.price }}</strong></p>
              <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">除新疆、西藏、内蒙古、青海、海南、宁夏等偏远地区外均可</strong></p>
            </div>
            <div class="choose-attrs">
             
              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="" value="1" id="num"><span class="add btn">+</span></div></div>
            </div>
            <div class="choose-btns">
              <button class="layui-btn layui-btn-primary purchase-btn" onclick="order()">立刻购买</button>
              <button class="layui-btn  layui-btn-danger car-btn" onclick="addcart()"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  
            </div>
          </div>
        </div> 

</script>


</body>
</html>