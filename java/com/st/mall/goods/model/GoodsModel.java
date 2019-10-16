package com.st.mall.goods.model;

import java.math.BigDecimal;

public class GoodsModel extends PageModel{
private Integer id;
private String goodsCode;
private String goodsName;
private BigDecimal price;
private String descr;
private int goodsNum;
private String status;
private String sortCode;
private String imageName;
private String imageType;




public String getImageType() {
	return imageType;
}
public void setImageType(String imageType) {
	this.imageType = imageType;
}
public String getImageName() {
	return imageName;
}
public void setImageName(String imageName) {
	this.imageName = imageName;
}
private String nameSort;







public String getNameSort() {
	return nameSort;
}
public void setNameSort(String nameSort) {
	this.nameSort = nameSort;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getGoodsCode() {
	return goodsCode;
}
public void setGoodsCode(String goodsCode) {
	this.goodsCode = goodsCode;
}
public String getGoodsName() {
	return goodsName;
}
public void setGoodsName(String goodsName) {
	this.goodsName = goodsName;
}
public BigDecimal getPrice() {
	return price;
}
public void setPrice(BigDecimal price) {
	this.price = price;
}
public String getDescr() {
	return descr;
}
public void setDescr(String descr) {
	this.descr = descr;
}
public int getGoodsNum() {
	return goodsNum;
}
public void setGoodsNum(int goodsNum) {
	this.goodsNum = goodsNum;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getSortCode() {
	return sortCode;
}
public void setSortCode(String sortCode) {
	this.sortCode = sortCode;
}
@Override
public String toString() {
	return "GoodsModel [id=" + id + ", goodsCode=" + goodsCode + ", goodsName=" + goodsName + ", price=" + price
			+ ", descr=" + descr + ", goodsNum=" + goodsNum + ", status=" + status + ", sortCode=" + sortCode + "]";
}



}
