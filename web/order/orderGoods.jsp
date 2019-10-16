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
	<table class="layui-table">
		<colgroup>
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
				<th>商品编号</th>
				<th>数量</th>
				<th>价格</th>			
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
			</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>

<script type="text/javascript">
var orderCode=<%= request.getParameter("orderCode")%>
refresh();
function refresh(){
	console.log("刷新");
	  ajax('/mall/orderGoodsController/select.do',{orderCode:orderCode},'json',function (data){
		  var html="";
			$.each(data,function(i,dom){
				
			html+="<tr><td>"+(i+1)+"</td>"+
			"<td>"+dom.orderCode+"</td>"+
			"<td>"+dom.goodsCode+"</td>"+			
			"<td>"+dom.num+"</td>"+
			"<td>"+dom.price+"</td>"+
			"<td><button class='layui-btn' onclick='del(\""+dom.id+"\")' >删除</button>"+
			"<button class='layui-btn' onclick='up1(\""+dom.orderCode+"\",\""+dom.customerCode+"\")'>修改</button>"+
			"</td></tr>"})
			$("#tbody").html(html)			  
	  })	
};

</script>






</body>
</html>