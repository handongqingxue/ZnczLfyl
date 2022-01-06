package com.znczLfyl.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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
	public int queryZHCXForInt(String ddh, Integer ddztId, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh) {
		// TODO Auto-generated method stub
		return dingDanDao.queryZHCXForInt(ddh,ddztId,cph,yssMc,wzMc,fhdwMc,shbmMc,sjxm,sjsfzh);
	}

	@Override
	public List<DingDan> queryZHCXList(String ddh, Integer ddztId, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryZHCXList(ddh, ddztId, cph, yssMc, wzMc, fhdwMc, shbmMc, sjxm, sjsfzh, (page-1)*rows, rows, sort, order);
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
		int ddztId=dingDanZhuangTaiDao.getIdByMc(dd.getDdztMc());
		dd.setDdztId(ddztId);
		return dingDanDao.edit(dd);
	}

	@Override
	public int editByZt(DingDan dd) {
		// TODO Auto-generated method stub
		int ddztId=dingDanZhuangTaiDao.getIdByMc(dd.getDdztMc());
		dd.setDdztId(ddztId);
		String xddztMc = dd.getXddztMc();
		if(!StringUtils.isEmpty(xddztMc)) {
			int xddztId=dingDanZhuangTaiDao.getIdByMc(dd.getXddztMc());
			dd.setXddztId(xddztId);
		}
		return dingDanDao.editByZt(dd);
	}

	@Override
	public int checkById(Integer id) {
		// TODO Auto-generated method stub
		int ddztId=dingDanZhuangTaiDao.getIdByMc(DingDanZhuangTai.YI_SHEN_HE_TEXT);
		DingDan dd=new DingDan();
		dd.setId(id);
		dd.setDdztId(ddztId);
		return dingDanDao.edit(dd);
	}

	@Override
	public DingDan getDingDan(String cph, String ddztMc) {
		// TODO Auto-generated method stub
		int ddztId=dingDanZhuangTaiDao.getIdByMc(ddztMc);
		DingDan dd = dingDanDao.getByZtCph(ddztId,cph);
		return dd;
	}

	@Override
	public DingDan getByZt(String ddztMc, Integer yjzt, Integer ejzt) {
		// TODO Auto-generated method stub
		return dingDanDao.getByZt(ddztMc, yjzt, ejzt);
	}
}