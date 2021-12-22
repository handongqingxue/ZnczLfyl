package com.znczLfyl.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class DingDanServiceImpl implements DingDanService {

	@Autowired
	private DingDanMapper dingDanDao;
	@Autowired
	private DingDanZhuangTaiMapper dingDanZhuangTaiDao;

	@Override
	public int queryZHCXForInt(String ddh, Integer ddztId) {
		// TODO Auto-generated method stub
		return dingDanDao.queryZHCXForInt(ddh,ddztId);
	}

	@Override
	public List<DingDan> queryZHCXList(String ddh, Integer ddztId, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryZHCXList(ddh, ddztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public DingDan selectById(String id) {
		// TODO Auto-generated method stub
		return dingDanDao.selectById(id);
	}

	@Override
	public int add(DingDan dd) {
		// TODO Auto-generated method stub
		int ddztId=dingDanZhuangTaiDao.getIdByMc(DingDanZhuangTai.DAI_SHEN_HE_TEXT);
		dd.setDdztId(ddztId);
		return dingDanDao.add(dd);
	}

	@Override
	public int deleteByIds(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=dingDanDao.deleteByIds(idList);
		return count;
	}

	@Override
	public int edit(DingDan dd) {
		// TODO Auto-generated method stub
		int ddztId=dingDanZhuangTaiDao.getIdByMc(DingDanZhuangTai.PAI_DUI_ZHONG_TEXT);
		dd.setDdztId(ddztId);
		return dingDanDao.edit(dd);
	}
}