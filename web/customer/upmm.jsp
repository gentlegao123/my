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
<legend>客户信息-修改密码</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" lay-filter="form" >
<div class="layui-form-item">
<label class="layui-form-label">账号：</label>
<div class="layui-inline">
<input type="text" name="customerCode" class="layui-input" readonly />
</div>
</div>


<div class="layui-form-item">
<label class="layui-form-label">密码：</label>
<div class="layui-inline">
<input type="password" name="customerPass" class="layui-input" />
</div>
</div>

		<div class="layui-input-block">
		<input type="button" class="layui-btn" onclick="up2()" value="确定" /> 
		<input type="button" class="layui-btn" onclick="closeThis(1000)" value="取消" />
		
		</div>
	</form>
	</fieldset>
	<script>
form.render();
var id ="<%= request.getParameter("id") %>";
up1(id);
function up1 (id){
	ajax('/mall/customerController/sel1.do',{id:id},'json',function (data){
		console.log(data);
		form.val('form',data);
	})	
}
function up2 (){
	console.log("保存");
ajax('/mall/customerController/up2.do',$("#form").serialize(),'json',function (data){
	if(data==1){layer.msg("修改成功!")}
	else{layer.msg("修改失败!")}
	closeThis(1000);
})
}
</script>

</body>
</html>