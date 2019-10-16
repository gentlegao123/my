package com.st.mall.order.mapper;

import java.util.List;
import com.st.mall.order.model.OrderModel;

public interface OrderMapper {

int insert(OrderModel model);
int delete (OrderModel model);
int update (OrderModel model);
OrderModel  select(OrderModel model);
List<OrderModel> selectAll(OrderModel model);
List<OrderModel> selectList(OrderModel model);
int selectCount(OrderModel model);
}
