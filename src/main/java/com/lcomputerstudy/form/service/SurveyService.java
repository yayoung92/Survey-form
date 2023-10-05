package com.lcomputerstudy.form.service;

import java.util.List;

import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.Survey;

public interface SurveyService {
	public List<Survey> selectSurvey();
	
	public void insertSurvey(Survey survey);
	
	public void insertQuestion(Question question);
	
	public void updateSIdx(int sIdx);

}
