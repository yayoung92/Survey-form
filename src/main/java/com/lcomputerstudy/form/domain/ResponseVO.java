package com.lcomputerstudy.form.domain;

import java.util.List;

public class ResponseVO {
	private String qQuestion;
	private List<Allanswer> aAnswers;
	private String aAnswer;
	
	public String getqQuestionlist() {
		return qQuestion;
	}
	public void setqQuestionlist(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public List<Allanswer> getaAnswers() {
		return aAnswers;
	}
	public void setaAnswers(List<Allanswer> aAnswers) {
		this.aAnswers = aAnswers;
	}
	public String getaAnswer() {
		return aAnswer;
	}
	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}
	@Override
	public String toString() {
		return "[" + "qQuestion=" + "\"" + qQuestion + "\"" + ", aAnswers=" + aAnswers + "]";
	}


}
