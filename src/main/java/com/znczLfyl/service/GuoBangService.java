package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface GuoBangService {

	int add(GuoBang gb);

	int queryZHCXForInt(String ddh);

	List<GuoBang> queryZHCXList(String ddh, int page, int rows, String sort, String order);

}
