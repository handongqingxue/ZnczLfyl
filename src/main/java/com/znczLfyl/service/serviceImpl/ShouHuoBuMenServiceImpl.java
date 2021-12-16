package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class ShouHuoBuMenServiceImpl implements ShouHuoBuMenService {

	@Autowired
	private ShouHuoBuMenMapper shouHuoBuMenDao;
	
	@Override
	public int add(ShouHuoBuMen shbm) {
		// TODO Auto-generated method stub
		return shouHuoBuMenDao.add(shbm);
	}

	@Override
	public int queryForInt(String mc) {
		// TODO Auto-generated method stub
		return shouHuoBuMenDao.queryForInt(mc);
	}

	@Override
	public List<ShouHuoBuMen> queryList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return shouHuoBuMenDao.queryList(mc, (page-1)*rows, rows, sort, order);
	}
}
