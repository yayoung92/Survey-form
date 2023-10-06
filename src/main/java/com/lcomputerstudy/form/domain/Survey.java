package com.lcomputerstudy.form.domain;

public class Survey {
	private int sIdx; 	
	private String sTitle;	//설문 제목
	private String sDateTime;
	private int qCount; //질문 수
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDateTime() {
		return sDateTime;
	}
	public void setsDateTime(String sDateTime) {
		this.sDateTime = sDateTime;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

}
