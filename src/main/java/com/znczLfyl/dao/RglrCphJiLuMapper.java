package com.znczLfyl.dao;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface RglrCphJiLuMapper {

	int add(RglrCphJiLu rglrCphJiLu);

	int getCount(@Param("cph") String cph, @Param("bfh") Integer bfh);
}
