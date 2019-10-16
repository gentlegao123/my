package com.st.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.order.mapper.OrderGoodsMapper;
import com.st.mall.order.model.OrderGoodsModel;
@Service("orderGoodsService")
public class OrderGoodsService implements IorderGoodsService{
@Autowired
private OrderGoodsMapper orderGoodsMapper;
	@Override
	public int insert(OrderGoodsModel model) {
		return orderGoodsMapper.insert(model);
	}

	@Override
	public int delete(OrderGoodsModel model) {
	
		return orderGoodsMapper.delete(model);
	}

	@Override
	public int update(OrderGoodsModel model) {
	
		return orderGoodsMapper.update(model);
	}

	@Override
	public OrderGoodsModel select(OrderGoodsModel model) {
	
		return orderGoodsMapper.select(model);
	}

	@Override
	public List<OrderGoodsModel> selectAll(OrderGoodsModel model) {

		return orderGoodsMapper.selectAll(model);
	}

	@Override
	public List<OrderGoodsModel> selectList(OrderGoodsModel model) {
	
		return orderGoodsMapper.selectList(model);
	}

	@Override
	public int selectCount(OrderGoodsModel model) {
	
		return orderGoodsMapper.selectCount(model);
	}



}
