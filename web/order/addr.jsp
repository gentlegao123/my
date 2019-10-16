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
		<legend>商品分类-查询条件</legend>
		<form class="layui-form" onsubmit="return false" id="form"  >
			<div class="layui-form-item">
				<label class="layui-form-label">分类编号：</label>
				<div class="layui-inline">
					<input type="text" name="sortCode" id="sortCode" class="layui-input" />
				</div>

				<label>分类名：</label>
				<div class="layui-inline">
					<input type="text" name="sortName" id="sortName"
						class="layui-input" />
				</div>
				</div>
				<div class="layui-form-item">
				<label class="layui-form-label">分类描述：</label>
				<div class="layui-inline">
					<input type="text" name="sortDescr" id="sortDescr" class="layui-input" />
				</div>

				<label>上级编号：</label>
				<div class="layui-inline">
					<input type="text" name="parentCode" id="parentCode"
						class="layui-input" />
				</div>
				
				</div>
				
				<div class="layui-form-item">	
			<button class="layui-btn" name='sel' id="sel" onclick ="selpage()">查询</button>
				<button class="layui-btn" onclick="add()" id="tian">添加</button>
		
				<input type="reset" value="重置" class="layui-btn" /> 
				
				 <input type="hidden" name="pageIndex" value="1" /> 
				 <input type="hidden" name="pageLimit" value="10" />
			</div>
		</form>
	</fieldset>
	<table class="layui-table">
		<colgroup>
			<col width="100px">
			<col width="100px">
			<col width="100px">
			<col width="100px">
			<col width="100px">
			<col width="100px">
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>地址编号</th>
				<th>地址名</th>
				<th>分类描述</th>
				<th>上级分类号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody">

		</tbody>




	</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script>
	form.render();
//刷新
refresh();
	function refresh(){ 
		console.log("刷新");
		  ajax('/mall/goodsSortController/refresh2.do',{},'json',function (data){
			  var html="";
				$.each(data,function(i,dom){
				
				html+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+dom.sortCode+"</td>"+
				"<td>"+dom.sortName+"</td>"+
				"<td>"+dom.sortDescr+"</td>"+
				"<td>"+dom.parentCode+"</td>"+
				"<td><button class='layui-btn layui-btn-danger' onclick='del(\""+dom.sortCode+"\")' ><i class='layui-icon'>&#xe640;</i></button>"+
				"<button class='layui-btn' onclick='up1(\""+dom.sortCode+"\")'>修改</button></td></tr>"})
				$("#tbody").html(html)			  
		  })	
	};
	
//添加
		function add(){
		    openLayer('addaddr.jsp',refresh);
		} 
//删除
		function del(code){
	layer.confirm("是否删除",{
		title:"提示",
		icon:3,
		yes:function(){  //不能传参数
			ajax("/mall/goodsSortController/delete.do",{"sortCode":code},"json",function(data){
				console.log(data)
				if(data==1){layer.msg("删除成功");refresh();}
				else if(data==2){layer.msg("不允许删除")}
				else{layer.msg("删除失败")}
			})		
		}		
	})	
}
//修改			
function up1(sortCode){
	openLayer('upaddr.jsp?sortCode='+sortCode,refresh);	
}
	
//查询_分页
 function selpage(){
	ajax("/mall/goodsSortController/selpageP.do",$("#form").serialize(),"json",function(data){
	    var curr = $("input[name='pageIndex']").val();
	    var limit = $("input[name='pageLimit']").val();	
	    setPageInfo('pageInfoUser',data.count,curr,limit
	    		,function(obj, first){
	        $("input[name='pageIndex']").val(obj.curr);
	        $("input[name='pageLimit']").val(obj.limit);
	        if(!first){$("button[name='sel']").click();
	        }//首次不执行
	    })
	   	  var html="";
				$.each(data.list,function(i,dom){		
				html+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+dom.sortCode+"</td>"+
				"<td>"+dom.sortName+"</td>"+
				"<td>"+dom.sortDescr+"</td>"+
				"<td>"+dom.parentCode+"</td>"+
				"<td><button class='layui-btn layui-btn-danger' onclick='del(\""+dom.sortCode+"\")' ><i class='layui-icon'>&#xe640;</i></button>"+
				"<button class='layui-btn' onclick='up1(\""+dom.sortCode+"\")'>修改</button></td></tr>"})
				$("#tbody").html(html)			
	})
} 
		
		
	</script>
</body>
</html>