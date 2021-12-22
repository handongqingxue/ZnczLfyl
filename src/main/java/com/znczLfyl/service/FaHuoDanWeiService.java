package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface FaHuoDanWeiService {

	public int add(FaHuoDanWei faHuoDanWei);

	public int deleteByIds(String ids);

	public int edit(FaHuoDanWei faHuoDanWei);

	public int queryForInt(String mc);

	public List<FaHuoDanWei> queryList(String mc, int page, int rows, String sort, String order);

	public FaHuoDanWei selectById(String id);

	List<FaHuoDanWei> queryCBBList();

}
