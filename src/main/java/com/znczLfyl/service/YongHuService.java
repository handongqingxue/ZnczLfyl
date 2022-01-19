package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface YongHuService {
	
	int add(YongHu yh);

	int queryForInt(String yhm,Boolean check);

	List<YongHu> queryList(String yhm, Boolean check, int page, int rows, String sort, String order);

	YongHu selectById(String id);

	int checkByIds(Boolean check, String ids);
}
