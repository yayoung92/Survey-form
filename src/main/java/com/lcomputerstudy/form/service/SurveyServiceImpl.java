package com.lcomputerstudy.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.form.domain.Options;
import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.Survey;
import com.lcomputerstudy.form.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {
	@Autowired SurveyMapper surveymapper;
	
	@Override
	public List<Survey> selectSurvey() {
		return surveymapper.selectSurvey();
	}
	
	@Override
	public void insertSurvey(Survey survey) {
		surveymapper.insertSurvey(survey);
	}
	
	@Override
	public void insert(Question[] questions) {
		surveymapper.insert(questions);
	}
	
	@Override
	public void insertQuestion(Question question) {
		surveymapper.insertQuestion(question);
	}
	
	@Override
	public void insertOption(Options options) {
		surveymapper.insertOption(options);
	}
	@Override
	public void updateSIdx(int sIdx) {
		surveymapper.updateSIdx(sIdx);
	}
	@Override
	public void updateQIdx(int qIdx) {
		surveymapper.updateQIdx(qIdx);
	}
}
