package com.lcomputerstudy.form.domain;

public class Question {
	private int qIdx;
	private int qType;
	private String qQuestion;
	private int sIdx;
	
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
}
