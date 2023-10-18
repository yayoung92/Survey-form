package com.lcomputerstudy.form.domain;

import java.util.List;

public class Answer {
	private int aId;
	private int sIdx;
	private int qIdx;
	private int oIdx;
	private String oOption;
//	private List<Answer> aAnswerlist;
	
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
//	public List<Answer> getaAnswerlist() {
//		return aAnswerlist;
//	}
//	public void setaAnswerlist(List<Answer> aAnswerlist) {
//		this.aAnswerlist = aAnswerlist;
//	}
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getoOption() {
		return oOption;
	}
	public void setoOption(String oOption) {
		this.oOption = oOption;
	}
	@Override
	public String toString() {
		return "\"" + oOption + "\"";
	}

}
