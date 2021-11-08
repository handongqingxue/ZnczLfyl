package com.znczLfyl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znczLfyl.service.*;
import com.znczLfyl.entity.*;

@Controller
@RequestMapping("/"+DWGLController.MODULE_NAME)
public class DWGLController {

	@Autowired
	private YunShuShangService yunShuShangService;
	public static final String MODULE_NAME="dwgl";
	
	/**
	 * 跳转到单位管理-运输商-列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/yss/list")
	public String goDwglYssList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/yss/list";
	}

	@RequestMapping(value="/queryYunShuShangList")
	@ResponseBody
	public Map<String, Object> queryYunShuShangList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = yunShuShangService.queryForInt(mc);
		List<YunShuShang> yssList=yunShuShangService.queryList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yssList);
		
		return jsonMap;
	}
}
