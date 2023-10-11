package com.lcomputerstudy.form.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lcomputerstudy.form.domain.Options;
import com.lcomputerstudy.form.domain.Question;
import com.lcomputerstudy.form.domain.Survey;
import com.lcomputerstudy.form.service.SurveyService;

@org.springframework.stereotype.Controller
public class Controller {
	@Autowired SurveyService surveyservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<Survey> list = surveyservice.selectSurvey();
		model.addAttribute("list", list);
		return "/index";
	}
	@RequestMapping("/form-view")
	public String sum(Model model) {
		return "/form2";
	}
	@RequestMapping("/aj-insertquestion")
	public String insquesi(@RequestBody Question question, Model model) {
		surveyservice.insertQuestion(question);
		return "/form2";
	}
	@RequestMapping("/aj-insertsurvey")
	public String ins(@RequestBody Map<String, Object> pay, Survey survey, Question question, Options options) {
		String name = (String) pay.get("sTitle");
		List<Map<String, Object>> qList = (List<Map<String, Object>>) pay.get("qQuestions"); 
		List<Map<String, Object>> oList = (List<Map<String, Object>>) pay.get("oOptions");
		
		survey.setsTitle(name);
		surveyservice.insertSurvey(survey);
		
		int sIdx = survey.getsIdx();
		
		for (Map<String, Object> qData : qList) {
	        String qTitle = (String) qData.get("qQuestion");
	        int qType = (int) qData.get("qType");

	        question.setqQuestion(qTitle);
	        question.setqType(qType);
	        question.setsIdx(sIdx);	        
	        surveyservice.insertQuestion(question);

		}
		
		System.out.println(qList.toString());
		if(question.getqType() == 2) {
			
			for (Map<String, Object> optionData : oList) {
                List<String> optionTexts = (List<String>) optionData.get("option");
                System.out.println(optionTexts.toString());
                
                for (String optionText : optionTexts) {
                    options.setoOption(optionText);
                    options.setsIdx(sIdx);
                    surveyservice.insertOption(options); 
                    
                }
            }
        }
//		surveyservice.getOptionqIdx(options);
		return "/index";
	}
}
