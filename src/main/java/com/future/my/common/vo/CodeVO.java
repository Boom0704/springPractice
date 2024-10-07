package com.future.my.common.vo;

/**
 * @author 202-26
 *
 */
public class CodeVO {
	private String commCD;
	private String commNm;
	private String commParent;
	public String getCommCD() {
		return commCD;
	}
	public void setCommCD(String commCD) {
		this.commCD = commCD;
	}
	public String getCommNm() {
		return commNm;
	}
	public void setCommNm(String commNm) {
		this.commNm = commNm;
	}
	public String getCommParent() {
		return commParent;
	}
	public void setCommParent(String commParent) {
		this.commParent = commParent;
	}
	@Override
	public String toString() {
		return "CodeVO [commCD=" + commCD + ", commNm=" + commNm + ", commParent=" + commParent + "]";
	}

}
