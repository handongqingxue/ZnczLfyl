package com.znczLfyl.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class DingDanZhuangTaiServiceImpl implements DingDanZhuangTaiService {

	@Autowired
	private DingDanZhuangTaiMapper dingDanZhuangTaiDao;

	@Override
	public List<DingDanZhuangTai> queryCBBList() {
		// TODO Auto-generated method stub
		return dingDanZhuangTaiDao.queryCBBList();
	}
}
