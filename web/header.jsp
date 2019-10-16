<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="com.st.mall.sys.model.UserModel" %>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="/mall/web/shopMain.jsp">首页</a>
      </p>
      <div class="sn-quick-menu" id="if">
         <% UserModel obj = (UserModel)session.getAttribute("user"); %>;
         <% if(obj==null){ %>
         	<div class="login"><a href="/mall/web/login.jsp">登录</a><a href="/mall/web/reg.jsp">&nbsp;注册</a></div>
			        <div class="sp-cart"><a href="javascript:loginif();">购物车</a></div>	
		 <% } else{ %>
		    <div class="login"><%= obj.getAccount() %>，你好！</div>
		    	   <div><a href="/mall/web/order_info.jsp">我的订单&nbsp;&nbsp;</a></div>
	               <div class="sp-cart"><a href="javascript:loginif();">购物车&nbsp;&nbsp;</a><span></span></div>
	               <div><a href="javascript:front_logout();">退出登录</a></div>
		 <% } %>	  	
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="/mall/web/shopMain.jsp" title="母婴商城">
            <img src="/mall/res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          
            <form action="" class="layui-form" novalidate onsubmit="return false">
            <input type="text" name="title" id="descr" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit id="search" lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
          
        </div>
      </div>
    </div>
  </div>
