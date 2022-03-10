package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface RglrCphJiLuService {

	int add(RglrCphJiLu rglrCphJiLu);

	boolean checkIfExist(String cph);

	List<String> queryXzCphCBBList(int page, int rows, String sort, String order);

	List<RglrCphJiLu> queryLrSjcCBBList(String sjc, int page, int rows, String sort, String order);

	List<RglrCphJiLu> queryLrWscphCBBList(String sjc, String wscph, int page, int rows, String sort, String order);

}
