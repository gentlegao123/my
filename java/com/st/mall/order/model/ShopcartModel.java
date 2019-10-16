package com.st.mall.order.model;

import java.math.BigDecimal;

public class ShopcartModel {
private Integer id;
private String customerCode;
private String goodsCode;
private Integer goodsNum;
private BigDecimal price;
private String goodsDescr;
private String imageName;



public String getImageName() {
	return imageName;
}
public void setImageName(String imageName) {
	this.imageName = imageName;
}
public String getGoodsDescr() {
	return goodsDescr;
}
public void setGoodsDescr(String goodsDescr) {
	this.goodsDescr = goodsDescr;
}
public Integer getGoodsNum() {
	return goodsNum;
}
public void setGoodsNum(Integer goodsNum) {
	this.goodsNum = goodsNum;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getCustomerCode() {
	return customerCode;
}
public void setCustomerCode(String customerCode) {
	this.customerCode = customerCode;
}
public String getGoodsCode() {
	return goodsCode;
}
public void setGoodsCode(String goodsCode) {
	this.goodsCode = goodsCode;
}

public BigDecimal getPrice() {
	return price;
}
public void setPrice(BigDecimal price) {
	this.price = price;
}



}
