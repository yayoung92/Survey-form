package com.lcomputerstudy.form.domain;

import java.util.List;

public class Answer {
	private int aId;
	private int sIdx;
	private int qIdx;
	private int oIdx;
	private int count;
	private String aAnswer;
	private String qQuestion;
	
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
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
	@Override
	public String toString() {
		return "[" + "qQuestion=" + "\"" + qQuestion + "\"" + ", aAnswer= " + "\"" + aAnswer + "\"" + ", count= " + count +", qIdx=" + qIdx + "]";
	}

}
