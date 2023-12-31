package com.lcomputerstudy.form.domain;

import java.util.List;

public class Question {
	private int qIdx;
	private int qType;
	private String qQuestion;
	private int sIdx;
	private List<Options> oOption;
	private int oIdx;

	public List<Options> getoOption() {
		return oOption;
	}
	public void setoOption(List<Options> oOption) {
		this.oOption = oOption;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public int getqType() {
		return qType;
	}
	public void setqType(int qType) {
		this.qType = qType;
	}
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	@Override
	public String toString() {
		return "Question [qIdx=" + qIdx + ", qType=" + qType + ", qQuestion=" + qQuestion + ", sIdx=" + sIdx
				+ ", oOption=" + oOption + ", oIdx=" + oIdx + "]";
	}
	
	
}
