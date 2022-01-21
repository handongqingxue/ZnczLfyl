package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface DingDanService {

	int queryZHCXForInt(String ddh, Integer ddztId, String ddztMc, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh);

	List<DingDan> queryZHCXList(String ddh, Integer ddztId, String ddztMc, String cph, String yssMc, String wzMc, 
			String fhdwMc, String shbmMc, String sjxm, String sjsfzh, int page, int rows, String sort, String order);

	DingDan selectById(String id);

	int add(DingDan dd);

	int deleteByIds(String ids);

	int edit(DingDan dd);

	int editByZt(DingDan dd);

	int checkByIds(String ids,String ddztMc,ShenHeJiLu shjl);

	DingDan getDingDan(String cph, String ddztMc);

	DingDan getByZt(String ddztMc, Integer yjzt, Integer ejzt);

	boolean checkDdhIfExist(String ddh);

	boolean checkIfExistByZt(String ddztMc, Integer yjzt, Integer ejzt);

}