package com.st.mall.goods.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.mall.goods.model.GoodsImageModel;
import com.st.mall.goods.service.IgoodsImageService;
import com.st.mall.util.Upload;
@Controller
@RequestMapping("goodsImageController")
public class GoodsImageController {
@Autowired
@Qualifier("goodsImageService")
private IgoodsImageService goodsImageService;

	@ResponseBody //上传图片
	@RequestMapping(value="/upload",produces="application/json;charset=utf-8")
	public Map<String, Object> upload (HttpServletRequest request) {
		Map<String, Object> map = null;
		try {
			map =com.st.mall.util.Upload.upload(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	String code =map.get("goodsCode").toString();
	List<String> filenamesList = (List<String>) map.get("list");
	int mag=0;
	for(String s : filenamesList) {
		GoodsImageModel model = new GoodsImageModel();
		
		model.setImageName(s);
		model.setGoodsCode(code); 
		mag=goodsImageService.insert(model);
	}

		map.put("list", filenamesList);
		map.put("code","0");
		
		return map;
	}
	
	@ResponseBody //回显
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	public Map<String, Object> select (GoodsImageModel model) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", goodsImageService.selectAll(model));
		return map;	
	}
	
	
	@ResponseBody //删除
	@RequestMapping(value="/delect",produces="application/json;charset=utf-8")
	public int delect (GoodsImageModel model) {	
		String name = goodsImageService.select(model).getImageName();
		System.out.println(name+"删除删除删除删除删除删除删除");
		java.io.File f = new java.io.File("D:/image/"+name);
		f.delete();
		/* Upload.delFile(name); */
		return goodsImageService.delete(model);	
	}
	@ResponseBody //设为主图
	@RequestMapping(value="/main",produces="application/json;charset=utf-8")
	public int main (GoodsImageModel model) {
	int id =	model.getId();
	GoodsImageModel modce = new GoodsImageModel ();
	modce.setId(id);
	String code = goodsImageService.selectAll(modce).get(0).getGoodsCode();
	
	
	GoodsImageModel mod = new GoodsImageModel ();
	mod.setGoodsCode(code);
	mod.setImageType("2");
	goodsImageService.update(mod);   //此商品的图全部设置为2
	
	
	model.setImageType("1");
	return goodsImageService.update(model);	
	}
	
	@ResponseBody //查询
	@RequestMapping(value="/selectAll",produces="application/json;charset=utf-8")
	public List<GoodsImageModel> selectAll (GoodsImageModel model) {	
	model.setImageType("2");
		return goodsImageService.selectAll(model);	
	}
	
	
	
	
}
