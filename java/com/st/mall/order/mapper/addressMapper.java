package com.st.mall.order.mapper;

import java.util.List;

import com.st.mall.order.model.AddressModel;
public interface addressMapper {
	int insert(AddressModel model);
	int delete (AddressModel  model);
	int update (AddressModel  model);
	AddressModel   select(AddressModel  model);
	List<AddressModel > selectAll(AddressModel  model);
	List<AddressModel > selectList(AddressModel  model);
	int selectCount(AddressModel  model);
}
