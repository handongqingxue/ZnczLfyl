package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface GuoBangMapper {

	int queryZHCXForInt(@Param("ddh") String ddh);

	List<GuoBang> queryZHCXList(@Param("ddh") String ddh, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
