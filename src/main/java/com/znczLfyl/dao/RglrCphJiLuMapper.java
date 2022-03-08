package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface RglrCphJiLuMapper {

	int add(RglrCphJiLu rglrCphJiLu);

	int getCount(@Param("cph") String cph, @Param("bfh") Integer bfh);

	List<String> queryXzCphCBBList(@Param("bfh") int bfh, @Param("rowNum") int rowNum, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order);
}
