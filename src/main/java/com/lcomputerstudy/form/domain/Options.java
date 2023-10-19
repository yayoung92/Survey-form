package com.lcomputerstudy.form.domain;

public class Options {
	private int oIdx;		
	private int qIdx;		//객관식 type 번호
	private String oOption;	//객관식 질문
	private int sIdx;
	
	public Options(String oOption) {
		this.oOption = oOption;
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
}
