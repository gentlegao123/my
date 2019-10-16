package com.st.mall.order.mapper;

import java.util.List;

import com.st.mall.order.model.OrderGoodsModel;


public interface OrderGoodsMapper {
	int insert(OrderGoodsModel model);
	int delete (OrderGoodsModel model);
	int update (OrderGoodsModel model);
	OrderGoodsModel  select(OrderGoodsModel model);
	List<OrderGoodsModel> selectAll(OrderGoodsModel model);
	List<OrderGoodsModel> selectList(OrderGoodsModel model);
	int selectCount(OrderGoodsModel model);

}
