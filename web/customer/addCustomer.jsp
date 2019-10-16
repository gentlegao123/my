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
<legend>客户信息-添加</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" >
<div class="layui-form-item">
<label class="layui-form-label">账号：</label>
<div class="layui-inline">
<input type="text" name="customerCode" class="layui-input" />
</div>
</div>


<div class="layui-form-item">
<label class="layui-form-label">姓名：</label>
<div class="layui-inline">
<input type="text" name="customerName" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">密码：</label>
<div class="layui-inline">
<input type="text" name="customerPass" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">管理员：</label>
<div class="layui-inline">
<input type="checkbox" name="identify" lay-skin="switch" lay-text="ON|OFF" value="gg"/>
</div>
</div>
<!-- 		<div class="layui-form-item">
			<label class="layui-form-label">人数：</label>
			<div class="layui-inline">
				<input type="text" name="departmentnum" class="layui-input" />
			</div>
		</div> -->
		
	      <div class="layui-form-item">
             <label class="layui-form-label">  <img src="/mall/yzmController/yzm.do?" onclick="this.src='/mall/yzmController/yzm.do?'+Math.random();" align="absmiddle"/></label> 
                <div class="layui-input-inline" >       
	       <input type="text" name="code" class="layui-input" placeholder="请输入验证码" />
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
function add (){
	console.log("添加账号");
ajax('/mall/customerController/reg.do',$("#form").serialize(),'json',function (data){
	if(data==1){layer.msg("添加成功!")}
	else{layer.msg("该账号已存在!")}
	closeThis(1000);
})
}
</script>

</body>
</html>