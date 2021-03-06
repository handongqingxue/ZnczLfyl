package com.znczLfyl.service.serviceImpl;

import java.util.Arrays;
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
	public int edit(YongHu yh) {
		// TODO Auto-generated method stub
		return yongHuDao.edit(yh);
	}

	@Override
	public int queryForInt(String yhm,Boolean check) {
		// TODO Auto-generated method stub
		return yongHuDao.queryForInt(yhm,check);
	}

	@Override
	public List<YongHu> queryList(String yhm, Boolean check, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return yongHuDao.queryList(yhm, check, (page-1)*rows, rows, sort, order);
	}

	@Override
	public YongHu selectById(String id) {
		// TODO Auto-generated method stub
		return yongHuDao.selectById(id);
	}

	@Override
	public int checkByIds(Boolean check, String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = yongHuDao.checkByIds(check,idList);
		return count;
	}
}
