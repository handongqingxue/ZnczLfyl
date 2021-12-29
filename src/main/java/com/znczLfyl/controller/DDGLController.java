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
import com.znczLfyl.util.JsonUtil;
import com.znczLfyl.util.PlanResult;

import net.sf.json.JSONObject;

import com.znczLfyl.entity.*;
import com.znczLfyl.controller.DDGLController;

/**
 * 订单状态：待审核-排队中-一检上磅-待一检审核-待入库-二检上磅-待二检审核-已完成
 * */
@Controller
@RequestMapping("/"+DDGLController.MODULE_NAME)
public class DDGLController {

	//@Autowired
	//private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private DingDanZhuangTaiService dingDanZhuangTaiService;
	public static final String MODULE_NAME="ddgl";
	
	@RequestMapping(value="/ddzt/new")
	public String goDdztNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/ddzt/new";
	}
	
	@RequestMapping(value="/ddzt/edit")
	public String goDdztEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		DingDanZhuangTai ddzt=dingDanZhuangTaiService.selectById(id);
		request.setAttribute("ddzt", ddzt);
		
		return MODULE_NAME+"/ddzt/edit";
	}

	/**
	 * 跳转到订单管理-订单状态-列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ddzt/list")
	public String goDdztList(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/ddzt/list";
	}
	
	@RequestMapping(value="/ddzt/detail")
	public String goDdztDetail(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		DingDanZhuangTai ddzt=dingDanZhuangTaiService.selectById(id);
		request.setAttribute("ddzt", ddzt);
		
		return MODULE_NAME+"/ddzt/detail";
	}
	
	@RequestMapping(value="/zhcx/new")
	public String goDdglZhcxNew(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		
		return MODULE_NAME+"/zhcx/new";
	}
	
	@RequestMapping(value="/zhcx/edit")
	public String goDdglZhcxEdit(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		DingDan dd=dingDanService.selectById(id);
		request.setAttribute("dd", dd);
		
		return MODULE_NAME+"/zhcx/edit";
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
	
	@RequestMapping(value="/zhcx/detail")
	public String goDdglZhcxDetail(HttpServletRequest request) {
		
		//publicService.selectNav(request);
		String id = request.getParameter("id");
		DingDan dd=dingDanService.selectById(id);
		request.setAttribute("dd", dd);
		
		return MODULE_NAME+"/zhcx/detail";
	}
	
	@RequestMapping(value="/newDingDanZhuangTai")
	@ResponseBody
	public Map<String, Object> newDingDanZhuangTai(DingDanZhuangTai ddzt) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=dingDanZhuangTaiService.add(ddzt);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建订单状态成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建订单状态失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/editDingDanZhuangTai")
	@ResponseBody
	public Map<String, Object> editDingDanZhuangTai(DingDanZhuangTai ddzt) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=dingDanZhuangTaiService.edit(ddzt);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑订单状态成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑订单状态失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryDDZTList")
	@ResponseBody
	public Map<String, Object> queryDDZTList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanZhuangTaiService.queryForInt(mc);
			List<DingDanZhuangTai> ddztList=dingDanZhuangTaiService.queryList(mc, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ddztList);
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

	@RequestMapping(value="/checkDingDanById",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String checkDingDanById(Integer id) {
		//TODO 针对分类的动态进行实时调整更新
		int count=dingDanService.checkById(id);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("审核订单失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("审核订单成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/deleteDingDan",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteDingDan(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=dingDanService.deleteByIds(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除订单失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除订单成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/editDingDanZongHeChaXun")
	@ResponseBody
	public Map<String, Object> editDingDanZongHeChaXun(DingDan dd,
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
	
	@RequestMapping(value="/queryZHCXList")
	@ResponseBody
	public Map<String, Object> queryZHCXList(String ddh,Integer ddztId,String cph,String yssMc,String wzMc,
			String fhdwMc,String shbmMc,String sjxm,String sjsfzh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryZHCXForInt(ddh,ddztId,cph,yssMc,wzMc,fhdwMc,shbmMc,sjxm,sjsfzh);
			List<DingDan> zhglList=dingDanService.queryZHCXList(ddh, ddztId,cph,yssMc,wzMc,fhdwMc,shbmMc,sjxm,sjsfzh, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/queryDingDanZhuangTaiCBBList")
	@ResponseBody
	public Map<String, Object> queryDingDanZhuangTaiCBBList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<DingDanZhuangTai> ddztList=dingDanZhuangTaiService.queryCBBList();
		
		jsonMap.put("rows", ddztList);
		
		return jsonMap;
	}
}
