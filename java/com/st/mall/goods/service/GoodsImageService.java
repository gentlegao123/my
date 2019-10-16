package com.st.mall.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.goods.mapper.GoodsImageMapper;
import com.st.mall.goods.model.GoodsImageModel;

@Service("goodsImageService")
public class GoodsImageService implements IgoodsImageService {
@Autowired
private GoodsImageMapper  goodsImageMapper;

@Override
public int insert(GoodsImageModel model) {	
	return goodsImageMapper.insert(model);
}

@Override
public int delete(GoodsImageModel model) {
	
	return goodsImageMapper.delete(model);
}

@Override
public int update(GoodsImageModel model) {
	
	return goodsImageMapper.update(model);
}

@Override
public GoodsImageModel select(GoodsImageModel model) {
	
	return goodsImageMapper.select(model) ;
}

@Override
public List<GoodsImageModel> selectAll(GoodsImageModel model) {

	return  goodsImageMapper.selectAll(model);
}

@Override
public List<GoodsImageModel> selectList(GoodsImageModel model) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int selectCount(GoodsImageModel model) {
	// TODO Auto-generated method stub
	return 0;
}

}
