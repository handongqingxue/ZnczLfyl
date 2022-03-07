package com.znczLfyl.entity;

/**
 * 人工录入车牌号记录
 * */
public class RglrCphJiLu {

	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCph() {
		return cph;
	}
	public void setCph(String cph) {
		this.cph = cph;
	}
	public Integer getBfh() {
		return bfh;
	}
	public void setBfh(Integer bfh) {
		this.bfh = bfh;
	}
	public String getLrsj() {
		return lrsj;
	}
	public void setLrsj(String lrsj) {
		this.lrsj = lrsj;
	}
	private String cph;
	private Integer bfh;//磅房号
	private String lrsj;
}
