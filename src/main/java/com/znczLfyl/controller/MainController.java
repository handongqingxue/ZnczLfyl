package com.znczLfyl.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.znczLfyl.service.*;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private UtilService utilService;

	/**
	 * ��ת����¼ҳ
	 * @return
	 */
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}

	/**
	 * Ϊ��¼ҳ���ȡ��֤��
	 * @param session
	 * @param identity
	 * @param response
	 */
	@RequestMapping(value="/getKaptchaImage")
	public void getKaptchaImage(HttpSession session, String identity, HttpServletResponse response) {
		utilService.getKaptchaImage(session, identity, response);
	}
}
