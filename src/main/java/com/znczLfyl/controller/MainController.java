package com.znczLfyl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znczLfyl.entity.*;
import com.znczLfyl.util.*;
import com.znczLfyl.service.*;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private UtilService utilService;
	@Autowired
	private YongHuService yongHuService;

	/**
	 * 跳转到登录页
	 * @return
	 */
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	@RequestMapping(value="/goRegist")
	public String goRegist(HttpServletRequest request) {
		
		return "regist";
	}
	
	/**
	 * 注册信息处理接口
	 * @param yh
	 * @return
	 */
	@RequestMapping(value = "/regist" , method = RequestMethod.POST,produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String regist(YongHu yh) {
		
		PlanResult plan=new PlanResult();
		int count=yongHuService.add(yh);
		if(count==0) {
			plan.setStatus(count);
			plan.setMsg("系统错误，请联系维护人员");
			return JsonUtil.getJsonFromObject(plan);
		}else {
			plan.setStatus(0);
			plan.setMsg("注册成功");
			plan.setData(yh);
			plan.setUrl("/main/goLogin");
		}
		
		return JsonUtil.getJsonFromObject(plan);
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST,produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String login(String yhm,String mm,
			String rememberMe,String loginVCode,HttpServletRequest request) {
		System.out.println("===登录接口===");
		//返回值的json
		PlanResult plan=new PlanResult();
		HttpSession session=request.getSession();
		String verifyCode = (String) session.getAttribute("验证码");
		System.out.println("verifyCode==="+verifyCode);
		System.out.println("loginVCode==="+loginVCode);
		if(verifyCode.equals(loginVCode)) {
			//TODO在这附近添加登录储存信息步骤，将用户的账号以及密码储存到shiro框架的管理配置当中方便后续查询
			try {
				System.out.println("验证码一致");
				UsernamePasswordToken token = new UsernamePasswordToken(yhm,mm); 
				Subject currentUser = SecurityUtils.getSubject();  
				if (!currentUser.isAuthenticated()){
					//使用shiro来验证  
					token.setRememberMe(true);  
					currentUser.login(token);//验证角色和权限  
				}
			}catch (Exception e) {
				e.printStackTrace();
				plan.setStatus(1);
				plan.setMsg("登陆失败");
				return JsonUtil.getJsonFromObject(plan);
			}
			YongHu yongHu=(YongHu)SecurityUtils.getSubject().getPrincipal();
			session.setAttribute("yongHu", yongHu);
			
			plan.setStatus(0);
			plan.setMsg("验证通过");
			plan.setUrl("/ddgl/zhcx/list");
			return JsonUtil.getJsonFromObject(plan);
		}
		plan.setStatus(1);
		plan.setMsg("验证码错误");
		return JsonUtil.getJsonFromObject(plan);
	}

	/**
	 * 为登录页面获取验证码
	 * @param session
	 * @param identity
	 * @param response
	 */
	@RequestMapping(value="/getKaptchaImage")
	public void getKaptchaImage(HttpSession session, String identity, HttpServletResponse response) {
		utilService.getKaptchaImage(session, identity, response);
	}
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) {
		System.out.println("退出接口");
		Subject currentUser = SecurityUtils.getSubject();       
	    currentUser.logout();    
		return "login";
	}
}
