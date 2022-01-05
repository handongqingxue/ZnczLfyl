package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface DingDanService {

	int queryZHCXForInt(String ddh, Integer ddztId, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh);

	List<DingDan> queryZHCXList(String ddh, Integer ddztId, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh, int page, int rows, String sort, String order);

	DingDan selectById(String id);

	int add(DingDan dd);

	int deleteByIds(String ids);

	int edit(DingDan dd);

	int checkById(Integer id);

	DingDan getDingDan(String cph, String ddztMc);

}