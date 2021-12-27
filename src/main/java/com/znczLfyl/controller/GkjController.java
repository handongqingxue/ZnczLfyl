package com.znczLfyl.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znczLfyl.entity.*;
import com.znczLfyl.service.YongHuService;

@Controller
@RequestMapping("/gkj")
public class GkjController {
	
	@Autowired
	private YongHuService yongHuService;

	@RequestMapping(value="/aaa")
	@ResponseBody
	public Map<String, Object> aaa(String mm) {
		
		System.out.println("mm==="+mm);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		YongHu yh = yongHuService.selectById("1");
		
		jsonMap.put("message", "ok");
		jsonMap.put("yh", yh);
		
		return jsonMap;
	}
}
