package com.st.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.order.mapper.addressMapper;
import com.st.mall.order.model.AddressModel;
@Service("addressService")
public class AddressService implements IaddressService {
@Autowired
private addressMapper serviceMapper;
	@Override
	public Integer insert(AddressModel model) {
	
		return serviceMapper.insert(model);
	}

	@Override
	public int delete(AddressModel model) {
	
		return serviceMapper.delete(model);
	}

	@Override
	public int update(AddressModel model) {
	
		return serviceMapper.update(model);
	}

	@Override
	public AddressModel select(AddressModel model) {
	
		return serviceMapper.select(model);
	}

	@Override
	public List<AddressModel> selectAll(AddressModel model) {
	
		return serviceMapper.selectAll(model);
	}

	@Override
	public List<AddressModel> selectList(AddressModel model) {
	
		return serviceMapper.selectList(model);
	}

	@Override
	public int selectCount(AddressModel model) {
	
		return serviceMapper.selectCount(model);
	}


}
