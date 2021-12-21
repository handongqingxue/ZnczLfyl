package com.znczLfyl.entity;

public class DingDan {

	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDdh() {
		return ddh;
	}
	public void setDdh(String ddh) {
		this.ddh = ddh;
	}
	public Integer getDdztId() {
		return ddztId;
	}
	public void setDdztId(Integer ddztId) {
		this.ddztId = ddztId;
	}
	public String getDdztMc() {
		return ddztMc;
	}
	public void setDdztMc(String ddztMc) {
		this.ddztMc = ddztMc;
	}
	public String getSjsfzh() {
		return sjsfzh;
	}
	public void setSjsfzh(String sjsfzh) {
		this.sjsfzh = sjsfzh;
	}
	public String getSjxm() {
		return sjxm;
	}
	public void setSjxm(String sjxm) {
		this.sjxm = sjxm;
	}
	public String getCph() {
		return cph;
	}
	public void setCph(String cph) {
		this.cph = cph;
	}
	public Integer getLxlx() {
		return lxlx;
	}
	public void setLxlx(Integer lxlx) {
		this.lxlx = lxlx;
	}
	public Float getYzxzl() {
		return yzxzl;
	}
	public void setYzxzl(Float yzxzl) {
		this.yzxzl = yzxzl;
	}
	public Float getSjzl() {
		return sjzl;
	}
	public void setSjzl(Float sjzl) {
		this.sjzl = sjzl;
	}
	public Float getZlceb() {
		return zlceb;
	}
	public void setZlceb(Float zlceb) {
		this.zlceb = zlceb;
	}
	public Integer getWzlxId() {
		return wzlxId;
	}
	public void setWzlxId(Integer wzlxId) {
		this.wzlxId = wzlxId;
	}
	public String getWzlxMc() {
		return wzlxMc;
	}
	public void setWzlxMc(String wzlxMc) {
		this.wzlxMc = wzlxMc;
	}
	public Integer getWzId() {
		return wzId;
	}
	public void setWzId(Integer wzId) {
		this.wzId = wzId;
	}
	public String getWzMc() {
		return wzMc;
	}
	public void setWzMc(String wzMc) {
		this.wzMc = wzMc;
	}
	public String getBjsj() {
		return bjsj;
	}
	public void setBjsj(String bjsj) {
		this.bjsj = bjsj;
	}
	private String ddh;//订单号
	private Integer ddztId;
	private String ddztMc;
	private String sjsfzh;
	private String sjxm;
	private String cph;
	private Integer lxlx;//流向类型
	private Float yzxzl;//预装卸重量
	private Float sjzl;//实际重量
	private Float zlceb;//重量差额比
	private Integer wzlxId;
	private String wzlxMc;
	private Integer wzId;
	private String wzMc;
	private String bjsj;//编辑时间
}