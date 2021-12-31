package com.znczLfyl.service;

import java.util.List;

import com.znczLfyl.entity.*;

public interface CheLiangTaiZhangService {

	int queryZHCXForInt(String cph, String jcsjks, String jcsjjs);

	List<CheLiangTaiZhang> queryZHCXList(String cph, String jcsjks, String jcsjjs, int page, int rows, String sort, String order);
}
