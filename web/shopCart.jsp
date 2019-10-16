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
  <script type="text/javascript">
var layer=layui.layer;
var form = layui.form;
var laydate  = layui.laydate;
var upload = layui.upload;
var customerCode="${code}";
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
       <div class="login">${code}用户，你好！</div>
        <div class="sp-cart"><a href="shopMain.jsp">返回首页</a><span></span></div>
         <div class="sp-cart"><a href="tjorder.jsp?customerCode="+customerCode+"">我的订单</a><span></span></div>
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


  <div class="content content-nav-base shopcart-content">
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
    <div class="banner-bg w1200">
      <h3>夏季清仓</h3>
      <p>宝宝被子、宝宝衣服3折起</p>
    </div>
    
    <div class="cart w1200">
      <div class="cart-table-th">
        <div class="th th-chk">
          <div class="select-all">
            <div class="cart-checkbox">
              <input class="check-all check" id="allCheckked" type="checkbox" value="">
            </div>
          <label>&nbsp;&nbsp;全选</label>
          </div>
        </div>
        <div class="th th-item">
          <div class="th-inner">
            商品
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            单价
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
            数量
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            小计
          </div>
        </div>
        <div class="th th-op">
          <div class="th-inner">
            操作
          </div>
        </div>  
      </div>
      <div class="OrderList">
      
      
        <div class="order-content" id="list-cont">
        
        
       <!--   <ul class="item-content layui-clear">
            <li class="th th-chk">
              <div class="select-all">
                <div class="cart-checkbox">
                  <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                </div>
              </div>
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg" alt=""></a>
                <div class="text">
                  <div class="title">宝宝T恤棉质小衫</div>
                  <p><span>粉色</span>  <span>130</span>cm</p>
                </div>
              </div>
            </li>
            <li class="th th-price">
              <span class="th-su">189.00</span>
            </li>
            <li class="th th-amount">
              <div class="box-btn layui-clear">
                <div class="less layui-btn">-</div>
                <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                <div class="add layui-btn">+</div>
              </div>
            </li>
            <li class="th th-sum">
              <span class="sum">189.00</span>
            </li>
            <li class="th th-op">
              <span class="dele-btn">删除</span>
            </li>
          </ul> -->
          
         
         
         
        </div>
      
      </div>
      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
          <div class="select-all">
            <div class="cart-checkbox">
              <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
            </div>
            <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
          </div>
        </div>
        <div class="th batch-deletion">
          <span class="batch-dele-btn">批量删除</span>
        </div>
        <div class="th Settlement">
          <button class="layui-btn" onclick="order()">结算</button>
        </div>
        <div class="th total">
          <p>应付：<span class="pieces-total">0</span></p>
        </div>
      </div>
    </div>  
  </div>

<script type="text/javascript">

  
  
  
  var laytpl = layui.laytpl;
  show();

  function show(){
	    ajax('/mall/shopcartController/refresh.do',{'customerCode':customerCode},'json',function (data){
	    	var h=""
	    	$.each(data,function(i,dom){
           	 laytpl($('#demo').html()).render(dom,function(html){
          		 h=h+html
          	  })	
        		$("#list-cont").html(h)
        		layui.config({
        		    base: '/mall/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
        		  }).use(['mm','jquery','element','car'],function(){
        		    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
        		    car.init()
        		});
        	})  
})
}
  
  


 //删除
	function del(id){
		layer.confirm("是否删除",{
			title:"提示",
			icon:3,
			yes:function(){  //不能传参数
				ajax("/mall/shopcartController/delete.do",{"id":id},"json",function(data){
				
					if(data==1){layer.msg("删除成功");show();}
				
					else{layer.msg("删除失败")}
				})		
			}		
		})	
	}
	
	//结算					
  function order(){
	    var goodsCodes='';
		var f1=function(){ goodsCodes=goodsCodes+$(this).val()+",";}  //爱好
		$('input[name="goods"]:checked').each(f1)
		console.log(goodsCodes)
		if(goodsCodes==''){layer.msg("请选择商品");}
		else{window.location.href="/mall/web/order.jsp?goodsCodes="+goodsCodes;}	  
  }
//购物车添加
function jia(id){
	 ajax('/mall/shopcartController/jia.do',{id:id},'json',function (data){
			if(data==1){layer.msg("操作成功!")}
			else{layer.msg("操作失败!")}
})
	
}
//购物车减
function jian(id){
	 ajax('/mall/shopcartController/jian.do',{id:id},'json',function (data){
			if(data==1){layer.msg("操作成功!")}
			else{layer.msg("亲，不能再少了!")}
})
	
}
</script>
 <!-- 模版导入数据 -->
       <script type="text/html" id="demo">
       <ul class="item-content layui-clear">
            <li class="th th-chk">
              <div class="select-all">
                <div class="cart-checkbox">
                  <input class="CheckBoxShop check" id="goods" type="checkbox" num="all" name="goods" value={{ d.goodsCode }}>
                </div>
              </div>
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src="/image/{{ d.imageName }}" alt=""></a>
                <div class="text">
                  <div class="title">{{ d.goodsDescr }}</div>
                  
                </div>
              </div>
            </li>
            <li class="th th-price">
              <span class="th-su">{{ d.price }}</span>
            </li>
           <li class="th th-amount">
              <div class="box-btn layui-clear">
                <div class="less layui-btn" onclick="jian('{{ d.id }}')">-</div>
                <input class="Quantity-input" type="" name="" value={{ d.goodsNum }} disabled="disabled">
                <div class="add layui-btn" onclick="jia('{{ d.id }}')">+</div>
              </div>
            </li>
            <li class="th th-sum">
              <span class="sum">{{ d.price*d.goodsNum }}</span>
            </li>
            <li class="th th-op">
              <span onclick="del('{{ d.id }}')">删除</span>
            </li>
          </ul>
      </script> 
</body>
</html>