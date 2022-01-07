package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface GuoBangJiLuMapper {

	int add(GuoBangJiLu gbjl);

	int edit(GuoBangJiLu gbjl);

	int queryForInt(@Param("ddh") String ddh, @Param("cph") String cph, @Param("gbsjks") String gbsjks, @Param("gbsjjs") String gbsjjs);

	List<GuoBangJiLu> queryList(@Param("ddh") String ddh, @Param("cph") String cph, @Param("gbsjks") String gbsjks, @Param("gbsjjs") String gbsjjs, 
			@Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
	
	GuoBangJiLu selectById(@Param("id") String id);

	int queryJYJLForInt(@Param("ddh") String ddh, @Param("cph") String cph, @Param("gbsjks") String gbsjks, @Param("gbsjjs") String gbsjjs);

	List<GuoBangJiLu> queryJYJLList(@Param("ddh") String ddh, @Param("cph") String cph, @Param("gbsjks") String gbsjks, @Param("gbsjjs") String gbsjjs, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort,
			String order);
}
