package com.znczLfyl.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znczLfyl.dao.*;
import com.znczLfyl.entity.*;
import com.znczLfyl.service.*;

@Service
public class RglrCphJiLuServiceImpl implements RglrCphJiLuService {

	@Autowired
	private RglrCphJiLuMapper rglrCphJiLuDao;

	@Override
	public int add(RglrCphJiLu rglrCphJiLu) {
		// TODO Auto-generated method stub
		return rglrCphJiLuDao.add(rglrCphJiLu);
	}

	@Override
	public boolean checkIfExist(String cph, Integer bfh) {
		// TODO Auto-generated method stub
		int count=rglrCphJiLuDao.getCount(cph,bfh);
		return count==0?false:true;
	}
}
