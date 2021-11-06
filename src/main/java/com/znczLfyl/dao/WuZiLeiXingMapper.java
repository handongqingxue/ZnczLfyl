package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface WuZiLeiXingMapper {

	int add(WuZiLeiXing wzlx);

	int edit(WuZiLeiXing wzlx);

	int queryForInt(@Param("mc") String mc);

	List<WuZiLeiXing> queryList(@Param("mc") String mc, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	WuZiLeiXing selectById(@Param("id") String id);

	List<WuZiLeiXing> queryCBBList();

}