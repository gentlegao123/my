package com.st.mall.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.goods.mapper.GoodsSortMapper;
import com.st.mall.goods.model.GoodsSortModel;
import com.st.mall.util.FmtEmpty;

@Service("goodsSortService")
public class GoodsSortService implements IgoodsSortService{
@Autowired
private GoodsSortMapper goodsSortMapper;

public int insert(GoodsSortModel model) {
	String code=model.getSortCode();
	GoodsSortModel mod=new GoodsSortModel();
	mod.setSortCode(code);
	if(goodsSortMapper.selectAll(model).size()>0) {
		return 2;  //有重复，返回2
		}	
	else return goodsSortMapper.insert(model);   //无重复，插入
}

public int delete(GoodsSortModel model) {
	String code =model.getSortCode();
	GoodsSortModel mod=new GoodsSortModel();
	mod.setParentCode(code);
	if(goodsSortMapper.selectCount(mod)>0) {
		return 2;   //下属有分类
	}else{
	return goodsSortMapper.delete(model);}
}

public int update(GoodsSortModel model) {
	return goodsSortMapper.update(model);
}

public int selectCount(GoodsSortModel model) {
	return goodsSortMapper.selectCount(model);
}

public GoodsSortModel select(GoodsSortModel model) {
	return goodsSortMapper.select(model);
}

public List<GoodsSortModel> selectListP(GoodsSortModel model) {
	String code = model.getSortCode();
	if(!FmtEmpty.isEmpty(code)) {model.setSortCode("%"+code+"%");}else {model.setSortCode("P%");}
	String name = model.getSortName();
	if(!FmtEmpty.isEmpty(name)) {model.setSortName("%"+name+"%");}else {model.setSortCode("P%");}
	String descr=model.getSortDescr();
	if(!FmtEmpty.isEmpty(descr)) {model.setSortDescr("%"+descr+"%");}else {model.setSortCode("P%");}
	String parentCode=model.getParentCode();
	if(!FmtEmpty.isEmpty(parentCode)) {model.setParentCode("%"+parentCode+"%");}else {model.setSortCode("P%");}
	return goodsSortMapper.selectList(model);
}
public List<GoodsSortModel> selectListS(GoodsSortModel model) {
	String code = model.getSortCode();
	if(!FmtEmpty.isEmpty(code)) {model.setSortCode("%"+code+"%");}else {model.setSortCode("S%");}
	String name = model.getSortName();
	if(!FmtEmpty.isEmpty(name)) {model.setSortName("%"+name+"%");}else {model.setSortCode("S%");}
	String descr=model.getSortDescr();
	if(!FmtEmpty.isEmpty(descr)) {model.setSortDescr("%"+descr+"%");}else {model.setSortCode("S%");}
	String parentCode=model.getParentCode();
	if(!FmtEmpty.isEmpty(parentCode)) {model.setParentCode("%"+parentCode+"%");}else {model.setSortCode("S%");}
	return goodsSortMapper.selectList(model);
}





public List<GoodsSortModel> selectAll(GoodsSortModel model) {
	
	return goodsSortMapper.selectAll(model);
}







}
