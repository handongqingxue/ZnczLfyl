package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface GuoBangJiLuService {

	int add(GuoBangJiLu gbjl);

	int edit(GuoBangJiLu gbjl);

	int queryForInt(String ddh);

	List<GuoBangJiLu> queryList(String ddh, int page, int rows, String sort, String order);

	GuoBangJiLu selectById(String id);

}
