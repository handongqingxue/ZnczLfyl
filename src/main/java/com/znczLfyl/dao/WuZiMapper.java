package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface WuZiMapper {


	public int newWuZi(WuZi wz);

	public int deleteWuZi(List<String> idList);

	public int editWuZi(WuZi wz);

	public int queryWuZiForInt(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc);

	public List<WuZi> queryWuZiList(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc, int i, int rows, String sort, String order);

	public WuZi selectWuZiById(String id);
}
