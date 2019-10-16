package com.st.mall.goods.mapper;

import java.util.List;

import com.st.mall.goods.model.GoodsSortModel;

public interface GoodsSortMapper {
int insert (GoodsSortModel model);
int delete (GoodsSortModel model);
int update (GoodsSortModel model);
int selectCount(GoodsSortModel model); 
GoodsSortModel select (GoodsSortModel model);
List <GoodsSortModel> selectList(GoodsSortModel model);
List <GoodsSortModel> selectAll(GoodsSortModel model);

}
