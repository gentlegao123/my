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
<fieldset class="layui-elem-field layui-field-title"
		style="margin: 20px; padding: 20px">
		<legend>商品信息-查询条件</legend>
		<form class="layui-form" onsubmit="return false" id="form" >

			<div class="layui-form-item">
				<label class="layui-form-label">商品编号：</label>
				<div class="layui-inline">
					<input type="text" name="goodsCode" id="goodsCode" class="layui-input" />
				</div>

				<label>商品名：</label>
				<div class="layui-inline">
					<input type="text" name="goodsName" id="goodsName"
						class="layui-input" />
				</div>
				</div>
				
				<div class="layui-form-item">
				<label class="layui-form-label">上级编号：</label>
				<div class="layui-inline">
					<input type="text" name="parentCode" id="parentCode" class="layui-input" />
				</div>

				<label>描述：</label>
				<div class="layui-inline">
					<input type="text" name="descr" id="descr"
						class="layui-input" />
				</div>
				</div>
				
				<div class="layui-form-item">
				<button class="layui-btn" name='sel' id="sel" onclick="selpage()">查询</button>
				<button class="layui-btn" onclick="add()" id="tian">添加</button>
		
				<input type="reset" value="重置" class="layui-btn" /> 

				 <input type="hidden" name="pageIndex" value="1" /> 
				 <input type="hidden" name="pageLimit" value="10" />
			</div>
		</form>
	</fieldset>
	<table class="layui-table">
		<colgroup>
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="70px">
			<col width="100px">
			<col width="70px">
			<col width="70px">
			<col width="200px">
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>商品编号</th>
				<th>商品名</th>
				<th>单价</th>
				<th>库存</th>
				<th>描述</th>
				<th>状态</th>
				<th>所属分类</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody">

		</tbody>




	</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script>
	form.render();
	refresh();
//刷新
	function refresh(){
		console.log("刷新");
		  ajax('/mall/goodsController/refresh.do',{},'json',function (data){
			  var html="";
				$.each(data,function(i,dom){	
					
				var zt =dom.status=="down"?"已下架":"已上架"
					
				html+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+dom.goodsCode+"</td>"+
				"<td>"+dom.goodsName+"</td>"+
				"<td>"+dom.price+"</td>"+
				"<td>"+dom.goodsNum+"</td>"+
				"<td>"+dom.descr+"</td>"+
				"<td>"+zt+"</td>"+
				"<td>"+dom.nameSort+"</td>"+
				"<td><button class='layui-btn' onclick='del(\""+dom.goodsCode+"\")' >删除</button>"+
				"<button class='layui-btn' onclick='up1(\""+dom.goodsCode+"\")'>修改</button>"+
				"<button class='layui-btn' onclick='upload(\""+dom.goodsCode+"\")'>图片维护</button></td></tr>"})
				$("#tbody").html(html)			  
		  })	
	};
	
//添加
		function add(){
		    openLayer('addGoods.jsp',refresh);
		} 
//删除
		function del(code){
	layer.confirm("是否删除",{
		title:"提示",
		icon:3,
		yes:function(){  //不能传参数
			ajax("/mall/goodsController/delete.do",{"goodsCode":code},"json",function(data){
				console.log(data)
				if(data==1){layer.msg("删除成功");refresh();}
				
				else{layer.msg("删除失败")}
			})		
		}		
	})	
}
//修改		
		function up1(code){
	openLayer('upGoods.jsp?goodsCode='+code,refresh);	
}
//查询分页
function selpage(){	
	ajax("/mall/goodsController/selpage.do",$("#form").serialize(),"json",function(data){
	    var curr = $("input[name='pageIndex']").val();
	    var limit = $("input[name='pageLimit']").val();	
	    setPageInfo('pageInfoUser',data.count,curr,limit
	    		,function(obj, first){
	        $("input[name='pageIndex']").val(obj.curr);
	        $("input[name='pageLimit']").val(obj.limit);
	        if(!first){$("button[name='sel']").click();
	        }//首次不执行
	        
	        
	  	  var html="";
			$.each(data.list,function(i,dom){	
			var zt =dom.status=="down"?"已下架":"已上架"
			html+="<tr><td>"+(i+1)+"</td>"+
			"<td>"+dom.goodsCode+"</td>"+
			"<td>"+dom.goodsName+"</td>"+
			"<td>"+dom.price+"</td>"+		
			"<td>"+dom.goodsNum+"</td>"+
			"<td>"+dom.descr+"</td>"+
			"<td>"+zt+"</td>"+
			"<td>"+dom.nameSort+"</td>"+
			"<td><button class='layui-btn layui-btn-danger' onclick='del(\""+dom.goodsCode+"\")' ><i class='layui-icon'>&#xe640;</i></button>"+
			"<button class='layui-btn' onclick='up1(\""+dom.goodsCode+"\")'>修改</button>"+
			"<button class='layui-btn' onclick='upload(\""+dom.goodsCode+"\")'>图片维护</button>"+
			"</td></tr>"})
			$("#tbody").html(html)	;
	
})
}		)}
//上传图片
function upload(goodsCode){
	    openLayer('upload.jsp?goodsCode='+goodsCode,refresh);	
}
		
		
		
		
	</script>
</body>
</html>