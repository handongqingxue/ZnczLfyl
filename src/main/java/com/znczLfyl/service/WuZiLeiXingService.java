package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface WuZiLeiXingService {

	int queryForInt(String mc);

	List<WuZiLeiXing> queryList(String mc, int page, int rows, String sort, String order);

}
