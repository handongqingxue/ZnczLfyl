package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface RglrCphJiLuMapper {

	int add(RglrCphJiLu rglrCphJiLu);

	int getCount(@Param("cph") String cph);

	List<String> queryXzCphCBBList(@Param("rowNum") int rowNum, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order);

	List<RglrCphJiLu> queryLrCphCBBList(@Param("sjc") String sjc, @Param("cph") String cph, @Param("rowNum") int rowNum, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order);

	List<RglrCphJiLu> queryLrSjcCBBList(@Param("sjc") String sjc, @Param("rowNum") int rowNum, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order);
}
