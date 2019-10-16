package com.st.mall.goods.mapper;

import java.util.List;

import com.st.mall.goods.model.GoodsImageModel;

public interface GoodsImageMapper {

	int insert (GoodsImageModel model);
	int delete (GoodsImageModel model);
	int update (GoodsImageModel model);
	GoodsImageModel  select(GoodsImageModel model);
	List<GoodsImageModel> selectAll(GoodsImageModel model);
	List<GoodsImageModel> selectList(GoodsImageModel model);
	int selectCount(GoodsImageModel model);

}
