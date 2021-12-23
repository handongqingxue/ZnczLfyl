package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface YongHuService {

	int queryForInt(String yhm);

	List<YongHu> queryList(String yhm, int page, int rows, String sort, String order);
}
