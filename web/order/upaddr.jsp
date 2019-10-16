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
<form  onsubmit="return false" method="get" class="layui-form" id="form" >
<div class="layui-form-item">
<label class="layui-form-label">地址编号：</label>
<div class="layui-inline">
<input type="text" name="sortCode" class="layui-input" />
</div>
</div>


<div class="layui-form-item">
<label class="layui-form-label">地址名：</label>
<div class="layui-inline">
<input type="text" name="sortName" class="layui-input" />
</div>
</div>
	
		<div class="layui-form-item">
					<label class="layui-form-label">分类描述：</label>
					<div class="layui-inline">
						<select name="sortDescr" lay-filter="describe" class="layui-input">
						<option value=""></option>
						<option value=""></option>
							<option value="1">省份</option>
							<option value="2">市</option>
							<option value="3">县/区</option>
						</select>
					</div>
				</div>					

<div class="layui-form-item">
<label class="layui-form-label">上级分类：</label>
<div class="layui-inline">
<select  id="parentCode" lay-filter="san" >
<option value=""></option>
</select>
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label"></label>
<div class="layui-inline" id="san">

</div>
</div>
		<div class="layui-input-block">
		<input type="button" class="layui-btn" onclick="up1()" value="确定" /> 
		<input type="button" class="layui-btn" id="quxiao" value="取消" />
		
		</div>
	</form>
	</fieldset>
	<script>
	form.render();
  var sortCode <%= request.getParameter("sortCode")%>
function up1 (){
	console.log("修改种类");
ajax('/mall/goodsSortController/select.do',{sortCode:sortCode},'json',function (data){
form.val("data");
form.render()
})
}
</script>

</body>
</html>