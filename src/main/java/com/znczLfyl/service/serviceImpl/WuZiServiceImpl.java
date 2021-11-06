package com.znczLfyl.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class WuZiServiceImpl implements WuZiService {

	@Autowired
	private WuZiMapper wuZiDao;
	
	@Override
	public int add(WuZi wz) {
		// TODO Auto-generated method stub
		return wuZiDao.add(wz);
	}

	@Override
	public int deleteByIds(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=wuZiDao.deleteByIds(idList);
		return count;
	}

	@Override
	public int edit(WuZi wz) {
		// TODO Auto-generated method stub
		return wuZiDao.edit(wz);
	}

	@Override
	public int queryForInt(String mc, String wzlxmc) {
		// TODO Auto-generated method stub
		return wuZiDao.queryForInt(mc,wzlxmc);
	}

	@Override
	public List<WuZi> queryList(String mc, String wzlxmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return wuZiDao.queryList(mc, wzlxmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZi selectById(String id) {
		// TODO Auto-generated method stub
		return wuZiDao.selectById(id);
	}

	@Override
	public List<WuZi> queryCBBList(String wzlxId) {
		// TODO Auto-generated method stub
		return wuZiDao.queryCBBList(wzlxId);
	}
}
