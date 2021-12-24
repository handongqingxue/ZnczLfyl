package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface BangDanJiLuMapper {

	int add(BangDanJiLu bdjl);

	int queryForInt(@Param("ddh") String ddh);
	
	List<BangDanJiLu> queryList(@Param("ddh") String ddh, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
