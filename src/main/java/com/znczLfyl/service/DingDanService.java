package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface DingDanService {

	int queryZHCXForInt(String ddh, Integer ddztId);

	List<DingDan> queryZHCXList(String ddh, Integer ddztId, int page, int rows, String sort, String order);

	DingDan selectById(String id);

	int add(DingDan dd);

	int deleteByIds(String ids);

	int edit(DingDan dd);

}