package com.st.mall.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.customer.model.CustomerModel;
import com.st.mall.customer.service.ICustomerService;
import com.st.mall.util.FmtEmpty;

@Controller("customerController")
@RequestMapping("/customerController")
public class CustomerController {
@Autowired
@Qualifier("customerService")
private ICustomerService customerService;

@ResponseBody   //注册
@RequestMapping(value="/reg",produces="application/json;charset=utf-8")  
public int  insert (CustomerModel model,HttpServletRequest request) {
	String incode= request.getParameter("code");
	Object authCode = request.getSession().getAttribute("authCode");
	String drowcode = (String) authCode;
	if(incode.equals(drowcode)) {return customerService.insert(model);}
	else {return 3;}
	}

@ResponseBody     //登录判断
@RequestMapping(value="/login",produces="application/json;charset=utf-8")  
public String login (CustomerModel model,HttpServletRequest request) {
	CustomerModel m=new CustomerModel();
	m.setCustomerCode(model.getCustomerCode());
	if(customerService.selectAll(m).size()==0) {
		return "5";	
	};	
	String code =model.getCustomerCode();
	request.getSession().setAttribute("code", code);
	CustomerModel mod =new CustomerModel();
	mod.setCustomerCode(code);    
	
	String incode= request.getParameter("code");
	Object authCode = request.getSession().getAttribute("authCode");
	String drowcode = (String) authCode;
	if(incode.equals(drowcode)) {}
	else {return "4";}//验证码
	
	
	//身份空，且密码对
	if (customerService.selectAll(mod).get(0).getIdentify()==null&customerService.login(model)==1) 
	{return "2";}                //有身份，且密码对
	else if(customerService.selectAll(mod).get(0).getIdentify()!=null&customerService.login(model)==1)
	{return "1";}
	else return "3";
}
@ResponseBody     //查询刷新
@RequestMapping(value="/refresh",produces="application/json;charset=utf-8")  
public List<CustomerModel> refresh() {
	CustomerModel mod =new CustomerModel();
	return customerService.selectAll(mod);}

@ResponseBody     //查询一条
@RequestMapping(value="/sel1",produces="application/json;charset=utf-8")  
public CustomerModel sel1(CustomerModel model) {
return customerService.select(model);}

@ResponseBody     //条件查询多条
@RequestMapping(value="/selectAll",produces="application/json;charset=utf-8")  
public List<CustomerModel> selectAll(CustomerModel model) {
return customerService.selectAll(model);}

@ResponseBody     //删除
@RequestMapping(value="/delect",produces="application/json;charset=utf-8")  
public int delect(CustomerModel model) {
	return customerService.delete(model);
	}

@ResponseBody     //保存
@RequestMapping(value="/up2",produces="application/json;charset=utf-8")  
public int up2(CustomerModel model) {
	return customerService.update(model);
	}

@ResponseBody     //分页
@RequestMapping(value="/selpage",produces="application/json;charset=utf-8")  
public Map<String,Object> page(CustomerModel model) {
	String code=model.getCustomerCode();
	Map<String,Object> map= new HashMap<String,Object>();
	if(!FmtEmpty.isEmpty(code)) {model.setCustomerCode("%"+code+"%");}
	String name=model.getCustomerName();
	if(!FmtEmpty.isEmpty(name)) {model.setCustomerName("%"+name+"%");}
	map.put("list", customerService.selectList(model));
	map.put("count", customerService.selectCount(model));
	return map;	
	}
@ResponseBody     //是否登录
@RequestMapping(value="/loginif",produces="application/json;charset=utf-8")  
public int loginif(HttpSession session) {
	Object code = session.getAttribute("code");
	if(code==null) {return 2;}
	else {
	return 1;}
	}
@ResponseBody     //退出
@RequestMapping(value="/tui",produces="application/json;charset=utf-8")  
public int tui(HttpSession session) {
session.setAttribute("code", null);
if(session.getAttribute("code")==null) {return 1;}
else return 2;}
}

