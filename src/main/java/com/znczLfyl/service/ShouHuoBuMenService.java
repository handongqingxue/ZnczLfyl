package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface ShouHuoBuMenService {

	public int add(ShouHuoBuMen shbm);

	public int queryForInt(String mc);

	public List<ShouHuoBuMen> queryList(String mc, int page, int rows, String sort, String order);

}
