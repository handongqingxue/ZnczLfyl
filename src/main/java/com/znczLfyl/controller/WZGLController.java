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
@RequestMapping("/"+WZGLController.MODULE_NAME)
public class WZGLController {

	@Autowired
	private WuZiLeiXingService wuZiLeiXingService;
	public static final String MODULE_NAME="wzgl";
	
	@RequestMapping(value="/wzlx/list")
	public String goWzglWzlxList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/wzlx/list";
	}
	
	@RequestMapping(value="/queryWZLXList")
	@ResponseBody
	public Map<String, Object> queryWZLXList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = wuZiLeiXingService.queryForInt(mc);
			List<WuZiLeiXing> wzlxList=wuZiLeiXingService.queryList(mc, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", wzlxList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
}
