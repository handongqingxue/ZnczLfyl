package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface QuanXianService {

	int add(QuanXian qx);

	int queryForInt(String mc);

	List<QuanXian> queryList(String mc, int page, int rows, String sort, String order);

}
