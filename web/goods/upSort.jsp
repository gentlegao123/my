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
<legend>商品分类信息-修改</legend>
<form  onsubmit="return false" method="get" class="layui-form" id="form" lay-filter="form" >
<div class="layui-form-item">
<label class="layui-form-label">分类编号：</label>
<div class="layui-inline">
<input type="text" name="sortCode" class="layui-input"  />
</div>
</div>


<div class="layui-form-item">
<label class="layui-form-label">分类名：</label>
<div class="layui-inline">
<input type="text" name="sortName" class="layui-input" />
</div>
</div>

<div class="layui-form-item">
					<label class="layui-form-label">分类描述：</label>
					<div class="layui-inline">
						<select name="sortDescr" lay-filter="describe" class="layui-input" id="sortDescr">
							<option value="1">一级分类</option>
							<option value="2">二级分类</option>
						</select>
					</div>
				</div>	

<div class="layui-form-item">
<label class="layui-form-label">上级分类：</label>
<div class="layui-inline">
<select name="parentCode" id="parentCode">

</select>
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
 	//对描述的分类，描述变化，父级名称也变化
	form.on('select(describe)', function(data){
		describe = data.value;
		if(describe ==1){
			$("select[name='sortDescr']").html("<option value='0'>分类</option>");
			form.render();
		}else{
			ajax('/mall/goodsSortController/refresh.do',{parentCode:"0"},'json',function (data){
			
				 var html="";
					$.each(data,function(i,dom){
						html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"					
					}) 
					$('#parentCode').html(html)
					form.render();
			})	
			
		}
	});  




var sortCode ="<%= request.getParameter("sortCode") %>";
	ajax('/mall/goodsSortController/sel1.do',{'sortCode':sortCode},'json',function (data){	
		opt(data);
		
	})	
	function opt(data){
		if(data.parentCode==0){
			$("select[name='parentCode']").html("<option value='0'>分类</option>");
			form.render();
			val(data); 
			
		}else{
			ajax('/mall/goodsSortController/refresh.do',{parentCode:"0"},'json',function (msg){			
				 var html="";
					$.each(msg,function(i,dom){
						html+="<option value='"+dom.sortCode+"'>"+dom.sortName+"</option>"
					}) 
					$('#parentCode').html(html)
					form.render();
		val(data);
			})				
		}
	}
	
	function val(data){
		console.log(data.sortCode)
	     form.val('form',{
			"sortCode":data.sortCode,
			"sortName":data.sortName,
			"sortDescr":data.sortDescr,
			"parentCode":data.parentCode		
		});  
		
	}

function up2 (){
	console.log("保存");
ajax('/mall/goodsSortController/up2.do',$("#form").serialize(),'json',function (data){
	if(data==1){layer.msg("修改成功!")}
	else{layer.msg("修改失败!")}
	closeThis(1000);
})
}
</script>

</body>
</html>