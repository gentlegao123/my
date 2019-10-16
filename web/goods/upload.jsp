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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>图片上传</legend>
</fieldset> 
 
<div class="layui-upload">
  <button class="layui-btn layui-btn-normal" id="testList" type="button">选择多文件</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button class="layui-btn" id="testListAction" type="button">开始上传</button>
</div> 

<div class="layui-upload">
  <div class="layui-upload-list">
    <table class="layui-table">
    	<colgroup>
			<col width="70px">
			<col width="70px">
			<col width="70px">
		
			<col width="200px">
		</colgroup>
      <thead>
        <tr><th>序号</th>
        <th>图片名</th>
        <th>图片</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="tbody"></tbody>
    </table>
  </div>

</div> 




<script>
form.render(); 
var goodsCode ="<%= request.getParameter("goodsCode") %>";

 init(); 

  //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '/mall/goodsImageController/upload.do'
    ,data:{goodsCode:goodsCode}
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
   		init();
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });

  function updateTable(data){
	
console.log(data.list)
	 var html="";
  	$.each(data.list,function(i,dom){
  		
  		var ss=dom.imageType=="1"?"主图":"设为主图"
  		
  		
  		html+="<tr><td>"+(i+1)+"</td>"+
  		  "<td>"+dom.imageName+"</td>"+
  		 "<td><img src='/image/"+dom.imageName+"' class='layui-upload-img'></td>"+
  		 "<td><input type='button' class ='layui-btn' onclick ='delPic("+dom.id+")' value='删除'/>"+
  		 "<input type='button' class ='layui-btn' onclick ='main("+dom.id+")' value='"+ss+"'/></td>"+
  		 "</tr>"
  		$("#tbody").html(html); 
  	})		
  	
  } 
  function delPic(id){
		 ajax('/mall/goodsImageController/delect.do',{"id":id},'json',function (data){
			 if(data==1){layer.msg("删除成功");init();}
			 else {layer.msg("删除失败")}
		 })	
	  
	  
  };
  
  function main(id){
		 ajax('/mall/goodsImageController/main.do',{"id":id},'json',function (data){
			 if(data==1){layer.msg("设置成功");init();}
			 else {layer.msg("设置失败")}
		 })	  
  } 
  
  function init(){		
		 ajax('/mall/goodsImageController/select.do',{"goodsCode":goodsCode},'json',function (data){
				 if(data){updateTable(data)}
				 else {$("#tbody").html('')}
			 })			
		 }		 
	  

  
</script>


</body>
</html>