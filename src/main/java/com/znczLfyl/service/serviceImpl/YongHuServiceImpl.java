package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class YongHuServiceImpl implements YongHuService {

	@Autowired
	private YongHuMapper yongHuDao;

	@Override
	public int add(YongHu yh) {
		// TODO Auto-generated method stub
		return yongHuDao.add(yh);
	}

	@Override
	public int queryForInt(String yhm) {
		// TODO Auto-generated method stub
		return yongHuDao.queryForInt(yhm);
	}

	@Override
	public List<YongHu> queryList(String yhm, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return yongHuDao.queryList(yhm, (page-1)*rows, rows, sort, order);
	}
}
