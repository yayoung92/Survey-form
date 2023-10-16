package com.lcomputerstudy.form.domain;

import java.util.List;

public class Response {
	private int qIdx;
	private int oIdx;
	private int sIdx;
	private String aAnswer;
	private List<Answer> aAnswerlist;
	
	public List<Answer> getaAnswerlist() {
		return aAnswerlist;
	}
	public void setaAnswerlist(List<Answer> aAnswerlist) {
		this.aAnswerlist = aAnswerlist;
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
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public String getaAnswer() {
		return aAnswer;
	}
	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}
}
