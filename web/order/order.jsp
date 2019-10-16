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
		<legend>订单信息-查询条件</legend>
		<form class="layui-form" onsubmit="return false" id="form" >
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号：</label>
				<div class="layui-inline">
					<input type="text" name="orderCode" id="orderCode" class="layui-input" />
				</div>
				<label>用户账号：</label>
				<div class="layui-inline">
					<input type="text" name="CustomerCode" id="CustomerCode"
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
			<col width="70px">
			<col width="200px">
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>订单编号</th>
				<th>用户账号</th>
				<th>时间</th>
				<th>状态</th>
				<th>地址</th>			
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
			</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script>
refresh();
//增加
	function add(){
	    openLayer('addOrder.jsp',refresh);
	} 	
//刷新
		function refresh(){
			console.log("刷新");
			  ajax('/mall/orderController/refresh.do',{},'json',function (data){
				  var html="";
					$.each(data,function(i,dom){
						
					html+="<tr><td>"+(i+1)+"</td>"+
					"<td>"+dom.orderCode+"</td>"+
					"<td>"+dom.customerCode+"</td>"+
					"<td>"+dom.time+"</td>"+
					"<td>"+dom.status+"</td>"+
					"<td>"+dom.addressCode+"</td>"+
					"<td><button class='layui-btn' onclick='del(\""+dom.orderCode+"\")' >删除</button>"+
					"<button class='layui-btn' onclick='up1(\""+dom.orderCode+"\",\""+dom.customerCode+"\")'>修改</button>"+
					"<button class='layui-btn' onclick='detail(\""+dom.orderCode+"\")'>订单信息</button>"+
					"</td></tr>"})
					$("#tbody").html(html)			  
			  })	
		};
//删除
		function del(code){
	layer.confirm("是否删除",{
		title:"提示",
		icon:3,
		yes:function(){  //不能传参数
			//删除订单
			ajax("/mall/orderController/delete.do",{"orderCode":code},"json",function(data){
				console.log(data)
				if(data==1){layer.msg("删除成功");refresh();}
				else if(data==2){layer.msg("不允许删除")}
				else{layer.msg("删除失败")}
			})	
		//删除订单的商品
			ajax("/mall/orderGoodsController/delete.do",{"orderCode":code},"json",function(data){
				console.log(data)
				if(data==1){layer.msg("删除成功");refresh();}
				else if(data==2){layer.msg("不允许删除")}
				else{layer.msg("删除失败")}
			})	
		
		
		
		}		
	})	
}
		//查询分页
		function selpage(){	
			ajax("/mall/orderController/selpage.do",$("#form").serialize(),"json",function(data){
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
						html+="<tr><td>"+(i+1)+"</td>"+
						"<td>"+dom.orderCode+"</td>"+
						"<td>"+dom.customerCode+"</td>"+
						"<td>"+dom.time+"</td>"+
						"<td>"+dom.status+"</td>"+
						"<td>"+dom.addressCode+"</td>"+
						"<td><button class='layui-btn' onclick='del(\""+dom.orderCode+"\")' >删除</button>"+
						"<button class='layui-btn' onclick='up1(\""+dom.orderCode+"\")'>修改</button>"+
						"<button class='layui-btn' onclick='detail(\""+dom.orderCode+"\")'>订单信息</button>"+
						"</td></tr>"})
						$("#tbody").html(html)	
				
			
		})
		}		)}		
		
//修改
		function up1(code,ucode){
	openLayer('upOrder.jsp?orderCode='+code+'&customerCode=\''+ucode+'\'',refresh);	
}
//订单信息
function detail(code){
	openLayer('orderGoods.jsp?orderCode='+code);
	
}
	
	</script>
	
	
</body>
</html>