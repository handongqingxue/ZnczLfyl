package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class FaHuoDanWeiServiceImpl implements FaHuoDanWeiService {

	@Autowired
	private FaHuoDanWeiMapper faHuoDanWeiDao;

	@Override
	public int queryForInt(String mc) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.queryForInt(mc);
	}

	@Override
	public List<FaHuoDanWei> queryList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.queryList(mc, (page-1)*rows, rows, sort, order);
	}
}
