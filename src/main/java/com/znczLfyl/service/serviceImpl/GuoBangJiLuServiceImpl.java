package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class GuoBangJiLuServiceImpl implements GuoBangJiLuService {

	@Autowired
	private GuoBangJiLuMapper guoBangJiLuDao;

	@Override
	public int add(GuoBangJiLu gbjl) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.add(gbjl);
	}

	@Override
	public int edit(GuoBangJiLu gbjl) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.edit(gbjl);
	}

	@Override
	public int queryForInt(String ddh) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryForInt(ddh);
	}

	@Override
	public List<GuoBangJiLu> queryList(String ddh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryList(ddh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public GuoBangJiLu selectById(String id) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.selectById(id);
	}
}
