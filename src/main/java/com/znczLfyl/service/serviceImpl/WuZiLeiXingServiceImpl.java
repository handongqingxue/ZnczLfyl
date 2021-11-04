package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.WuZiLeiXing;
import com.znczLfyl.service.*;

@Service
public class WuZiLeiXingServiceImpl implements WuZiLeiXingService {

	@Autowired
	private WuZiLeiXingMapper wuZiLeiXingDao;

	@Override
	public int queryForInt(String mc) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.queryForInt(mc);
	}

	@Override
	public List<WuZiLeiXing> queryList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.queryList(mc, (page-1)*rows, rows, sort, order);
	}
}
