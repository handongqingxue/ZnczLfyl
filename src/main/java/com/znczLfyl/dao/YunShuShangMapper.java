package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface YunShuShangMapper {

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(List<String> idList);

	public int editYunShuShang(YunShuShang yss);

	public int queryForInt(@Param("mc") String mc);

	public List<YunShuShang> queryList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);
}
