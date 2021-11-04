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
	public int newWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return wuZiDao.newWuZi(wz);
	}

	@Override
	public int deleteWuZi(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=wuZiDao.deleteWuZi(idList);
		return count;
	}

	@Override
	public int editWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return wuZiDao.editWuZi(wz);
	}

	@Override
	public int queryWuZiForInt(String mc, String wzlxmc) {
		// TODO Auto-generated method stub
		return wuZiDao.queryWuZiForInt(mc,wzlxmc);
	}

	@Override
	public List<WuZi> queryWuZiList(String mc, String wzlxmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return wuZiDao.queryWuZiList(mc, wzlxmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZi selectWuZiById(String id) {
		// TODO Auto-generated method stub
		return wuZiDao.selectWuZiById(id);
	}
}
