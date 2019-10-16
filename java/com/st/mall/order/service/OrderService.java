package com.st.mall.order.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.order.mapper.OrderMapper;
import com.st.mall.order.model.OrderModel;
import com.st.mall.util.FmtEmpty;

@Service("OrderService")
public class OrderService implements IorderService{
@Autowired
private OrderMapper orderMapper;

public int insert(OrderModel model) {
	
	return orderMapper.insert(model);
}




public int delete(OrderModel model) {
	
	return orderMapper.delete(model);
}

public int update(OrderModel model) {

	return orderMapper.update(model);
}

public OrderModel select(OrderModel model) {

	return orderMapper.select(model);
}

public List<OrderModel> selectList(OrderModel model) {
	String code = model.getOrderCode();
	if(!FmtEmpty.isEmpty(code)) {model.setOrderCode("%"+code+"%");}
	String name = model.getCustomerCode();	
	if(!FmtEmpty.isEmpty(name)) {model.setCustomerCode("%"+name+"%");}	
	
		return orderMapper.selectList(model);
}

public List<OrderModel> selectAll(OrderModel model) {

	return orderMapper.selectList(model);
}

public int selectCount(OrderModel model) {

	return orderMapper.selectCount(model);
}


}
