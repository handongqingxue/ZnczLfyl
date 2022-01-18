package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class QuanXianServiceImpl implements QuanXianService {
	
	@Autowired
	private QuanXianMapper quanXianDao;

	@Override
	public int add(QuanXian qx) {
		// TODO Auto-generated method stub
		return quanXianDao.add(qx);
	}

	@Override
	public int queryForInt(String mc) {
		// TODO Auto-generated method stub
		return quanXianDao.queryForInt(mc);
	}

	@Override
	public List<QuanXian> queryList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return quanXianDao.queryList(mc, (page-1)*rows, rows, sort, order);
	}

}
