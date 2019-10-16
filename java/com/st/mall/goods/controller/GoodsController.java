package com.st.mall.goods.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.goods.model.GoodsImageModel;
import com.st.mall.goods.model.GoodsModel;
import com.st.mall.goods.service.IgoodsService;
import com.st.mall.util.FmtEmpty;


@Controller("goodsController")
@RequestMapping("goodsController")
public class GoodsController {
@Autowired
@Qualifier("goodsService")
private IgoodsService goodService;
@ResponseBody //添加
@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
public int  insert (GoodsModel model) {
	return goodService.insert(model);
}

@ResponseBody //刷新
@RequestMapping(value="/refresh",produces="application/json;charset=utf-8")
public List<GoodsModel>  refresh () {
	GoodsModel model = new GoodsModel();
	return goodService.selectAll(model);
}

@ResponseBody //删除
@RequestMapping(value="/delete",produces="application/json;charset=utf-8")
public int  delete (GoodsModel model) {
	return goodService.delete(model);
}
@ResponseBody //查询一条
@RequestMapping(value="/select",produces="application/json;charset=utf-8")
public GoodsModel  select (GoodsModel model) {
	return goodService.select(model);
}

@ResponseBody //保存
@RequestMapping(value="/up2",produces="application/json;charset=utf-8")
public int  up2 (GoodsModel model) {
	String status = model.getStatus();
	if(status==null) {model.setStatus("down");}
	return goodService.update(model);
}
@ResponseBody //分页
@RequestMapping(value="/selpage",produces="application/json;charset=utf-8")
public Map<String,Object>  selpage (GoodsModel model) {
	Map<String,Object> map =new HashMap<String,Object>();
	map.put("list", goodService.selectList(model));
	map.put("count", goodService.selectCount(model));
	return map;
}

@ResponseBody //刷新图片
@RequestMapping(value="/refreshImage",produces="application/json;charset=utf-8")
public List<GoodsModel>  refreshImage (GoodsModel model) {
	model.setImageType("1");
	String descr = model.getDescr();	
	if(!FmtEmpty.isEmpty(descr)) {model.setDescr("%"+descr+"%");}
	return goodService.selectMain(model);
}

@ResponseBody //刷新图片
@RequestMapping(value="/refreshImage2",produces="application/json;charset=utf-8")
public List<GoodsModel>  refreshImage2 (GoodsModel model) {
	model.setImageType("2");
	return goodService.selectMain(model);
}



}
