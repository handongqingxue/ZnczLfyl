package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface FaHuoDanWeiMapper {

	public int add(FaHuoDanWei fhdw);

	public int queryForInt(@Param("mc") String mc);

	public List<FaHuoDanWei> queryList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public FaHuoDanWei selectById(String id);

}
