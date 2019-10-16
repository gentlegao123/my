package com.st.mall.order.service;

import java.util.List;

import com.st.mall.order.model.OrderGoodsModel;

public interface IorderGoodsService {

	int insert(OrderGoodsModel model);
	int delete (OrderGoodsModel model);
	int update (OrderGoodsModel model);
	OrderGoodsModel  select(OrderGoodsModel model);
	List<OrderGoodsModel> selectAll(OrderGoodsModel model);
	List<OrderGoodsModel> selectList(OrderGoodsModel model);
	int selectCount(OrderGoodsModel model);

}
