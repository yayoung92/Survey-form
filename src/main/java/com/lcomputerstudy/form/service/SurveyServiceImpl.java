package com.lcomputerstudy.form.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.form.domain.Allanswer;
import com.lcomputerstudy.form.domain.Answer;
import com.lcomputerstudy.form.domain.Response;
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
		int sId = survey.getsIdx();
		for(Question question : survey.getqQuestionslist()) {
			question.setsIdx(sId);
			surveymapper.insertQuestion(question);
			
			if(question.getqType() ==2) {
				int qId = question.getqIdx();
				for(Options options : question.getoOption()) {
					options.setsIdx(sId);
					options.setqIdx(qId);
					surveymapper.insertOption(options);
				}
				
			}
			
		}
	}
	
	@Override
	public void insert(Question questions) {
		surveymapper.insert(questions);
	}
	
	@Override
	public void insertQuestionData(int sIdx, List<Map<String, Object>> qList) {
        for (Map<String, Object> qData : qList) {
            String qTitle = (String) qData.get("qQuestion");
            int qType = (Integer) qData.get("qType");

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
            List<String> optionTexts = (List<String>) optionData.get("oOption");
            int size = optionTexts.size();

            for (int i=0; i<size; i++) {
            	String optionText = optionTexts.get(i);
            	
       //         Options options = new Options();
       //         options.setoOption(optionText);
        //        options.setsIdx(sIdx);
        //        surveymapper.insertOption(options);
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
	
	@Override
	public Survey viewSurvey(int sIdx) {
		return surveymapper.viewSurvey(sIdx);
	}
	
	@Override
	public List<Question> viewQuestion(int sIdx) {
		return surveymapper.viewQuestion(sIdx);
	}
	
	@Override
	public List<Options> viewOption(int sIdx) {
		return surveymapper.viewOption(sIdx);
	}
	
	@Override
	public void insertAnswer(Answer answer) {

		surveymapper.insertAnswer(answer);
	}
	
	@Override
	public void insertResponse(Response response) {
		surveymapper.insertResponse(response);
		int sId = response.getsIdx();
		
		for(Answer answer : response.getaAnswerlist()) {
			answer.setsIdx(sId);
			surveymapper.insertAnswer(answer);
		}

	}
	
	@Override
	public int viewAnswer(Answer answer) {
		return surveymapper.viewAnswer(answer);
	}
	
	@Override
	public List<Answer> viewAnswers(int sIdx) {
		return surveymapper.viewAnswers(sIdx);
	}
	
	@Override
	public void insertallAnswer(Allanswer allanswer) {
		surveymapper.insertallAnswer(allanswer);
	}
	
	@Override
	public Map<String, Object> get(Answer answer) {
		return surveymapper.get(answer);
	}
	
	@Override
	public List<Integer> selectAnswerlist(Answer answer) {
		return surveymapper.selectAnswerlist(answer);
	}
	
	@Override
	public List<Answer> selectAnswerList(int sIdx, Answer answer) {
		return surveymapper.selectAnswerList(sIdx, answer);
	}
}
