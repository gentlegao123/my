package com.st.mall.order.service;

import java.util.List;

import com.st.mall.order.model.ShopcartModel;

public interface IshopcartService {
	int insert(ShopcartModel model);
	int delete (ShopcartModel model);
	int update (ShopcartModel model);
	ShopcartModel  select(ShopcartModel model);
	List<ShopcartModel> selectAll(ShopcartModel model);
	List<ShopcartModel> selectList(ShopcartModel model);
	int selectCount(ShopcartModel model);
	int jian (ShopcartModel model);
	int jia (ShopcartModel model);
}
