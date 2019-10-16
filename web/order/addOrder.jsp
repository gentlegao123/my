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
<form  onsubmit="return false" method="get" class="layui-form" id="form" >
<div class="layui-form-item">
<label class="layui-form-label">订单编号：</label>
<div class="layui-inline">
<input type="text" name="orderCode" class="layui-input" />
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">用户账号：</label>
<div class="layui-inline">
<select name="customerCode" lay-filter="customerCode" id="customerCode">
<option value="">请选择</option>

</select>

</div>
</div>
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
		<input type="button" class="layui-btn" onclick="add()" value="确定" /> 
		<input type="button" class="layui-btn" id="quxiao" value="取消" />
		
		</div>
	</form>
	</fieldset>
	<script>
	
form.render();
	laydate.render({
		elem:"#time",
		type:"date",
		trigger: 'click'
	});
	selCode();
	function selCode (){
		  ajax('/mall/customerController/selectAll.do',{},'json',function (data){
			  var html="";			  
				$.each(data,function(i,dom){
					if(dom.identify!=null){}
					else{html+="<option value='"+dom.customerCode+"'>"+dom.customerName+"</option>";}											
				})
				$("#customerCode").append(html);
				form.render();
		  })			
	}
	form.on("select(customerCode)",function(data){
		var customerCode =data.value;
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
	})
	
	
	
	
	
	function add (){
		console.log("添加订单");
	ajax('/mall/orderController/insert.do',$("#form").serialize(),'json',function (data){
		if(data==1){layer.msg("添加成功!")}
		else{layer.msg("该订单号已存在!")}
		closeThis(1000);
	})
	}
	


</script>

</body>
</html>