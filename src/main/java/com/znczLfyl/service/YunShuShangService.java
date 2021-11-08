package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface YunShuShangService {

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(String ids);

	public int editYunShuShang(YunShuShang yss);

	public int queryForInt(String mc);

	public List<YunShuShang> queryList(String mc, int page, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);
}