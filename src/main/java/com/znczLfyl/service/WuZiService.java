package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface WuZiService {


	public int add(WuZi wz);

	public int deleteWuZi(String ids);

	public int edit(WuZi wz);

	public int queryForInt(String mc, String wzlxmc);

	public List<WuZi> queryList(String mc, String wzlxmc, int page, int rows, String sort, String order);

	public WuZi selectById(String id);
}
