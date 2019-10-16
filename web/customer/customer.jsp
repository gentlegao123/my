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
				<label class="layui-form-label">用户账号：</label>
				<div class="layui-inline">
					<input type="text" name="customerCode" id="customerCode" class="layui-input" />
				</div>

				<label>用户名：</label>
				<div class="layui-inline">
					<input type="text" name="customerName" id="customerName"
						class="layui-input" />
				</div>
				<button class="layui-btn" name='sel' id="sel" onclick ="selpage()">查询</button>
				<button class="layui-btn" onclick="add()" id="tian">添加</button>
				
				<input type="reset" value="重置" class="layui-btn" /> 
				<input type="hidden" name="action" value="select"></input>
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
		
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>用户编号</th>
				<th>用户名</th>
				<th>身份</th>
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
//搜索刷新
	function refresh(){
		console.log("刷新");
		  ajax('/mall/customerController/refresh.do',{},'json',function (data){
			  var html="";
			  
				$.each(data,function(i,dom){
				var status=dom.identify==null?"用户":"管理员"
					
				html+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+dom.customerCode+"</td>"+
				"<td>"+dom.customerName+"</td>"+
				"<td>"+status+"</td>"+
				"<td><button type='button' class='layui-btn  layui-btn-danger' onclick='d(\""+dom.customerCode+"\")'><i class='layui-icon'>&#xe640;</i></button>"+
				"<button class='layui-btn' onclick='up1("+dom.id+")'>修改</button>"+			
				"<button class='layui-btn' onclick='upmm("+dom.id+")'>重置密码</button></td></tr>"				
				})
				$("#tbody").html(html)			  
		  })	
	};
	
//添加
		function add(){
		    openLayer('addCustomer.jsp',refresh);
		} 
//删除
function d(code){
layer.confirm("是否删除",{
	title:"提示",
	icon:3,
	yes:function(){
		del(code);
	}
	
})}
function del(code){
	console.log("删除账号");
ajax('/mall/customerController/delect.do',{customerCode:code},'json',function (data){
	if(data==1){layer.msg("删除成功!")}
	else{layer.msg("删除失败!")}
	closeThis(1000);
	refresh();
})
}	
//修改
function up1(id){
	openLayer('upCustomer.jsp?id='+id,refresh);	
}
//查询_分页
function selpage(){
	ajax('/mall/customerController/selpage.do',$('#form').serialize(),'json',function(data){
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
				var status=dom.identify==null?"用户":"管理员"	
						
				html+="<tr><td>"+(i+1+(curr-1)*limit)+"</td>"+
				"<td>"+dom.customerCode+"</td>"+
				"<td>"+dom.customerName+"</td>"+
				"<td>"+status+"</td>"+
				"<td><button type='button' class='layui-btn  layui-btn-danger' onclick='del(\""+dom.customerCode+"\")'><i class='layui-icon'>&#xe640;</i></button>"+
				"<button class='layui-btn' onclick='up1("+dom.id+")'>修改</button>"+
				"<button class='layui-btn' onclick='upmm("+dom.id+")'>重置密码</button></td></tr>"		
				})
				$("#tbody").html(html)			
	})
}
function upmm(id){
	openLayer('upmm.jsp?id='+id,refresh);	
	
	
}


		
	</script>
</body>
</html>