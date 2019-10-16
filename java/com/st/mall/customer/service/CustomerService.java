package com.st.mall.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.mall.customer.mapper.CustomerMapper;
import com.st.mall.customer.model.CustomerModel;
import com.st.mall.util.MD5;

@Service("customerService")
public class CustomerService implements ICustomerService {
	@Autowired
	private CustomerMapper CustomerDao;
	//注册
	public int insert(CustomerModel model) {
		String code =model.getCustomerCode();
		String pass=model.getCustomerPass();
		String pass2=MD5.encode(pass);
		model.setCustomerPass(pass2);
		CustomerModel mod =new CustomerModel();
		mod.setCustomerCode(code);
		
		
		
		if(CustomerDao.selectAll(mod).size()==0){return CustomerDao.insert(model);}
		else {return 2;}
	}
	//查询一条
   public CustomerModel select(CustomerModel model) {   
		return   CustomerDao.select(model);      
   }
   
   //登录
   public int login (CustomerModel model) {
	   String code =model.getCustomerCode();
	   String pass3=model.getCustomerPass();
	   String pass2=MD5.encode(pass3);
	   CustomerModel mod =new CustomerModel();
		mod.setCustomerCode(code);
	String pass1=CustomerDao.selectAll(mod).get(0).getCustomerPass();
	if(pass1.equals(pass2)) {return 1;}  //跳转页面管理员
	return 2; //跳转页面用户
	   
	   
	   
   }
   //修改
public int update(CustomerModel model) {
	return   CustomerDao.update(model);  
}
//查询所有
public List<CustomerModel> selectAll(CustomerModel model) {

	return CustomerDao.selectAll(model);
}
//删除
public int delete(CustomerModel model) {
return  CustomerDao.delete(model);
}

//查询总数
public int selectCount(CustomerModel model) {
	
	return CustomerDao.selectCount(model);
}
//查询分页
public List<CustomerModel> selectList(CustomerModel model) {
	
	return CustomerDao.selectList(model);
}


}
