package com.st.mall.customer.model;

public class CustomerModel extends PageModel{
private Integer id ;
private String customerCode;
private String customerPass;
private String customerName;
private String identify;

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
public String getCustomerPass() {
	return customerPass;
}
public void setCustomerPass(String customerPass) {
	this.customerPass = customerPass;
}
public String getCustomerName() {
	return customerName;
}
public void setCustomerName(String customerName) {
	this.customerName = customerName;
}
public String getIdentify() {
	return identify;
}
public void setIdentify(String identify) {
	this.identify = identify;
}
@Override
public String toString() {
	return "CustomerModel [id=" + id + ", customerCode=" + customerCode + ", customerPass=" + customerPass
			+ ", customerName=" + customerName + ", identify=" + identify + "]";
}




}
