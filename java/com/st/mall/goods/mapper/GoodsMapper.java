package com.st.mall.goods.mapper;

import java.util.List;

import com.st.mall.goods.model.GoodsModel;

public interface GoodsMapper {

int insert (GoodsModel model);
int delete (GoodsModel model);
int update (GoodsModel model);
GoodsModel  select(GoodsModel model);
List<GoodsModel> selectAll(GoodsModel model);
List<GoodsModel> selectList(GoodsModel model);
int selectCount(GoodsModel model);
List<GoodsModel> selectMain(GoodsModel model);
}
