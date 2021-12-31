package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class CheLiangTaiZhangServiceImpl implements CheLiangTaiZhangService {

	@Autowired
	private CheLiangTaiZhangMapper cheLiangTaiZhangDao;

	@Override
	public int queryZHCXForInt(String cph, String jcsjks, String jcsjjs) {
		// TODO Auto-generated method stub
		return cheLiangTaiZhangDao.queryZHCXForInt(cph,jcsjks,jcsjjs);
	}

	@Override
	public List<CheLiangTaiZhang> queryZHCXList(String cph, String jcsjks, String jcsjjs, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return cheLiangTaiZhangDao.queryZHCXList(cph, jcsjks, jcsjjs, (page-1)*rows, rows, sort, order);
	}
}