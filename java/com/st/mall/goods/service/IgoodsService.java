package com.st.mall.goods.service;

import java.util.List;

import com.st.mall.goods.model.GoodsModel;

public interface IgoodsService {
	int insert (GoodsModel model);
	int delete (GoodsModel model);
	int update (GoodsModel model);
	GoodsModel  select(GoodsModel model);
	List<GoodsModel> selectAll(GoodsModel model);
	List<GoodsModel> selectList(GoodsModel model);
	int selectCount(GoodsModel model);
	List<GoodsModel> selectMain(GoodsModel model);

}
