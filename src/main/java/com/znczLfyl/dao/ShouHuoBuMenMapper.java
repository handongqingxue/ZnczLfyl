package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface ShouHuoBuMenMapper {

	public int add(ShouHuoBuMen shbm);

	public int queryForInt(@Param("mc") String mc);

	public List<ShouHuoBuMen> queryList(@Param("mc") String mc, int i, int rows, String sort, String order);

}
