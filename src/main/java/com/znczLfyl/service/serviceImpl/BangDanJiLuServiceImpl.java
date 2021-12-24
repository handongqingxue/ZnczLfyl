package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class BangDanJiLuServiceImpl implements BangDanJiLuService {

	@Autowired
	private BangDanJiLuMapper bangDanJiLuDao;

	@Override
	public int add(BangDanJiLu bdjl) {
		// TODO Auto-generated method stub
		return bangDanJiLuDao.add(bdjl);
	}

	@Override
	public int queryForInt(String ddh) {
		// TODO Auto-generated method stub
		return bangDanJiLuDao.queryForInt(ddh);
	}

	@Override
	public List<BangDanJiLu> queryList(String ddh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return bangDanJiLuDao.queryList(ddh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public BangDanJiLu selectById(String id) {
		// TODO Auto-generated method stub
		return bangDanJiLuDao.selectById(id);
	}
}
