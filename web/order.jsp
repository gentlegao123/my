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
<link rel="stylesheet" type="text/css" href="/mall/ordersList_fies/checkout.min.css">
 <link rel="stylesheet" type="text/css" href="/mall/res/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="/mall/res/static/css/main.css">
  <script type="text/javascript" src="/mall/res/layui/layui.all.js"></script>
  <script type="text/javascript" src="/mall/web/common.js"></script>
  <script type="text/javascript" src="/mall/web/jquery-3.4.1.min.js"></script>
</head>
<body>
  <script>
var layer=layui.layer;
var form = layui.form;
var goodsCode="<%= request.getParameter("goodsCodes")%>"
var length =goodsCode.split(",").length-1;
  </script>
<!-- .site-mini-header END -->
<script type="text/javascript">
var checkoutConfig = {
    addressMatch:'common',
    addressMatchVarName: new Function('return ' + 'data'),
    hasPresales:false,
    hasBigTv:false,
    hasAir:false,
    hasScales:false,
    hasWater:false,
    hasWater2:false,
    hasMobile:false,
    hasEboiler:false,
    hasEvent:false,
    hasGiftcard:false,
    totalPrice:515,
    needPayAmount:515,
    preDeductible:0,
    postage:0,
    postFree:true,
    bcPrice:'150',
    activityDiscountMoney:0.00,//活动优惠
    showCouponBox:0,
    showCaptcha:'0',
    invoice:[{"type":"electron","value":4,"desc":"\u7535\u5b50\u53d1\u7968","checked":true},{"type":"personal","value":1,"desc":"\u7eb8\u8d28\u53d1\u7968","checked":false}],
    quickOrder: '',
    hasBigPro: false,
    onlinePayTips: '支持微信支付、支付宝、银联、财付通、小米钱包等',
    subsidyPrice: 0,
    redPacket: {"use_red_packet":true,"discount_money":"0","available_amount":"0"},
    showRedPacket: false,
};

    
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
</div>
<div class="page-main">
    <!-- 春节发货公告 -->
        <!-- 春节发货公告 END-->
    <div class="container">
        <div class="checkout-box">
<form class="layui-form">
 <div class="layui-form-item">
<label class="layui-form-label"><h2>地址：</h2></label>
<div class="layui-inline">
<select name="addressCode" id="addressCode"></select>
</div>
</div>	
</form>






            <div class="section section-goods">
                <div class="section-header clearfix">
                    <h3 class="title">商品及优惠券</h3>
                </div>
                <div class="section-body" id="g">
                
                
                
        
                </div>
                
            </div>

            
            <div class="section section-options section-payment clearfix hide">
                <div class="section-header">
                    <h3 class="title">支付方式</h3>
                </div>
                <div class="section-body clearfix">
                    <ul class="J_optionList options ">
				<li data-type="pay" class="J_option selected" data-value="1">
                            在线支付                            <span>
                            （支持微信支付、支付宝、银联、财付通、小米钱包等）                            </span>
                        </li>
                                            </ul>
                </div>
            </div>

            <div class="section section-options section-shipment clearfix">
                <div class="section-header">
                    <h3 class="title">配送方式</h3>
                </div>
                <div class="section-body clearfix">
                    <ul class="clearfix J_optionList options ">
                                                <li data-type="shipment" class="J_option selected" data-amount="0" data-value="2">
                            包邮                                                    </li>
                                            </ul>

                    <div class="service-self-tip" id="J_serviceSelfTip" style="display: none;"></div>
                </div>
            </div>

            <div class="section section-options section-time clearfix hide" style="display: block;">
                <div class="section-header">
                    <h3 class="title">配送时间</h3>
                </div>
                <div class="section-body clearfix">
                    <ul class="J_optionList options options-list clearfix">
                        <!-- besttime start -->
                                                <li data-type="time" class="J_option selected" data-value="1">
                            不限送货时间：<span>周一至周日</span>                        </li>
                                                <li data-type="time" class="J_option " data-value="2">
                            工作日送货：<span>周一至周五</span>                        </li>
                                                <li data-type="time" class="J_option " data-value="3">
                            双休日、假日送货：<span>周六至周日</span>                        </li>
                                                <!-- besttime end -->
                    </ul>
                </div>
            </div>

            <div class="section section-options section-invoice clearfix">
                <div class="section-header">
                    <h3 class="title">发票</h3>
                </div>
                <div class="section-body clearfix">
                    <div class="invoice-result">
                        <span id="J_invoiceDesc">电子发票</span>
                        <span id="J_invoiceTitle">个人</span>
                        <span>商品明细</span>
                        <a href="https://order.mi.com/buy/checkout?r=13094.1570166757#J_modalInvoiceInfo" data-toggle="modal" id="J_invoiceModify" data-log_code="bid=3515489.4&amp;bpm=25.83.3513652.1" data-stat-id="67efe13c31710c36" onclick="">修改 &gt;</a>
                    </div>
                </div>
                
            </div>

            <div class="section section-count clearfix">
                                <div class="count-actions ">
                    <!-- 优惠券 -->
                    <a class="coupon-trigger" id="J_useCoupon" data-log_code="bid=3515489.5&amp;bpm=25.83.3514683.1" data-stat-id="315062bc52f86693" onclick="">
                        <i class="iconfont icon-plus"></i>使用优惠券
                    </a>

                    <!-- 购物卡 -->
                    <a class="ecard-trigger" id="J_useEcard" data-type="normal" data-log_code="bid=3515489.6&amp;bpm=25.83.3514684.1" data-stat-id="8009e439078dc326" onclick=""><i class="iconfont icon-plus"></i>使用小米礼品卡</a>
                    <!-- 现金券 -->
                    <a class="ecard-trigger hide" id="J_useRecycle" data-type="recycle" data-log_code="bid=3515489.7&amp;bpm=25.83.3514685.1" data-stat-id="9503576df834818e" onclick=""><i class="iconfont icon-plus"></i>使用现金券</a>
                    <div class="ecard-result hide" id="J_recycleResult">
                        <i class="iconfont icon-selected"></i> 已使用现金券 <span id="J_recycleVal"></span>
                        <a href="javascript:void(0);" id="J_recycleModify" data-stat-id="47cd16f8e5331743" onclick="">［修改］</a>
                    </div>
                    <!-- 红包 -->
                    
                    <div class="ecard-box hide" id="J_ecardBox">
                        <ul class="clearfix tab-switch J_tabSwitch">
                            <li>已绑定的礼品卡</li>
                            <li>输入礼品卡以绑定</li>
                        </ul>
                    </div>
                </div>
                

                                <div class="money-box" id="J_moneyBox">
                    <ul>
                        <li class="clearfix">
                            <label>商品件数：</label>
                            <span class="val" id="jianshu"></span>
                        </li>
                                                <li class="clearfix">
                            <label>商品总价：</label>
                            <span class="val" id=zongjia></span>
                        </li>
                        <li class="clearfix">
                            <label>活动优惠：</label>
                            <span class="val">-0元</span>
                        </li>
                        <li class="clearfix">
                            <label>优惠券抵扣：</label>
                            <span class="val"><i id="J_couponVal">-0</i>元</span>
                        </li>
                                                                        <li class="clearfix">
                            <label>运费：</label>
                            <span class="val"><i data-id="J_postageVal">0</i>元</span>
                        </li>
                        <li class="clearfix total-price">
                            <label>应付总额：</label>
                            <span class="val"><em id="ying"></em>元</span>
                        </li>
                    </ul>
                </div>
                            </div>

            <div class="section-bar clearfix">
                <div class="fl">
                    <div class="seleced-address hide" id="J_confirmAddress">
                    </div>
                    <div class="big-pro-tip hide J_confirmBigProTip"></div>
                </div>
                <div class="fr">
                    <a href="javascript:void(0);" class="btn btn-primary" id="J_checkoutToPay" data-log_code="bid=3515489.8&amp;bpm=25.83.3513216.1&amp;next=26.82" data-stat-id="9dc0c7cf32a1c0ca" onclick="tijiao()">提交订单</a>
                    <a href="/mall/web/shopCart.jsp" class="btn  btn-return" data-stat-id="d5777c2afc47dad1" onclick="">返回购物车</a>
                     </div>
            </div>
        </div>
    </div>
</div>

<!-- 大家点缺货提示 -->
<div class="big-pro-tip-pop hide" id="J_popBigProTip"></div>

<!-- 禮品卡提示 S-->
<div class="modal fade modal-hide modal-lipin" id="J_lipinTip">
    <div class="modal-header">
        <h3 class="title">温馨提示</h3>
    </div>
    <div class="modal-body">
        <p>
            为保障您的利益与安全，下单后礼品卡将会被使用，<br>
            且订单信息将不可修改。请确认收货信息：
        </p>
        <ul>
            <li class="clearfix">
                <strong>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</strong>
                <span id="J_lipinUserName"></span>
            </li>
            <li class="clearfix">
                <strong>联系电话：</strong>
                <span id="J_lipinUserPhone"></span>
            </li>
            <li class="clearfix">
                <strong>收货地址：</strong>
                <span id="J_lipinUserAddress"></span>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="javascript:void(0);" class="btn btn-primary" id="J_lipinSubmit" data-stat-id="7479e4d461606309" onclick="">确认下单</a>
        <a href="javascript:void(0);" class="btn btn-gray" data-dismiss="modal" data-stat-id="6e7ff29eb418a43b" onclick="">返回修改</a>
    </div>
</div>

<div class="modal fade modal-hide fade modal-alert" id="J_modalAlert">
    <div class="modal-bd">
        <div class="text">
            <h3 id="J_alertMsg"></h3>
        </div>
        <div class="actions">
            <button class="btn btn-primary" data-dismiss="modal">确定</button>
        </div>
        <a class="close" data-dismiss="modal" href="javascript: void(0);" data-stat-id="86faab7930e5a48b" onclick=""><i class="iconfont"></i></a>
    </div>
</div>

<div class="address-top-bar" id="J_addressTopBar">
    <div class="container">
        <a href="javascript:void(0);" class="btn btn-primary" id="J_addressTopBarBtn" data-stat-id="336acd257ed12157" onclick="">选择该收货地址</a>
        <div class="content" id="J_addressTopCon">
            <span class="uname">名字</span><span class="utel">名字</span>
        </div>
    </div>
</div>

<script>

form.render();
//查出收货地址
var customerCode="${code}";
ajax('/mall/addressController/selectAll.do',{customerCode:customerCode},'json',function (data){
	  var ad="";
	  var html="";

		$.each(data,function(i,dom){
			ad=dom.nameProvince+" "+dom.nameCity+" "+dom.nameRegion+" "+dom.other
			html+="<option value='"+ad+"'>"+ad+"</option>";				 
		})
		console.log(ad+"123");
		$("#addressCode").html(html);
		form.render();
})

//查出商品信息
var p=0
 var j=0
 $.each(goodsCode.split(","),function(i,ele){
if(ele!=""){

	show(ele);
	console.log(p+"p")
	}	 
 })	 
//展示商品
	function show(goodsCode) {	
		ajax('/mall/shopcartController/refresh.do', {goodsCode : goodsCode}, 'json', function(data) {
			var h = ""			
			$.each(data, function(i, dom) {				
				p=dom.price*dom.goodsNum+p
				j=dom.goodsNum+j
				$("#zongjia").html(p+"元");
				$("#ying").html(p);	
				$("#jianshu").html(j+"件")
				laytpl($('#demo').html()).render(dom, function(html) {
					h = h + html
				})
				$("#g").append(h)
			})		
		})
	}
//	提交订单
	var orderCode=new Date().getTime();	
	function tijiao(){
		
		var dat={
	    addressCode:$("#addressCode").val(),
		status:"待付款",
		customerCode:customerCode,
	    orderCode:orderCode
		}
		ajax('/mall/orderController/insert2.do',dat,'json', function(data) {
			
		})
		 $.each(goodsCode.split(","),function(i,ele){
			 if(ele!=""){			 	
			 	addOrderGoods(ele);	
			 	del(ele);
			 	}	 
			  })	
window.location.href="/mall/web/tjorder.jsp?orderCode="+orderCode			  
			  
	}
//添加订单的商品
function addOrderGoods(goodsCode){
	ajax('/mall/shopcartController/refresh.do', {goodsCode : goodsCode}, 'json', function(data) {
		var h = ""			
		$.each(data, function(i, dom) {				
			var p=dom.price*dom.goodsNum
			var j=dom.goodsNum
			
			var dat={
					orderCode:orderCode,
					goodsCode:goodsCode,
					num:j,
					price:p}
			ajax('/mall/orderGoodsController/insert.do',dat,'json',function(data) {
			
			})
		})		
	})	
}	
//删除已结算的
function del(goodsCode){
	
	var dat={"goodsCode":goodsCode,"customerCode":customerCode}
	console.log(dat)
	ajax("/mall/shopcartController/delete.do",dat,"json",function(data){		
		if(data==1){layer.msg("删除成功");}
		else{layer.msg("删除失败")}
	})	
	
}



</script>

<script type="text/html" id="demo">

<ul class="goods-list" id="J_goodsList">
                                <li class="clearfix">
            <div class="col col-img">
                <img src="/image/{{ d.imageName }}" width="30" height="30"> 
            </div>
            <div class="col col-name">

            <a href="https://item.mi.com/1184800014.html" target="_blank" data-stat-id="4833103358181f02" onclick="">
                       {{ d.goodsDescr }}<em class="label">秒杀</em></a>
                
            </div>

             <div class="col col-price">
                   {{ d.price }}元 x {{ d.goodsNum }}                                    </div>
                <div class="col col-status">&nbsp;</div>
                <div class="col col-total">
                   {{ d.price*d.goodsNum }}元
                </div>
            
        </li>
</ul>

</script>

</body>
</html>