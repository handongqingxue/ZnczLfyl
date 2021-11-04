package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.WuZiLeiXing;

public interface WuZiLeiXingMapper {

	int queryForInt(@Param("mc") String mc);

	List<WuZiLeiXing> queryList(@Param("mc") String mc, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

}