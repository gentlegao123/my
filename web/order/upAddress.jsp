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
<legend>地址信息-添加</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" lay-filter="form">

<div class="layui-form-item">
<label class="layui-form-label">用户账号：</label>
<div class="layui-inline">
<input type="text" name="customerCode" class="layui-input" />
</div>
</div>


<div class="layui-form-item">
<label class="layui-form-label">收件人：</label>
<div class="layui-inline">
<input type="text" name="name" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">电话：</label>
<div class="layui-inline">
<input type="text" name="tel" class="layui-input" />
</div>
</div>
	
		<div class="layui-form-item">
					<label class="layui-form-label">省：</label>
					<div class="layui-inline">
						<select name="province" id="province" lay-filter="province" class="layui-input">
                        <option value=""></option>
						</select>
					</div>
				</div>	
				
			<div class="layui-form-item">
					<label class="layui-form-label">市：</label>
					<div class="layui-inline">
						<select name="city" lay-filter="city" id="city" class="layui-input">
                        <option value=""></option>
						</select>
					</div>
				</div>
				
			<div class="layui-form-item">
					<label class="layui-form-label">区/县：</label>
					<div class="layui-inline">
						<select name="region" lay-filter="region" id="region" class="layui-input">
                        <option value=""></option>
						</select>
					</div>
				</div>		
				

<div class="layui-form-item">
<label class="layui-form-label">详细地址：</label>
<div class="layui-inline">
<input type="text" name="other" class="layui-input" />
</div>
</div>
		<div class="layui-input-block">
		<input type="button" class="layui-btn" onclick="up2()" value="确定" /> 
		<input type="button" class="layui-btn" id="quxiao" value="取消" />		
		</div>
	</form>
	</fieldset>
	<script>
	form.render();
  var id =<%= request.getParameter("id")%>
	province();
	//查出省
	function province (){
		ajax('/mall/goodsSortController/refresh2.do',{parentCode:"00"},'json',function (data){
			html="";
			$.each(data,function(i,dom){
			html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"})	
			$("#province").append(html);
			form.render();
		})	
	}
//监听省	
	form.on('select(province)', function(data){
		code = data.value;
	    ajax('/mall/goodsSortController/refresh2.do',{parentCode:code},'json',function (data){
	    	html="";
			$.each(data,function(i,dom){
			html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"})	
			$("#city").html("");
			$("#city").append(html);
			form.render();
			})						
});  
//监听市
		form.on('select(city)', function(data){
		code1 = data.value;
	    ajax('/mall/goodsSortController/refresh2.do',{parentCode:code1},'json',function (data){
	    	html="";
			$.each(data,function(i,dom){
			html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"})	
				$("#region").html("");
			$("#region").append(html);
			form.render();
			})						
});  
		up1();
function up1(){
	console.log("修改个人地址");
ajax('/mall/addressController/select.do',{id:id},'json',function (data){
	console.log(data);
form.val("form",{
	"customerCode":data.customerCode,
	"name":data.name,
	"tel":data.tel,
	"province":data.province,
	"city":data.city,
	"region":data.region,
	"other":data.other	
});
form.render();
})
}
function up2(){
	ajax('/mall/addressController/update.do?id='+id,$("#form").serialize(),'json',function (data){
		if(data==1){layer.msg("修改成功!")}
		else{layer.msg("修改失败!")}
		closeThis(1000);
	
	})
	
	
	
}
</script>

</body>
</html>