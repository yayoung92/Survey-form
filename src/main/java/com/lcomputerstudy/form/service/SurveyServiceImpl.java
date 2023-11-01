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
import com.lcomputerstudy.form.domain.ResponseVO;
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
	public List<Options> selectAnswerList(int sIdx) {
		return surveymapper.selectAnswerList(sIdx);
	}
/*	@Override
	public List<Answer> selectAnswerListss(int sIdx) {
		List<Map<String, Object>> resultList = new ArrayList<>();
		Object[] rowData = null;
		
	    List<Answer> groupedData = surveymapper.selectAnswerList(sIdx);

	    for(int i = 1; i<resultList.size(); i++) {
	    	Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("aAnswer", rowData[i]);
	        resultMap.put("count", rowData[i]);
	        resultList.add(resultMap);
	    }

	    return groupedData;
	}
	
	@Override
	public List<String> selectAnswerListz(int sId) {
	    List<Answer> groupedData = surveymapper.selectAnswerList(sId);
	    Map<Integer, StringBuilder> groupedMap = new HashMap<>();

	    for (Answer answer : groupedData) {
	        int qIdx = answer.getqIdx();
	        StringBuilder resultString = new StringBuilder();
	        resultString.append("[aAnswer=\"")
	                    .append(answer.getaAnswer())
	                    .append("\", count=")
	                    .append(answer.getCount())
	                    .append(", qIdx=")
	                    .append(qIdx)
	                    .append("]");

	        if (groupedMap.containsKey(qIdx)) {
	            groupedMap.get(qIdx).append(", ")
	                              .append("[aAnswer=\"")
	                              .append(answer.getaAnswer())
	                              .append("\", count=")
	                              .append(answer.getCount())
	                              .append(", qIdx=")
	                              .append(qIdx)
	                              .append("]");
	        } else {
	            groupedMap.put(qIdx, resultString);
	        }
	    }

	    List<String> resultList = new ArrayList<>();
	    for (StringBuilder stringBuilder : groupedMap.values()) {
	        resultList.add(stringBuilder.toString());
	    }

	    return resultList;
	}
	 
	@Override
	public List<Allanswer> getAllanswerList(int sIdx) {
		List<Answer> answer = surveymapper.selectAnswerList(sIdx);
		Map<String, List<Answer>> group = new HashMap<>();
		
		List<Allanswer> groupresponseList = new ArrayList<>();
		
		for(Map.Entry<String, List<Answer>> entry: group.entrySet()) {
			Allanswer grouped = new Allanswer();
			grouped.setqQuestion(entry.getKey());
			grouped.setaAnswerlist(entry.getValue());
			groupresponseList.add(grouped);
		}
		
		return groupresponseList;
	}*/
	
	@Override
	public void getallanswer(Allanswer allanswer) {
		int sIdx = allanswer.getsIdx();
		surveymapper.getAllanswerList(sIdx);
	}
	
	@Override
	public List<ResponseVO> selectAnswerLists(int sIdx) {
		List<Allanswer> allanswer = surveymapper.getAllanswerList(sIdx);
		Map<String, List<Allanswer>> group = new HashMap<>();
		
		for(Allanswer a : allanswer) {
			String qQuestion = a.getqQuestion();	
			group.computeIfAbsent(qQuestion, k -> new ArrayList<>()).add(a);
		}
		
		List<ResponseVO> groupresponseList = new ArrayList<>();
		
		for(Map.Entry<String, List<Allanswer>> entry: group.entrySet()) {
			ResponseVO grouped = new ResponseVO();
			grouped.setqQuestion(entry.getKey());
			grouped.setaAnswers(entry.getValue());
			groupresponseList.add(grouped);
		}
		
		return groupresponseList;
	}
	
	private Answer createAnswersFromMap(Map<String, Object> answerMap) {
	    Answer answers = new Answer();
	    answers.setaAnswer((String) answerMap.get("aAnswer"));
	    answers.setCount((int) answerMap.get("count"));
	    return answers;
	}
	
	@Override
	public void updateSurvey(Survey survey) {
		surveymapper.updateSurvey(survey);
		int sId = survey.getsIdx();
		for(Question question : survey.getqQuestionslist()) {
			question.setsIdx(sId);
			surveymapper.updateQuestion(question);
			
			if(question.getqType() ==2) {
				int qId = question.getqIdx();
				for(Options options : question.getoOption()) {
					options.setsIdx(sId);
					options.setqIdx(qId);
					surveymapper.updateOption(options);
				}
			}
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
}
