package com.znczLfyl.entity;

/**
 * �˹�¼�복�ƺż�¼
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
	private Integer bfh;//������
	private String lrsj;
}
