package com.lcomputerstudy.form.domain;

import java.util.List;

public class Allanswer {
	private int aaIdx;
	private int sIdx;
	private String sTitle;
	private List<Answer> aAnswerlist;
	
	public List<Answer> getaAnswerlist() {
		return aAnswerlist;
	}
	public void setaAnswerlist(List<Answer> aAnswerlist) {
		this.aAnswerlist = aAnswerlist;
	}
	public int getAaIdx() {
		return aaIdx;
	}
	public void setAaIdx(int aaIdx) {
		this.aaIdx = aaIdx;
	}
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
	@Override
	public String toString() {
		return "Allanswer [aaIdx=" + aaIdx + ", sIdx=" + sIdx + ", sTitle=" + sTitle + ", aAnswerlist=" + aAnswerlist
				+ "]";
	}
	
}
