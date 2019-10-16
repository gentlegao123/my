<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mall/layui/css/layui.css" rel="stylesheet" type="text/css" />
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
<fieldset class="layui-elem-field layui-field-title" style="margin: 20px; padding: 20px" >
<legend>订单信息-添加</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" lay-filter="form" >
<div class="layui-form-item">
<label class="layui-form-label">订单编号：</label>
<div class="layui-inline">
<input type="text" name="orderCode" class="layui-input" />
</div>
</div>
<!-- <div class="layui-form-item">
<label class="layui-form-label">用户账号：</label>
<div class="layui-inline">
<select name="customerCode" lay-filter="customerCode" id="customerCode">
<option value="">请选择</option>

</select>

</div>
</div> -->
<div class="layui-form-item">
<label class="layui-form-label">时间：</label>
<div class="layui-inline">
<input type="text" name="time" id="time" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">状态：</label>
<div class="layui-inline">
<select name="status">
<option value="">请选择</option>
<option value="待付款">待付款</option>
<option value="待发货">待发货</option>
<option value="待收货">待收货</option>
<option value="已签收">已签收</option>
<option value="退款/退货中">退款/退货中</option>
</select>
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">地址：</label>
<div class="layui-inline">
<select name="addressCode" id="addressCode"></select>
</div>
</div>	
		
		<input type="hidden" name="action" value="add"></input>
		<div class="layui-input-block">
		<input type="button" class="layui-btn" onclick="up2()" value="确定" /> 
		<input type="button" class="layui-btn" id="quxiao" value="取消" />
		
		</div>
	</form>
	</fieldset>
	<script>
var orderCode=<%= request.getParameter("orderCode")%>
var customerCode=<%= request.getParameter("customerCode")%>
console.log(orderCode)
form.render();

	laydate.render({
		elem:"#time",
		type:"date",
		trigger: 'click'
	});
	seladd();
	
	function seladd(){
		  ajax('/mall/addressController/selectAll.do',{"customerCode":customerCode},'json',function (data){
			  var ad="";
			  var html="";
			  console.log(data+"00")
				$.each(data,function(i,dom){
					ad=dom.nameProvince+" "+dom.nameCity+" "+dom.nameRegion+" "+dom.other
					html+="<option value='"+ad+"'>"+ad+"</option>";				 
				})
				console.log(ad+"123");
				$("#addressCode").html(html);
				form.render();
				up1();
		  })
	}
	
	function up1(){
		console.log("修改订单");
	ajax('/mall/orderController/up1.do',{'orderCode':orderCode},'json',function (data){
	
	form.val("form",{
		"orderCode":data.orderCode,
		"customerCode":data.customerCode,
		"time":data.time,
		"status":data.status,
		"addressCode":data.addressCode		
	});
	form.render();
	})
	}
	
	function up2 (){
		console.log("保存订单信息");
	ajax('/mall/orderController/up2.do',$("#form").serialize(),'json',function (data){
		if(data==1){layer.msg("修改成功!")}
		else{layer.msg("修改失败!")}
		closeThis(1000);
	
	})
	}

</script>

</body>
</html>