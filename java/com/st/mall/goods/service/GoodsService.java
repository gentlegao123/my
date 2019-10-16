package com.st.mall.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.goods.mapper.GoodsMapper;
import com.st.mall.goods.model.GoodsModel;
import com.st.mall.util.FmtEmpty;

@Service("goodsService")
public class GoodsService implements IgoodsService{
@Autowired
private GoodsMapper goodsDao;

public int insert(GoodsModel model) {
	return  goodsDao.insert(model);

}

public List<GoodsModel> selectAll(GoodsModel model) {
	
	return goodsDao.selectAll(model);
 
}
//查询一条
public GoodsModel select(GoodsModel model) {
	
	return 	goodsDao.select(model);
}

public int delete(GoodsModel model) {

	return goodsDao.delete(model);
}

public int update(GoodsModel model) {

	return goodsDao.update(model);
}

public List<GoodsModel> selectList(GoodsModel model) {
String code = model.getGoodsCode();
if(!FmtEmpty.isEmpty(code)) {model.setGoodsCode("%"+code+"%");}
String name = model.getGoodsName();	
if(!FmtEmpty.isEmpty(name)) {model.setGoodsName("%"+name+"%");}	
String sort = model.getSortCode();	
if(!FmtEmpty.isEmpty(sort)) {model.setSortCode("%"+sort+"%");}	
String descr = model.getDescr();	
if(!FmtEmpty.isEmpty(descr)) {model.setDescr("%"+descr+"%");}	
	return goodsDao.selectList(model);
}

public int selectCount(GoodsModel model) {

	return goodsDao.selectCount(model);
}

@Override
public List<GoodsModel> selectMain(GoodsModel model) {

	return goodsDao.selectMain(model);
}


}
