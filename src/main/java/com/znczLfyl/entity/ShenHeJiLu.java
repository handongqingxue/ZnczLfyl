package com.znczLfyl.entity;

public class ShenHeJiLu {
	
	public static final Integer XIA_DAN_SHEN_HE=1;
	public static final Integer YI_JIAN_SHEN_HE=2;
	public static final Integer RU_KU_SHEN_HE=3;
	public static final Integer ER_JIAN_SHEN_HE=4;

	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShlx() {
		return shlx;
	}
	public void setShlx(Integer shlx) {
		this.shlx = shlx;
	}
	public String getShsj() {
		return shsj;
	}
	public void setShsj(String shsj) {
		this.shsj = shsj;
	}
	public Boolean getShjg() {
		return shjg;
	}
	public void setShjg(Boolean shjg) {
		this.shjg = shjg;
	}
	public Integer getShrId() {
		return shrId;
	}
	public void setShrId(Integer shrId) {
		this.shrId = shrId;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	private Integer shlx;//������� 1.�µ���� 2.һ����� 3.������ 4.�������
	private String shsj;//���ʱ��
	private Boolean shjg;//��˽��
	private Integer shrId;//�����id
	private String bz;//��ע
}
