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
	public int queryForInt(String ddh, String cph, String gbsjks, String gbsjjs) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryForInt(ddh, cph, gbsjks, gbsjjs);
	}

	@Override
	public List<GuoBangJiLu> queryList(String ddh, String cph, String gbsjks, String gbsjjs, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryList(ddh, cph, gbsjks, gbsjjs, (page-1)*rows, rows, sort, order);
	}

	@Override
	public GuoBangJiLu selectById(String id) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.selectById(id);
	}

	@Override
	public int queryJYJLForInt(String ddh, String cph, String gbsjks, String gbsjjs) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryJYJLForInt(ddh, cph, gbsjks, gbsjjs);
	}

	@Override
	public List<GuoBangJiLu> queryJYJLList(String ddh, String cph, String gbsjks, String gbsjjs, int page, int rows,
			String sort, String order) {
		// TODO Auto-generated method stub
		return guoBangJiLuDao.queryJYJLList(ddh, cph, gbsjks, gbsjjs, (page-1)*rows, rows, sort, order);
	}
}
