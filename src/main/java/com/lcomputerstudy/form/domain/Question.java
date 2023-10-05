package com.lcomputerstudy.form.domain;

public class Question {
	private int qIdx;
	private String qType;
	private String qQuestion;
	private int sIdx;
	private String qOption;
	
	public String getqOption() {
		return qOption;
	}
	public void setqOption(String qOption) {
		this.qOption = qOption;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
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
}
