package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface DingDanService {

	int queryZHCXForInt(String ddh);

	List<DingDan> queryZHCXList(String ddh, int page, int rows, String sort, String order);

	int add(DingDan dd);

}