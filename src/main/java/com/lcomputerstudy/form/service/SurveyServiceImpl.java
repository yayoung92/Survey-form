package com.lcomputerstudy.form.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.form.domain.Allanswer;
import com.lcomputerstudy.form.domain.Answer;
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
	public List<Answer> viewAnswer(int sIdx) {
		return surveymapper.viewAnswer(sIdx);
	}
	
	@Override
	public void insertAnswer(Answer answer) {
		surveymapper.insertAnswer(answer);
	}
	
	@Override
	public void insertallAnswer(Allanswer allanswer) {
		surveymapper.insertallAnswer(allanswer);
		int sId = allanswer.getsIdx();
		
		for(Answer answer : allanswer.getaAnswerlist()) {
			answer.setsIdx(sId);
			surveymapper.insertAnswer(answer);
			surveymapper.updateoId(answer);
		}
	}
	
	@Override
	public void updateoId(Answer answer) {
		surveymapper.updateoId(answer);
	}
	
	@Override
	public List<Options> selectOptionList(int sIdx) {
		return surveymapper.selectOptionList(sIdx);
	}
	
	@Override
	public List<Answer> selectAnswerList(int sIdx) {
		return surveymapper.selectAnswerList(sIdx);
	}
	
	@Override
	public List<Map<String, Object>> gro(int sIdx) {
	    List<Answer> answersList = surveymapper.selectAnswerList(sIdx);
	    List<Map<String, Object>> result = new ArrayList<>();

	    for (Answer answer : answersList) {        
	    		
	        List<Object> answerMap = new ArrayList<>();
	        answerMap.add(answer.getaAnswer());
	        answerMap.add(answer.getCount());

	        boolean questionExists = false;
	        for (Map<String, Object> questionMap : result) {
	            if (questionMap.get("question").equals(answer.getqQuestion())) {
	            	List<List<Object>> answers = (List<List<Object>>) questionMap.get("answers");
	                List<Object> answerData = new ArrayList<>();
	                answerData.add(answer.getaAnswer());
	                answerData.add(answer.getCount());
	                answers.add(answerData);
	                questionExists = true;
	                break;
	            }
	        }

	        if (!questionExists) {
	            Map<String, Object> questionMap = new HashMap<>();
	            questionMap.put("qIdx", answer.getqIdx());
	            questionMap.put("question", answer.getqQuestion());
	            
	            List<List<Object>> anwers = new ArrayList<>();
	            List<Object> answerList = new ArrayList<>();
	            answerList.add(answer.getaAnswer());
	            answerList.add(answer.getCount());
	            anwers.add(answerList);
	            questionMap.put("answers", anwers);
	            result.add(questionMap);
	        }
	    }

	    return result;
	}
	
	@Override
	public void updateSurvey(Survey survey) {
		surveymapper.updateSurvey(survey);
		int sId = survey.getsIdx();
		
		for(Question question : survey.getqQuestionslist()) {
			question.setsIdx(sId);
			surveymapper.updateQuestion(question);	
		}
		
		for(Options options : survey.getoOptionslist()) {
			options.setsIdx(sId);
			surveymapper.updateOption(options);
		}
	}
	
	@Override
	public void updateQuestion(Question question) {
		surveymapper.updateQuestion(question);
	}
	
	@Override
	public void updateOption(Options options) {
		surveymapper.updateOption(options);
	}
	
	@Override
	public void deleteSurvey(int sIdx) {
		surveymapper.deleteSurvey(sIdx);
	}
	
	@Override
	public void deleteQuestion(int sIdx) {
		surveymapper.deleteQuestion(sIdx);
	}
	
	@Override
	public void deleteOption(int sIdx) {
		surveymapper.deleteOption(sIdx);
	}
}
