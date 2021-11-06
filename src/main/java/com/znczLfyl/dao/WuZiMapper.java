package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface WuZiMapper {


	public int add(WuZi wz);

	public int deleteByIds(List<String> idList);

	public int edit(WuZi wz);

	public int queryForInt(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc);

	public List<WuZi> queryList(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc, int i, int rows, String sort, String order);

	public WuZi selectById(String id);

	public List<WuZi> queryCBBList(@Param("wzlxId") String wzlxId);
}
