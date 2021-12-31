package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface CheLiangTaiZhangMapper {

	int queryZHCXForInt(@Param("cph") String cph, @Param("jcsjks") String jcsjks, @Param("jcsjjs") String jcsjjs);
	
	List<CheLiangTaiZhang> queryZHCXList(@Param("cph") String cph, @Param("jcsjks") String jcsjks, @Param("jcsjjs") String jcsjjs, 
			@Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
