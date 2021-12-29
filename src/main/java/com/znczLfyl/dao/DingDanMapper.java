package com.znczLfyl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znczLfyl.entity.*;

public interface DingDanMapper {

	int queryZHCXForInt(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, @Param("cph") String cph, @Param("yssMc") String yssMc, @Param("wzMc") String wzMc, 
			@Param("fhdwMc") String fhdwMc, @Param("shbmMc") String shbmMc, @Param("sjxm") String sjxm, @Param("sjsfzh") String sjsfzh);

	List<DingDan> queryZHCXList(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, @Param("cph") String cph, @Param("yssMc") String yssMc, @Param("wzMc") String wzMc, 
			@Param("fhdwMc") String fhdwMc, @Param("shbmMc") String shbmMc, @Param("sjxm") String sjxm, @Param("sjsfzh") String sjsfzh, 
			@Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	DingDan selectById(@Param("id") String id);

	int add(DingDan dd);

	int deleteByIds(List<String> idList);

	int edit(DingDan dd);

}