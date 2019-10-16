<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
       isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

  <link rel="stylesheet" type="text/css" href="/mall/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/mall/res/layui/css/layui.css">
  <script type="text/javascript" src="/mall/res/layui/layui.js"></script>
  <script type="text/javascript" src="/mall/web/common.js"></script>
  <script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body id="list-cont">
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


  <div class="content">
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
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        
        
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear" id="ul">
          
           
          
          
          
            
            </ul>
          </div>
        </div>
        
        
        
      </div>
      <div class="category-banner">
        <div class="w1200">
           <img src="../res/static/img/banner1.jpg">
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="../res/static/img/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>

    <div class="hot-recommend-con">
       <div class="hot-con1 w1200 layui-clear">
          <div class="item">
            <h4>热销推荐</h4>
            <div class="big-img">
              <a href="javascript:;"><img src="../res/static/img/hot1.png"></a>
            </div>
            <div class="small-img">
              <a href="javascript:;"><img src="../res/static/img/hot2.png" alt=""></a>
            </div>
          </div>
          <div class="item">
            <div class="top-img">
              <a href="javascript:;"><img src="../res/static/img/hot5.jpg"></a>
            </div>
            <div class="bottom-img">
              <a href="javascript:;"><img src="../res/static/img/hot6.jpg"></a>
              <a class="baby-cream" href="javascript:;"><img src="../res/static/img/hot7.jpg"></a>
            </div>
          </div>
          <div class="item item1 margin0 padding0">
            <a href="javascript:;"><img src="../res/static/img/hot8.jpg"></a>
            <a href="javascript:;"><img class="btm-img" src="../res/static/img/hot9.jpg"></a>
          </div>
      </div>
    </div>
    




    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
  
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">母婴资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
  </div>
  <script type="text/javascript">

layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
      // 模版引擎导入
     // var ins = carousel.render(option);
     // var html = demo.innerHTML;
     // var listCont = document.getElementById('list-cont');
     // // console.log(layui.router("#/about.html"))
     //  mm.request({
     //    url: '../json/index.json',
     //    success : function(res){
     //      console.log(res)
     //      listCont.innerHTML = mm.renderHtml(html,res)
     //      ins.reload(option);
     //    },
     //    error: function(res){
     //      console.log(res);
     //    }
     //  })
    

});
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
	  
ajax('/mall/goodsSortController/refresh.do',{"parentCode":"0"},'json',function (data){
	  var html=""; 
	  $.each(data,function(i,dom){
		 html+='<li class="nav-item"><div class="title" >'+dom.sortName+'</div><p id="'+dom.sortCode+'"></p></li>'	  	 
	  }) 
	  $("#ul").html(html)
	  
	  $.each(data,function(i,d){
		  
	ajax('/mall/goodsSortController/refresh.do',{"parentCode":d.sortCode},'json',function (data){
		var html2="";
		$.each(data,function(i,doo){
			html2+='<a href="all.jsp?sortCode='+doo.sortCode+'">'+doo.sortName+'</a>'			
		})
		$("#"+d.sortCode).html(html2);
		
})		  
}) 	  
})  	


/*    <li class="nav-item">
                <div class="title">奶粉辅食</div>
                <p><a href="#">奶粉</a><a href="#">捕食</a><a href="#">营养品</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
	   */
	
	   //是否已经登录
	   function loginif (){
			  ajax('/mall/customerController/loginif.do',{},'json',function (data){
				  	if(data==1){window.location.href="/mall/web/shopCart.jsp";}
				  	else {layer.msg("抱歉，请先登录！")}		  
				  }) 	  
		  }  
//根据是否登录显示	   
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
	   
//搜索




$("#seach").click(function(){
	var descr =$("#x").val();
	window.location.href="/mall/web/all.jsp?descr="+descr
})   
	   
	   
	   
   
	   
  </script>
</body>
</html>