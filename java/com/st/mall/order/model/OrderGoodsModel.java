package com.st.mall.order.model;

import java.math.BigDecimal;

public class OrderGoodsModel {

private Integer id ;
private String orderCode;
private String goodsCode;
private Integer  num;
private BigDecimal price;

private String time;
private String status;
private String goodsDescr;
private String imageName;








public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getGoodsDescr() {
	return goodsDescr;
}
public void setGoodsDescr(String goodsDescr) {
	this.goodsDescr = goodsDescr;
}
public String getImageName() {
	return imageName;
}
public void setImageName(String imageName) {
	this.imageName = imageName;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getNum() {
	return num;
}
public void setNum(Integer num) {
	this.num = num;
}
public String getOrderCode() {
	return orderCode;
}
public void setOrderCode(String orderCode) {
	this.orderCode = orderCode;
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
