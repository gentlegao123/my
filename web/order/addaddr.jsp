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
		<input type="button" class="layui-btn" onclick="add()" value="确定" /> 
		<input type="button" class="layui-btn" id="quxiao" value="取消" />
		
		</div>
	</form>
	</fieldset>
	<script>
	form.render();
 	//对描述的分类，描述变化，父级名称也变化
	form.on('select(describe)', function(data){
		describe = data.value;
		if(describe == 1){
			$("#san").html("");
			$("select[id='parentCode']").attr("name","parentCode")
			$("select[name='parentCode']").html("<option value='00'>地址</option>");		
			form.render();
		}else{ cha1(data.value); }});  	
	function cha1(value){
		ajax('/mall/goodsSortController/refresh2.do',{parentCode:"00"},'json',function (data){
			console.log(data);
			 var html="";
				$.each(data,function(i,dom){
					html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"					
				}) 
				$('#parentCode').html(html)
				form.render();
		})
		
		if(value=='3'){			
			 var html2="<select name='san1'  class='layui-input' id='san1'>"+
			 "<option value=''></option></select>"
			$('#san').html(html2);				
			form.on("select(san)",function(data){
				var v = data.value
				ajax('/mall/goodsSortController/refresh2.do',{"parentCode":v},'json',function (data){				
					 var htm3="";
						$.each(data,function(i,dom){
							htm3+="<option value="+dom.sortCode+">"+dom.sortName+"</option>"}) 
						$('#san1').html(htm3)
						$("select[id='san1']").attr("name","parentCode")
						form.render();
				})				
			})			
		}
		else if(value=="2"){$("select[id='parentCode']").attr("name","parentCode");$("#san").html("");}
	}
function add (){
	console.log("添加商品种类");
ajax('/mall/goodsSortController/insert.do',$("#form").serialize(),'json',function (data){
	if(data==1){layer.msg("添加成功!")}
	else{layer.msg("该类编号已存在!")}
	closeThis(1000);
})
}
</script>

</body>
</html>