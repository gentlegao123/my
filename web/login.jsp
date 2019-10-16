<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
  <script type="text/javascript">
layui.use("layer",function(){var layer=layui.layer;})

var form = layui.form;
</script>

</head>

<body>
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="shopMain.jsp">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="/mall/web/login.jsp">登录</a><a href="/mall/web/reg.jsp">&nbsp;注册</a></div>
        <div class="sp-cart"><a href="javascript:loginif();">购物车</a></div>
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


  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="all.jsp?sortCode="+"" class="active">所有商品</a>
            <a href="buytoday.html">今日团购</a>
            <a href="information.html">母婴资讯</a>
            <a href="about.html">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form" onsubmit="return false" id="form">
            <legend>登录</legend>
            <div class="layui-form-item">
            
              <div class="layui-inline">
                <div class="layui-input-inline">   
                  <input type="text" name="customerCode" id="customerCode" lay-verify="required|phone" placeholder="请输入账号" autocomplete="off" class="layui-input">
                </div>
              </div>
              
                        <div class="layui-inline">
                <div class="layui-input-inline">   
                  <input type="password" name="customerPass" id="customerPass" lay-verify="required|phone" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
              </div>
                       
             <div class="layui-inline">
                <img src="/mall/yzmController/yzm.do?" onclick="this.src='/mall/yzmController/yzm.do?'+Math.random();" align="absmiddle"/>
                <div class="layui-input-inline" style="width:215px;">       
	       <input type="text" name="code" class="layui-input" placeholder="请输入验证码" />
                </div>
              </div>
              
              
            </div>
            
            
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="login()">登录</button>
              </div>
            </div>
          </form>
        </div>
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
  function login (){
	  	console.log("login");
	  ajax('/mall/customerController/login.do',$("#form").serialize(),'json',function (data){
	  	if(data==1){window.location.href="/mall/web/managerMain.jsp";} //跳转管理员界面
	  	else if(data==2){window.location.href="/mall/web/shopMain.jsp";}  //跳转用户界面
		else if(data==4){layer.msg("验证码错误!")}
		else if(data==5){layer.msg("账号不存在!")}
	  	else{layer.msg("密码错误!")}
	  })
	  }
  
  function loginif (){
	  ajax('/mall/customerController/loginif.do',{},'json',function (data){
		  	if(data==1){window.location.href="/mall/web/shopCart.jsp";}
		  	else {layer.msg("抱歉，请先登录！")}		  
		  }) 	  
  } 
  

  </script>
</body>
</html>