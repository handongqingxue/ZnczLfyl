package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface GuoBangJiLuService {

	int add(GuoBangJiLu gbjl);

	int edit(GuoBangJiLu gbjl);

	int queryForInt(String ddh, String cph, String gbsjks, String gbsjjs);

	List<GuoBangJiLu> queryList(String ddh, String cph, String gbsjks, String gbsjjs, int page, int rows, String sort, String order);

	GuoBangJiLu selectById(String id);

	int queryJYJLForInt(String ddh, String ddztMc, String sjxm, String sjsfzh, String cph, String yssMc, String fhdwMc, String shbmMc, String gbsjks, String gbsjjs);

	List<GuoBangJiLu> queryJYJLList(String ddh, String ddztMc, String sjxm, String sjsfzh, String cph, String yssMc, String fhdwMc, String shbmMc, String gbsjks, String gbsjjs, int page, int rows,
			String sort, String order);

}
