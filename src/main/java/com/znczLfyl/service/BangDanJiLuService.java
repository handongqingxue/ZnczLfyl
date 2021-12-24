package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface BangDanJiLuService {

	int add(BangDanJiLu bdjl);

	int queryForInt(String ddh);

	List<BangDanJiLu> queryList(String ddh, int page, int rows, String sort, String order);
}
