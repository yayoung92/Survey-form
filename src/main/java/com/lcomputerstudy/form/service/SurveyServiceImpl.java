package com.lcomputerstudy.form.service;

import java.util.List;
import java.util.Map;

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
	public void insert(Question questions) {
		surveymapper.insert(questions);
	}
	
	@Override
	public void insertQuestionData(int sIdx, List<Map<String, Object>> qList) {
        for (Map<String, Object> qData : qList) {
            String qTitle = (String) qData.get("title");
            int qType = (int) qData.get("type");

            Question question = new Question();
            question.setqQuestion(qTitle);
            question.setqType(qType);
            question.setsIdx(sIdx);
            surveymapper.insertQuestion(question);
        }
    }
	
	@Override
	public void insertQuestion(Question question) {
		surveymapper.insertQuestion(question);
	}
	
	@Override
    public void insertOptionData(int sIdx, List<Map<String, Object>> oList) {
        for (Map<String, Object> optionData : oList) {
            List<String> optionTexts = (List<String>) optionData.get("option");

            for (String optionText : optionTexts) {
            	
                Options options = new Options();
                options.setoOption(optionText);
                options.setsIdx(sIdx);
                surveymapper.insertOption(options);
            }
        }
    }
	
	@Override
	public void insertOption(Options options) {
		surveymapper.insertOption(options);
	}
	
	@Override
	public void getOptionqIdx(Options options) {
		surveymapper.getOptionqIdx(options);
	}

	@Override
	public void get(Options options) {
		surveymapper.get(options);
	}
}
