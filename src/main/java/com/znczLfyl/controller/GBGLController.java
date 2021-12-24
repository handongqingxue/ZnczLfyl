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
@RequestMapping("/"+GBGLController.MODULE_NAME)
public class GBGLController {

	@Autowired
	private GuoBangJiLuService guoBangJiLuService;
	public static final String MODULE_NAME="gbgl";
	
	@RequestMapping(value="/gbjl/new")
	public String goGbjlNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/gbjl/new";
	}

	/**
	 * 跳转到过磅管理-过磅记录-编辑页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/gbjl/edit")
	public String goGbjlEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBangJiLu gbjl=guoBangJiLuService.selectById(id);
		request.setAttribute("gbjl", gbjl);
		
		return MODULE_NAME+"/gbjl/edit";
	}
	
	/**
	 * 跳转到过磅管理-过磅记录-列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/gbjl/list")
	public String goGbjlList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/gbjl/list";
	}

	/**
	 * 跳转到过磅管理-过磅记录-详情页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/gbjl/detail")
	public String goGbjlDetail(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBangJiLu gbjl=guoBangJiLuService.selectById(id);
		request.setAttribute("gbjl", gbjl);
		
		return MODULE_NAME+"/gbjl/detail";
	}

	@RequestMapping(value="/newGuoBangJiLu")
	@ResponseBody
	public Map<String, Object> newGuoBangJiLu(GuoBangJiLu gbjl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=guoBangJiLuService.add(gbjl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建过磅信息成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建过磅信息失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editGuoBangJiLu")
	@ResponseBody
	public Map<String, Object> editGuoBangJiLu(GuoBangJiLu gbjl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=guoBangJiLuService.edit(gbjl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑过磅信息成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑过磅信息失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryGBJLList")
	@ResponseBody
	public Map<String, Object> queryGBJLList(String ddh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = guoBangJiLuService.queryForInt(ddh);
		List<GuoBangJiLu> gbjlList=guoBangJiLuService.queryList(ddh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", gbjlList);
		
		return jsonMap;
	}
}
