package com.st.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.order.model.AddressModel;
import com.st.mall.order.service.IaddressService;

@RequestMapping("addressController")
@Controller("addressController")
public class AddressController {
@Autowired
@Qualifier("addressService")
private IaddressService addressService;

//增加
@ResponseBody
@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
public Integer insert(AddressModel model) {
return addressService.insert(model);
}
//刷新
@ResponseBody
@RequestMapping(value="/refresh",produces="application/json;charset=utf-8")
public List<AddressModel> refresh(AddressModel model) {
return addressService.selectAll(model);
}
//刷新
@ResponseBody
@RequestMapping(value="/delete",produces="application/json;charset=utf-8")
public int delete(AddressModel model) {
return addressService.delete(model);
}
//查出一条
@ResponseBody
@RequestMapping(value="/select",produces="application/json;charset=utf-8")
public AddressModel select(AddressModel model) {
	System.out.println("qqqqqqqqqqqqqqqqqqqqq");
return addressService.select(model);
}

//条件查出多条
@ResponseBody
@RequestMapping(value="/selectAll",produces="application/json;charset=utf-8")
public List<AddressModel> selectAll(AddressModel model) {
return addressService.selectAll(model);
}
//保存
@ResponseBody
@RequestMapping(value="/update",produces="application/json;charset=utf-8")
public int update(AddressModel model) {

return addressService.update(model);
}

}
