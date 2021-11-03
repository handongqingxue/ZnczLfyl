package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface DingDanMapper {

	int queryZHCXForInt(@Param("ddh") String ddh);

	List<DingDan> queryZHCXList(@Param("ddh") String ddh, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	int add(DingDan dd);

}