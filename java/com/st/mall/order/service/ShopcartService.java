package com.st.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.order.mapper.ShopcartMapper;
import com.st.mall.order.model.ShopcartModel;

@Service("shopcartService")
public class ShopcartService implements IshopcartService{
@Autowired	
private ShopcartMapper shopcartMapper;

@Override
public int insert(ShopcartModel model) {
String c=model.getCustomerCode();
String g=model.getGoodsCode();
ShopcartModel mod = new ShopcartModel();
mod.setCustomerCode(c);
mod.setGoodsCode(g);
List<ShopcartModel> list = shopcartMapper.selectAll(mod);
if(list.size()==0)
{model.setGoodsNum(1);return shopcartMapper.insert(model);}
else 
{int num=shopcartMapper.select(mod).getGoodsNum();
model.setGoodsNum(num+1);
return shopcartMapper.update(model);
}
	
}

@Override
public int delete(ShopcartModel model) {
	return shopcartMapper.delete(model);
}

@Override
public int update(ShopcartModel model) {

	return shopcartMapper.update(model);
}

@Override
public ShopcartModel select(ShopcartModel model) {
	
	return shopcartMapper.select(model);
}

@Override
public List<ShopcartModel> selectAll(ShopcartModel model) {
	return shopcartMapper.selectAll(model);
}

@Override
public List<ShopcartModel> selectList(ShopcartModel model) {	
	return shopcartMapper.selectList(model);
}

@Override
public int selectCount(ShopcartModel model) {
	return shopcartMapper.selectCount(model);
}

@Override
public int jian(ShopcartModel model) {
	int num=shopcartMapper.select(model).getGoodsNum();
	if(num==1) {return 2;}
	else {
	model.setGoodsNum(num-1);
	return shopcartMapper.update(model);
	}
}

@Override
public int jia(ShopcartModel model) {
	int num=shopcartMapper.select(model).getGoodsNum();
	model.setGoodsNum(num+1);
	return shopcartMapper.update(model);
	}



}
