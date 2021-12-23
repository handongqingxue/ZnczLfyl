package com.znczLfyl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Controller
@RequestMapping("/"+XTGLController.MODULE_NAME)
public class XTGLController {

	@Autowired
	private YongHuService yongHuService;
	public static final String MODULE_NAME="xtgl";

	@RequestMapping(value="/yhcx/edit")
	public String goYhcxEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		YongHu yh=yongHuService.selectById(id);
		request.setAttribute("yh", yh);
		
		return MODULE_NAME+"/yhcx/edit";
	}
	
	@RequestMapping(value="/yhcx/list")
	public String goYhcxList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/yhcx/list";
	}
	
	@RequestMapping(value="/queryYongHuList")
	@ResponseBody
	public Map<String, Object> queryYongHuList(String yhm,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = yongHuService.queryForInt(yhm);
		List<YongHu> yhList=yongHuService.queryList(yhm, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yhList);
		
		return jsonMap;
	}
}
