package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface RglrCphJiLuService {

	int add(RglrCphJiLu rglrCphJiLu);

	boolean checkIfExist(String cph, Integer bfh);

	List<String> queryXzCphCBBList(int bfh, int page, int rows, String sort, String order);

}
