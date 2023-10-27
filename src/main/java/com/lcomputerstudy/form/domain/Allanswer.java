package com.lcomputerstudy.form.domain;

import java.util.List;

public class Allanswer {
	private int aaIdx;
	private int sIdx;
	private String sTitle;
	private List<Answer> aAnswerlist;
	private String qQuestion;
	private String aAnswer;
	private int count;
	
	public String getaAnswer() {
		return aAnswer;
	}
	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "[" + "aAnswer="+ "\"" + aAnswer + "\"" + ", count=" + count + "]";
	}

	
}
