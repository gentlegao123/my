package com.st.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.order.model.OrderGoodsModel;
import com.st.mall.order.service.OrderGoodsService;

@Controller
@RequestMapping("/orderGoodsController")
public class OrderGoodsController {
@Autowired
@Qualifier("orderGoodsService")
private OrderGoodsService orderGoodsService;


@ResponseBody  //添加
@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
public int insert(OrderGoodsModel model) {
return  orderGoodsService.insert(model);	
}
@ResponseBody  //查询商品
@RequestMapping(value="/select",produces="application/json;charset=utf-8")  
public List<OrderGoodsModel> refresh(OrderGoodsModel model) {
return  orderGoodsService.selectAll(model);
	
}
@ResponseBody  //删除
@RequestMapping(value="/delete",produces="application/json;charset=utf-8")  
public int delete(OrderGoodsModel model) {
return  orderGoodsService.delete(model);
	
}

}
