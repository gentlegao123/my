package com.st.mall.customer.service;

import java.util.List;

import com.st.mall.customer.model.CustomerModel;

public interface ICustomerService {

	int insert (CustomerModel model);
	int delete (CustomerModel model);
	CustomerModel  select(CustomerModel model);
	List<CustomerModel> selectAll(CustomerModel model);
	int selectCount(CustomerModel model);
	List<CustomerModel> selectList(CustomerModel model);
	int update(CustomerModel model);
int login(CustomerModel model);
}
