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
  <script type="text/javascript" src="/mall/res/layui/layui.js"></script>
  <script type="text/javascript" src="/mall/web/common.js"></script>
  <script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  

</head>

<body>
  <script>
  layui.use("layer",function(){var layer=layui.layer;})
 
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
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div class="list-box" id="dl">
            
           
            
          
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a class="active" href="javascript:;" event = 'volume'>销量</a>
              <a href="javascript:;" event = 'price'>价格</a>
              <a href="javascript:;" event = 'newprod'>新品</a>
              <a href="javascript:;" event = 'collection'>收藏</a>
            </div>
            <div class="prod-number">
              <span>200个</span>
            </div>
            <div class="cont-list layui-clear" id="list-cont">
             
            </div>
            <!-- 模版引擎导入 -->
            <!-- <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}    
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script> -->
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="demo0" style="text-align: center;"></div>
<script>



var c="<%= request.getParameter("sortCode")%>"
var temp2 ="";
console.log(c)
$("#seach").click(function(){
	var temp1 =$("#x").val();
	select(temp1)
})


yisou();
function yisou(){
	var descr="<%= request.getParameter("descr")%>"
	var n ="null";
	if (descr!=n){ select(descr);console.log(1)}
	else if(c!=n){seler(c);console.log(2)}
	else{seler();console.log(3)}
}




    // 模版引擎导入
    //  var html = demo.innerHTML;
    //  var listCont = document.getElementById('list-cont');
    //  // console.log(layui.router("#/about.html"))
    // mm.request({
    //     url: '../json/commodity.json',
    //     success : function(res){
    //       console.log(res)
    //       listCont.innerHTML = mm.renderHtml(html,res)
    //     },
    //     error: function(res){
    //       console.log(res);
    //     }
    //   })
    function a (){
  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });
    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    })
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }
    })
});
    }
  

  
  //显示商品
  function seler(sortCode){
	  ajax('/mall/goodsController/refreshImage.do',{"sortCode":sortCode},'json',function (data){
		  var html="";
			$.each(data,function(i,dom){					
			html+="<div class='item'>"+
	        "<div class='img'>"+
	        "<a href='/mall/web/detail.jsp?goodsCode="+dom.goodsCode+"'><img src='/image/"+dom.imageName+"' class='layui-upload-img'  width='282px' height='280px'></a></div>"+
	       "<div class='text'>"+
	       "<p class='title'>"+dom.descr+"</p>"+
	        "<p class='price'>"+
	       "<span class='pri'>"+dom.price+"</span>"+
	        "<span class='nub'>1266人已付款</span>"+
	        "</p></div></div>"})
			$("#list-cont").html(html)	
			a();
	})  	  
}
//退出

//分类查询搜索
  function select (temp){ 
  ajax('/mall/goodsController/refreshImage.do',{"descr":temp},'json',function (data){
	  var html="";
		$.each(data,function(i,dom){					
		html+="<div class='item'>"+
        "<div class='img'>"+
        "<a href='/mall/web/detail.jsp?goodsCode="+dom.goodsCode+"'><img src='/image/"+dom.imageName+"' class='layui-upload-img'  width='282px' height='290px'></a></div>"+
       "<div class='text'>"+
       "<p class='title'>"+dom.descr+"</p>"+
        "<p class='price'>"+
       "<span class='pri'>"+dom.price+"</span>"+
        "<span class='nub'>1266人已付款</span>"+
        "</p></div></div>"})
		$("#list-cont").html(html)			  
})	
a();
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
	   ajax('/mall/goodsSortController/refresh.do',{"parentCode":"0"},'json',function (data){
			  var html=""; 
			  $.each(data,function(i,dom){
				 html+='<dl><dt>'+dom.sortName+'</dt><dd><a href="javascript:seler(\''+dom.sortCode+'\');" id="'+dom.sortCode+'"></a></dd></dl>'; 
			  }) 
			  $("#dl").html(html)
			  
			  $.each(data,function(i,d){
				  
			ajax('/mall/goodsSortController/refresh.do',{"parentCode":d.sortCode},'json',function (data){
				var html2="";
				$.each(data,function(i,doo){
					html2+='<a href="javascript:seler(\''+doo.sortCode+'\');">'+doo.sortName+'</a>'			
				})
				$("#"+d.sortCode).html(html2);
				
		})		  
		}) 	  
		})  	   
	
	   
	   
	   
	   
	   
</script>


</body>
</html>