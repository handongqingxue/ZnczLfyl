package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface YongHuMapper {

	int add(YongHu yh);

	int edit(YongHu yh);
	
	//通过用户信息查询用户
	YongHu getYongHu(YongHu yh);

	int queryForInt(@Param("yhm") String yhm,@Param("check") Boolean check);
	
	List<YongHu> queryList(@Param("yhm") String yhm, @Param("check") Boolean check, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
	
	YongHu selectById(@Param("id") String id);

	int checkByIds(@Param("check") Boolean check, @Param("idList") List<String> idList);
}
