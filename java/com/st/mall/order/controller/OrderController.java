package com.st.mall.order.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.goods.model.GoodsModel;
import com.st.mall.order.model.OrderModel;
import com.st.mall.order.service.IorderService;

@Controller("orderController")
@RequestMapping("/orderController")
public class OrderController {
@Autowired
@Qualifier("OrderService")
private IorderService orderService;


@ResponseBody
@RequestMapping("/insert")  //管理员添加
public int insert (OrderModel model) {
	return orderService.insert(model);
}
@ResponseBody
@RequestMapping("/insert2")  //客户添加
public int insert2 (OrderModel model) {
	Date time = new Date();
	String t =time.toLocaleString();
	model.setTime(t);
	return orderService.insert(model);
}


@ResponseBody
@RequestMapping("/refresh")  //刷新
public List<OrderModel> refresh (OrderModel model) {
	return orderService.selectAll(model);
}

@ResponseBody
@RequestMapping("/delete")  //删除
public int delect (OrderModel model) {
	return orderService.delete(model);
}
@ResponseBody
@RequestMapping("/selpage")  //分页
public Map<String,Object>  selpage (OrderModel model) {
	Map<String,Object> map =new HashMap<String,Object>();
	map.put("list", orderService.selectList(model));
	map.put("count", orderService.selectCount(model));
	return map;
}

@ResponseBody
@RequestMapping("/up1")  //查询一个
public OrderModel select (OrderModel model) {
	return orderService.select(model);
}

@ResponseBody
@RequestMapping("/up2")  //查询一个
public int update (OrderModel model) {
	return orderService.update(model);
}


}
