package com.lcomputerstudy.form.domain;

import java.util.List;

public class Survey {
	private int sIdx; 	
	private String sTitle;		//설문지 제목
	private String sDateTime;
	private List<Question> qQuestionslist;
	private List<Options> oOptionslist;
	private List<Answer> aAnswerlist;
	
	public List<Answer> getaAnswerlist() {
		return aAnswerlist;
	}
	public void setaAnswerlist(List<Answer> aAnswerlist) {
		this.aAnswerlist = aAnswerlist;
	}
	public List<Options> getoOptionslist() {
		return oOptionslist;
	}
	public void setoOptionslist(List<Options> oOptionslist) {
		this.oOptionslist = oOptionslist;
	}
	public List<Question> getqQuestionslist() {
		return qQuestionslist;
	}
	public void setqQuestionslist(List<Question> qQuestionslist) {
		this.qQuestionslist = qQuestionslist;
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
	public String getsDateTime() {
		return sDateTime;
	}
	public void setsDateTime(String sDateTime) {
		this.sDateTime = sDateTime;
	}
	@Override
	public String toString() {
		return "Survey [sIdx=" + sIdx + ", sTitle=" + sTitle + ", sDateTime=" + sDateTime + ", qQuestionslist="
				+ qQuestionslist + ", oOptionslist=" + oOptionslist + ", aAnswerlist=" + aAnswerlist + "]";
	}

}
