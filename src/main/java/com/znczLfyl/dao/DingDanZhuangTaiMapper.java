package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface DingDanZhuangTaiMapper {

	List<DingDanZhuangTai> queryCBBList();

	int getIdByMc(@Param("mc") String mc);
}
