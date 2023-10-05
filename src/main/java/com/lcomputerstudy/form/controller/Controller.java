package com.lcomputerstudy.form.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "/form";
	}
	@RequestMapping("/aj-insert")
	public String insert(@RequestBody Map<String, Object> pay, Survey survey, Question question) {
		String title = (String) pay.get("sTitle");
		String q = (String) pay.get("qQueation");
		String t = (String) pay.get("qType");
		System.out.println(title);
		survey.setsTitle(title);
		surveyservice.insertSurvey(survey);
		
		int sIdx = survey.getsIdx();
		surveyservice.updateSIdx(sIdx);
		
		question.setsIdx(sIdx); 
		question.setqQuestion(q);
		question.setqType(t);
		surveyservice.insertQuestion(question);
		return "/resultSurvey";
	}
}
