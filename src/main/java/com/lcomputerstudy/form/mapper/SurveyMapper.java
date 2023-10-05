package com.lcomputerstudy.form.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.Survey;

@Mapper
public interface SurveyMapper {
	public List<Survey> selectSurvey();
	
	public void insertSurvey(Survey survey);
	
	public void insertQuestion(Question question);
	
	public void updateSIdx(int sIdx);
}
