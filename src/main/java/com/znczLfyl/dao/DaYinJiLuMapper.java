package com.znczLfyl.dao;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface DaYinJiLuMapper {

	int add(DaYinJiLu dyjl);

	DaYinJiLu selectByTime(@Param("time") String time);

}
