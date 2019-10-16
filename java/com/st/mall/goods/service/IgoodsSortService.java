package com.st.mall.goods.service;

import java.util.List;

import com.st.mall.goods.model.GoodsSortModel;

public interface IgoodsSortService {

	int insert (GoodsSortModel model);
	int delete (GoodsSortModel model);
	int update (GoodsSortModel model);
	int selectCount(GoodsSortModel model); 
	GoodsSortModel select (GoodsSortModel model);
	List <GoodsSortModel> selectListP(GoodsSortModel model);
	List <GoodsSortModel> selectListS(GoodsSortModel model);
	List <GoodsSortModel> selectAll(GoodsSortModel model);
}
