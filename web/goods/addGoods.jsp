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
<legend>商品信息-添加</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" >
<div class="layui-form-item">
<label class="layui-form-label">商品编号：</label>
<div class="layui-inline">
<input type="text" name="goodsCode" class="layui-input" />
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">商品名：</label>
<div class="layui-inline">
<input type="text" name="goodsName" class="layui-input" />
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">单价：</label>
<div class="layui-inline">
<input type="text" name="price" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">库存：</label>
<div class="layui-inline">
<input type="text" name="goodsNum" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">描述：</label>
<div class="layui-inline">
<input type="text" name="descr" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
<label class="layui-form-label">是否上架：</label>
<div class="layui-inline">
<input type="checkbox" name="status" lay-skin="switch" lay-text="ON|OFF" value="online"/>
</div>
</div>

<div class="layui-form-item">
			<label class="layui-form-label">所属分类：</label>
			<div class="layui-inline">
				<select name="sortCodej" id ="sortCode"  lay-filter="sort">
				<option value=""></option>			
				</select>				
			</div>		
		</div>
		
<div class="layui-form-item">
			<label class="layui-form-label">再分类：</label>
			<div class="layui-inline">
				<select name="sortCode" id ="sortCode2" lay-verify="required" >
				<option value=""></option>					
				</select>				
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

$(function(){
    ajax('/mall/goodsSortController/refresh.do',{parentCode:"0"},'json',function (data){
    	
   	 var html="";
   		$.each(data,function(i,dom){
   			html+="<option value="+dom.sortCode+">"+dom.sortName+"</option>"	
   		}) 
   		$('#sortCode').append(html)
   		form.render();})		
	
})


		form.on('select(sort)', function(data){
			ajax('/mall/goodsSortController/refresh.do',{"parentCode":data.value},'json',function (data){
				console.log(data);
				 var html="";
					$.each(data,function(i,dom){
						html+="<option value="+dom.sortCode+">"+dom.sortName+"</option>"					
					}) 
					$('#sortCode2').html(html)
					form.render();
			})				
		})
		
		
		
function add (){
	console.log("添加商品");

ajax('/mall/goodsController/insert.do',$("#form").serialize(),'json',function (data){
	if(data==1){layer.msg("添加成功!")}
	else{layer.msg("该商品编号已存在!")}
	closeThis(1000);
})
}
</script>

</body>
</html>