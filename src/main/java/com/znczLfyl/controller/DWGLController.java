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
	@Autowired
	private FaHuoDanWeiService faHuoDanWeiService;
	public static final String MODULE_NAME="dwgl";

	@RequestMapping(value="/yss/new")
	public String goYssNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/yss/new";
	}

	@RequestMapping(value="/yss/edit")
	public String goYssEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=yunShuShangService.selectById(id);
		request.setAttribute("yss", yss);
		
		return MODULE_NAME+"/yss/edit";
	}
	
	/**
	 * ��ת����λ����-������-�б�ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/yss/list")
	public String goYssList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/yss/list";
	}

	@RequestMapping(value="/yss/detail")
	public String goYssDetail(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=yunShuShangService.selectById(id);
		request.setAttribute("yss", yss);
		
		return MODULE_NAME+"/yss/detail";
	}
	
	/**
	 * ��ת����λ����-������λ-�б�ҳ��
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/fhdw/list")
	public String goFhdwList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/fhdw/list";
	}

	@RequestMapping(value="/newYunShuShang")
	@ResponseBody
	public Map<String, Object> newYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=yunShuShangService.add(yss);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "���������̳ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "����������ʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editYunShuShang")
	@ResponseBody
	public Map<String, Object> editYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=yunShuShangService.edit(yss);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�༭�����̳ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭������ʧ�ܣ�");
		}
		return jsonMap;
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

	@RequestMapping(value="/queryFaHuoDanWeiList")
	@ResponseBody
	public Map<String, Object> queryFaHuoDanWeiList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = faHuoDanWeiService.queryForInt(mc);
		List<FaHuoDanWei> yssList=faHuoDanWeiService.queryList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yssList);
		
		return jsonMap;
	}
}
