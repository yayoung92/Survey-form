package com.lcomputerstudy.form.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {
	@RequestMapping("/")
	public String home() {
		return "/form";
	}
}
