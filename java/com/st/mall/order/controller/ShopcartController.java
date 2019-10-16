package com.st.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.goods.model.GoodsModel;
import com.st.mall.order.model.ShopcartModel;
import com.st.mall.order.service.IshopcartService;

@Controller("shopcartController")
@RequestMapping("shopcartController")
public class ShopcartController {
@Autowired
@Qualifier("shopcartService")
private IshopcartService shopcartService;

@ResponseBody    //添加
@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
public int insert (ShopcartModel model) {
return  shopcartService.insert(model);}

@ResponseBody   //jia
@RequestMapping(value="/jia",produces="application/json;charset=utf-8")
public int jia (ShopcartModel model) {	
return  shopcartService.jia(model);}
@ResponseBody   //减少
@RequestMapping(value="/jian",produces="application/json;charset=utf-8")
public int jian (ShopcartModel model) {	
return  shopcartService.jian(model);}

@ResponseBody //刷新
@RequestMapping(value="/refresh",produces="application/json;charset=utf-8")
public List<ShopcartModel>  selectAll (ShopcartModel model) {
	return shopcartService.selectAll(model);
}
@ResponseBody //删除
@RequestMapping(value="/delete",produces="application/json;charset=utf-8")
public int  delete (ShopcartModel model) {
	return shopcartService.delete(model);
}



}
