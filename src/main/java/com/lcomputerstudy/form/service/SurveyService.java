package com.lcomputerstudy.form.service;

import java.util.List;
import java.util.Map;

import com.lcomputerstudy.form.domain.Allanswer;
import com.lcomputerstudy.form.domain.Answer;
import com.lcomputerstudy.form.domain.Options;
import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.ResponseVO;
import com.lcomputerstudy.form.domain.Survey;

public interface SurveyService {
	public List<Survey> selectSurvey();
	
	public void insertSurvey(Survey survey);
	
	public void insert(Question questions);
	
	public void insertQuestion(Question question);
	
	public void insertOption(Options options);
	
	public void getOptionqIdx(Options options);
	
	public void get(Options options);
	
	public void insertQuestionData(int sIdx, List<Map<String, Object>> qList);
	
	public void insertOptionData(int sIdx, List<Map<String, Object>> oList);
	
	public Survey viewSurvey(int sIdx);
	
	public List<Question> viewQuestion(int sIdx);
	
	public List<Options> viewOption(int sIdx);
	
	public List<Answer> viewAnswer(int sIdx);
	
	public void insertAnswer(Answer answer);
	
	public void insertallAnswer(Allanswer allanswer);
	
	public void updateoId(Answer answer);

	public List<Options> selectAnswerList(int sIdx);
	
//	public List<Answer> selectAnswerListss(int sIdx);
	
	public List<ResponseVO> selectAnswerLists(int sIdx);
	
//	public List<Allanswer> getAllanswerList(int sIdx);
	
	public void getallanswer(Allanswer allanswer);
	
	public void updateSurvey(Survey survey);
	
	public void updateQuestion(Question question);
	
	public void updateOption(Options options);
	
//	public List<String> selectAnswerListz(int qId);
}
