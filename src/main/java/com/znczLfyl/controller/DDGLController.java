package com.znczLfyl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.znczLfyl.service.*;

import net.sf.json.JSONObject;

import com.znczLfyl.entity.*;
import com.znczLfyl.controller.DDGLController;

@Controller
@RequestMapping("/"+DDGLController.MODULE_NAME)
public class DDGLController {

	//@Autowired
	//private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	public static final String MODULE_NAME="ddgl";
	
	@RequestMapping(value="/zhcx/new")
	public String goDdglZhcxNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/new";
	}

	/**
	 * 跳转到订单管理-综合查询-列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/zhcx/list")
	public String goDdglZhcxList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/list";
	}
	
	@RequestMapping(value="/queryZHCXList")
	@ResponseBody
	public Map<String, Object> queryZHCXList(String ddh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryZHCXForInt(ddh);
			List<DingDan> zhglList=dingDanService.queryZHCXList(ddh, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newDingDanZongHeChaXun")
	@ResponseBody
	public Map<String, Object> newDingDanZongHeChaXun(DingDan dd,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			int count=dingDanService.add(dd);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建订单成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建订单失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
}
