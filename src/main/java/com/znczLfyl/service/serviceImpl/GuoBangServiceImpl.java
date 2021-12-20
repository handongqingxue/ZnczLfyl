package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class GuoBangServiceImpl implements GuoBangService {

	@Autowired
	private GuoBangMapper guoBangDao;

	@Override
	public int add(GuoBang gb) {
		// TODO Auto-generated method stub
		return guoBangDao.add(gb);
	}

	@Override
	public int queryZHCXForInt(String ddh) {
		// TODO Auto-generated method stub
		return guoBangDao.queryZHCXForInt(ddh);
	}

	@Override
	public List<GuoBang> queryZHCXList(String ddh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return guoBangDao.queryZHCXList(ddh, (page-1)*rows, rows, sort, order);
	}
}
