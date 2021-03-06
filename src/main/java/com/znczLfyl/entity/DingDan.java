package com.znczLfyl.entity;

public class DingDan {
	
	/**
	 * 待上磅
	 */
	public static final Integer DAI_SHANG_BANG=1;
	/**
	 * 上磅中
	 */
	public static final Integer SHANG_BANG_ZHONG=2;
	/**
	 * 待称重
	 */
	public static final Integer DAI_CHENG_ZHONG=3;
	/**
	 * 称重中
	 */
	public static final Integer CHENG_ZHONG_ZHONG=4;
	/**
	 * 待下磅
	 */
	public static final Integer DAI_XIA_BANG=5;
	/**
	 * 下磅中
	 */
	public static final Integer XIA_BANG_ZHONG=6;
	/**
	 * 已完成
	 */
	public static final Integer YI_WAN_CHENG=7;

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
	public Integer getXddztId() {
		return xddztId;
	}
	public void setXddztId(Integer xddztId) {
		this.xddztId = xddztId;
	}
	public String getXddztMc() {
		return xddztMc;
	}
	public void setXddztMc(String xddztMc) {
		this.xddztMc = xddztMc;
	}
	public Integer getYjzt() {
		return yjzt;
	}
	public void setYjzt(Integer yjzt) {
		this.yjzt = yjzt;
	}
	public Integer getXyjzt() {
		return xyjzt;
	}
	public void setXyjzt(Integer xyjzt) {
		this.xyjzt = xyjzt;
	}
	public Integer getEjzt() {
		return ejzt;
	}
	public void setEjzt(Integer ejzt) {
		this.ejzt = ejzt;
	}
	public Integer getXejzt() {
		return xejzt;
	}
	public void setXejzt(Integer xejzt) {
		this.xejzt = xejzt;
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
	public Integer getYjbfh() {
		return yjbfh;
	}
	public void setYjbfh(Integer yjbfh) {
		this.yjbfh = yjbfh;
	}
	public Integer getEjbfh() {
		return ejbfh;
	}
	public void setEjbfh(Integer ejbfh) {
		this.ejbfh = ejbfh;
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
	public Integer getYssId() {
		return yssId;
	}
	public void setYssId(Integer yssId) {
		this.yssId = yssId;
	}
	public String getYssMc() {
		return yssMc;
	}
	public void setYssMc(String yssMc) {
		this.yssMc = yssMc;
	}
	public Integer getFhdwId() {
		return fhdwId;
	}
	public void setFhdwId(Integer fhdwId) {
		this.fhdwId = fhdwId;
	}
	public String getFhdwMc() {
		return fhdwMc;
	}
	public void setFhdwMc(String fhdwMc) {
		this.fhdwMc = fhdwMc;
	}
	public Integer getShbmId() {
		return shbmId;
	}
	public void setShbmId(Integer shbmId) {
		this.shbmId = shbmId;
	}
	public String getShbmMc() {
		return shbmMc;
	}
	public void setShbmMc(String shbmMc) {
		this.shbmMc = shbmMc;
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
	private Integer xddztId;//新订单状态id
	private String xddztMc;//新订单状态名称
	private Integer yjzt;//一检状态(1.待上磅 2.上磅中 3.已完成)
	private Integer xyjzt;//新一检状态(1.待上磅 2.上磅中 3.已完成)
	private Integer ejzt;//二检状态(1.待上磅 2.上磅中 3.已完成)
	private Integer xejzt;//新二检状态(1.待上磅 2.上磅中 3.已完成)
	private String sjsfzh;
	private String sjxm;
	private String cph;
	private Integer yjbfh=0;//一检磅房号
	private Integer ejbfh=0;//二检磅房号
	private Integer lxlx;//流向类型
	private Float yzxzl;//预装卸重量
	private Float sjzl;//实际重量
	private Float zlceb;//重量差额比
	private Integer wzlxId;
	private String wzlxMc;
	private Integer wzId;
	private String wzMc;
	private Integer yssId;
	private String yssMc;
	private Integer fhdwId;
	private String fhdwMc;
	private Integer shbmId;
	private String shbmMc;
	private String bjsj;//编辑时间
}