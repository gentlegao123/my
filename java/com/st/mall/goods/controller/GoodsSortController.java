package com.st.mall.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.goods.model.GoodsSortModel;
import com.st.mall.goods.service.IgoodsSortService;
import com.st.mall.util.FmtEmpty;

@Controller("goodsSortController")
@RequestMapping("/goodsSortController")
public class GoodsSortController {
@Autowired
@Qualifier("goodsSortService")
private IgoodsSortService goodsSortService;

@ResponseBody   //添加
@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
public int insert(GoodsSortModel model) {
	
	return goodsSortService.insert(model);	
} 
@ResponseBody   //刷新
@RequestMapping(value="/refresh",produces="application/json;charset=utf-8")
public List<GoodsSortModel> regresh(GoodsSortModel model) {
	model.setSortCode("S%");
	return goodsSortService.selectAll(model);	
}
@ResponseBody   //刷新2
@RequestMapping(value="/refresh2",produces="application/json;charset=utf-8")
public List<GoodsSortModel> regresh2(GoodsSortModel model) {
	model.setSortCode("P%");
	return goodsSortService.selectAll(model);	
}
@ResponseBody  //删除
@RequestMapping(value="/delete",produces="application/json;charset=utf-8")
public int delect (GoodsSortModel model) {	

	return goodsSortService.delete(model);	
}
@ResponseBody  //查询一条
@RequestMapping(value="/sel1",produces="application/json;charset=utf-8")
public GoodsSortModel sel1(GoodsSortModel model) {
	return goodsSortService.select(model);
}
@ResponseBody  //保存
@RequestMapping(value="/up2",produces="application/json;charset=utf-8")
public int up2 (GoodsSortModel model) {	
return goodsSortService.update(model);	
}
@ResponseBody  //查询分页
@RequestMapping(value="/selpageP",produces="application/json;charset=utf-8")
public Map<String, Object> selpageP (GoodsSortModel model) {	
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("list", goodsSortService.selectListP(model));
	map.put("count", goodsSortService.selectCount(model));
return map;	
}

@ResponseBody  //查询分页
@RequestMapping(value="/selpageS",produces="application/json;charset=utf-8")
public Map<String, Object> selpageS (GoodsSortModel model) {	
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("list", goodsSortService.selectListS(model));
	map.put("count", goodsSortService.selectCount(model));
return map;	
}
}
