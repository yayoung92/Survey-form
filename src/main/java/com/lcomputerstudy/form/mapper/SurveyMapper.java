package com.lcomputerstudy.form.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.form.domain.Options;
import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.Survey;

@Mapper
public interface SurveyMapper {
	public List<Survey> selectSurvey();
	
	public void insertSurvey(Survey survey);
	
	public void insert(Question question);
	
	public void insertQuestion(Question question);
	
	public void insertOption(Options options);
	
	public void getOptionqIdx(Options options);
	
	public void getQuestion(Survey survey);
	
	public void insertQuestionData(int sIdx, List<Map<String, Object>> qList);
	
	public void insertOptionData(int sIdx, List<Map<String, Object>> oList);
}
