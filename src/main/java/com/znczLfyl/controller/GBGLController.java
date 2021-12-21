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
	private GuoBangService guoBangService;
	public static final String MODULE_NAME="gbgl";
	
	@RequestMapping(value="/zhcx/new")
	public String goZhcxNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/new";
	}

	/**
	 * ��ת����������-�ۺϲ�ѯ-�༭ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/zhcx/edit")
	public String goZhcxEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectById(id);
		request.setAttribute("gb", gb);
		
		return MODULE_NAME+"/zhcx/edit";
	}
	
	/**
	 * ��ת����������-�ۺϲ�ѯ-�б�ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/zhcx/list")
	public String goZhcxList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/list";
	}

	/**
	 * ��ת����������-�ۺϲ�ѯ-����ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/zhcx/detail")
	public String goZhcxDetail(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectById(id);
		request.setAttribute("gb", gb);
		
		return MODULE_NAME+"/zhcx/detail";
	}

	@RequestMapping(value="/newGuoBang")
	@ResponseBody
	public Map<String, Object> newGuoBang(GuoBang gb) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=guoBangService.add(gb);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "����������Ϣ�ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "����������Ϣʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editGuoBang")
	@ResponseBody
	public Map<String, Object> editGuoBang(GuoBang gb) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=guoBangService.edit(gb);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�༭������Ϣ�ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭������Ϣʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryZHCXList")
	@ResponseBody
	public Map<String, Object> queryZHCXList(String ddh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = guoBangService.queryZHCXForInt(ddh);
		List<GuoBang> zhglList=guoBangService.queryZHCXList(ddh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", zhglList);
		
		return jsonMap;
	}
}
