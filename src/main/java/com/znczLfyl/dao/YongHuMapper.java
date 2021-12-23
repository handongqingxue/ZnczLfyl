package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface YongHuMapper {

	//ͨ���û���Ϣ��ѯ�û�
	public YongHu getYongHu(YongHu yh);

	int queryForInt(@Param("yhm") String yhm);
	
	List<YongHu> queryList(@Param("yhm") String yhm, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
