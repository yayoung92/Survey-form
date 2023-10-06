package com.lcomputerstudy.form.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/aj-insert")
	public String ins(@RequestBody Map<String, Object> pay, Survey survey, Question question) {
		String name = (String) pay.get("sTitle");
		String title = (String) pay.get("title");
	//	String[] quet = (String[]) pay.get("questions");
	//	String q = (String) pay.get("qQueation");
	//	String t = (String) pay.get("qType");
	//	long[] list = (long[]) pay.get("qOption");

		System.out.println(name.toString());
		System.out.println(title.toString());
	//	System.out.println(Arrays.toString(quet));
	//	System.out.println(q.toString());
	//	System.out.println(t.toString());
	//	System.out.println(Arrays.toString(list));
		
		survey.setsTitle(title);
		surveyservice.insertSurvey(survey);
		
		int sIdx = survey.getsIdx();
		surveyservice.updateQIdx(sIdx);
		
		question.setqQuestion(title);
		surveyservice.insertQuestion(question);
	/*	int sIdx = survey.getsIdx();
		surveyservice.updateSIdx(sIdx);
		
		for(Question quest : question) {
			
			if(quest != null) {
				quest.setsIdx(sIdx); 
				quest.setqQuestion(q);
				quest.setqType(t);
				quest.setqOption(list);
	            surveyservice.insert(question);;
			} 
		}	 */

		return "/form2";
	}
}
