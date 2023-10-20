package com.lcomputerstudy.form.domain;

import java.util.List;

public class ResponseVO {
	private int sIdx;
	private String qQuestion;
	private String aAnswer;
	private int count;
	
	public int getsTitle() {
		return sIdx;
	}
	public void setsTitle(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getqQuestionlist() {
		return qQuestion;
	}
	public void setqQuestionlist(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public String getaAnswerlist() {
		return aAnswer;
	}
	public void setaAnswerlist(String aAnswer) {
		this.aAnswer = aAnswer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ResponseVO [sIdx=" + sIdx + ", qQuestion=" + qQuestion + ", aAnswer=" + aAnswer
				+ ", count=" + count + "]";
	}
	
}
