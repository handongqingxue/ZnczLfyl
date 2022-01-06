package com.znczLfyl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Controller
@RequestMapping("/gkj")
public class GkjController {
	
	@Autowired
	private YongHuService yongHuService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private DingDanZhuangTaiService dingDanZhuangTaiService;
	@Autowired
	private BangDanJiLuService bangDanJiLuService;

	@RequestMapping(value="/getDingDan")
	@ResponseBody
	public Map<String, Object> getDingDan(String cph,String ddztMc) {
		
		System.out.println("cph==="+cph);
		System.out.println("ddztMc==="+ddztMc);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		DingDan dd = dingDanService.getDingDan(cph, ddztMc);
		
		if(dd==null) {
			jsonMap.put("status", "no");
			jsonMap.put("message", "没找到相关订单");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("dingDan", dd);
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/getDingDanByZt")
	@ResponseBody
	public Map<String, Object> getDingDanByZt(String ddztMc,Integer yjzt,Integer ejzt) {
		
		System.out.println("ddztMc==="+ddztMc);
		System.out.println("yjzt==="+yjzt);
		System.out.println("ejzt==="+ejzt);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		DingDan dd = dingDanService.getByZt(ddztMc,yjzt,ejzt);
		
		if(dd==null) {
			jsonMap.put("status", "no");
			jsonMap.put("message", "没找到相关订单");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("dingDan", dd);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/editDingDan")
	@ResponseBody
	public Map<String, Object> editDingDan(DingDan dd,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			int count=dingDanService.edit(dd);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑订单成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑订单失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/editDingDanByZt")
	@ResponseBody
	public Map<String, Object> editDingDanByZt(DingDan dd,
			HttpServletRequest request) {
		
		System.out.println("111111111111");
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			int count=dingDanService.editByZt(dd);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑订单成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑订单失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/newBangDanJiLu")
	@ResponseBody
	public Map<String, Object> newBangDanJiLu(Integer ddId) {

		System.out.println("ddId==="+ddId);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		BangDanJiLu bdjl=new BangDanJiLu();
		bdjl.setDdId(ddId);
		int count = bangDanJiLuService.add(bdjl);
		
		if(count==0) {
			jsonMap.put("status", "no");
			jsonMap.put("message", "创建磅单信息失败！");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("message", "创建磅单信息成功！");
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/editBangDanJiLu")
	@ResponseBody
	public Map<String, Object> editBangDanJiLu(BangDanJiLu bdjl) {

		System.out.println("ddId==="+bdjl.getDdId());
		System.out.println("mz==="+bdjl.getMz());
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();

		int count=bangDanJiLuService.edit(bdjl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑磅单信息成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑磅单信息失败！");
		}
		return jsonMap;
	}
}
