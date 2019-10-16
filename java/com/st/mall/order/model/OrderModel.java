package com.st.mall.order.model;

public class OrderModel extends PageModel{
private Integer id ;
private String orderCode;
private String customerCode;
private String time;
private String status;
private String addressCode;
private String nameAddress;

private String num;
private String price;
private String imageName;



public String getImageName() {
	return imageName;
}
public void setImageName(String imageName) {
	this.imageName = imageName;
}
public String getNum() {
	return num;
}
public void setNum(String num) {
	this.num = num;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getNameAddress() {
	return nameAddress;
}
public void setNameAddress(String nameAddress) {
	this.nameAddress = nameAddress;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getOrderCode() {
	return orderCode;
}
public void setOrderCode(String orderCode) {
	this.orderCode = orderCode;
}
public String getCustomerCode() {
	return customerCode;
}
public void setCustomerCode(String customerCode) {
	this.customerCode = customerCode;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getAddressCode() {
	return addressCode;
}
public void setAddressCode(String addressCode) {
	this.addressCode = addressCode;
}




}
