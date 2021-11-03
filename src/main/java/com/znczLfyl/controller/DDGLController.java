package com.znczLfyl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.znczLfyl.service.*;
import com.znczLfyl.controller.DDGLController;

@Controller
@RequestMapping("/"+DDGLController.MODULE_NAME)
public class DDGLController {

	//@Autowired
	//private PublicService publicService;
	public static final String MODULE_NAME="ddgl";

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
}
