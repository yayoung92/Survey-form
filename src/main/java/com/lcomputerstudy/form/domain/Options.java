package com.lcomputerstudy.form.domain;

public class Options {
	private int rId;		//객관식 option 번호
	private int qIdx;		//question 번호
	private String rOption;	//객관식 질문
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getrOption() {
		return rOption;
	}
	public void setrOption(String rOption) {
		this.rOption = rOption;
	}
}
