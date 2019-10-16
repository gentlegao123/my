package com.st.mall.goods.model;

public class GoodsSortModel extends PageModel{
private Integer id ;
private String sortCode;
private String sortName;
private String sortDescr;
private String parentCode;



public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getSortCode() {
	return sortCode;
}
public void setSortCode(String sortCode) {
	this.sortCode = sortCode;
}
public String getSortName() {
	return sortName;
}
public void setSortName(String sortName) {
	this.sortName = sortName;
}
public String getSortDescr() {
	return sortDescr;
}
public void setSortDescr(String sortDescr) {
	this.sortDescr = sortDescr;
}
public String getParentCode() {
	return parentCode;
}
public void setParentCode(String parentCode) {
	this.parentCode = parentCode;
}
@Override
public String toString() {
	return "GoodsSortModel [id=" + id + ", sortCode=" + sortCode + ", sortName=" + sortName + ", sortDescr=" + sortDescr
			+ ", parentCode=" + parentCode + "]";
}


}
