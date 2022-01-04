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
@RequestMapping("/"+CLTZGLController.MODULE_NAME)
public class CLTZGLController {

	@Autowired
	private CheLiangTaiZhangService cheLiangTaiZhangService;
	public static final String MODULE_NAME="cltzgl";
	
	@RequestMapping(value="/zhcx/new")
	public String goZhcxNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/new";
	}

	/**
	 * 跳转到车辆台账管理-综合查询-列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/zhcx/list")
	public String goZhcxList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/list";
	}
	
	@RequestMapping(value="/newCheLiangTaiZhang")
	@ResponseBody
	public Map<String, Object> newCheLiangTaiZhang(CheLiangTaiZhang cltz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=cheLiangTaiZhangService.add(cltz);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建车辆台账成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建车辆台账失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryZHCXList")
	@ResponseBody
	public Map<String, Object> queryZHCXList(String ddh,String cph,String jcsjks,String jcsjjs,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = cheLiangTaiZhangService.queryZHCXForInt(ddh,cph,jcsjks,jcsjjs);
			List<CheLiangTaiZhang> zhglList=cheLiangTaiZhangService.queryZHCXList(ddh,cph,jcsjks,jcsjjs, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
}
