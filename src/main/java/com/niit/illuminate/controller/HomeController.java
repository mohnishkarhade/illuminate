package com.niit.illuminate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//getting home page from WEB-INF/views/index.jsp
	
	@RequestMapping("/")
	public String getHome(){
		return "index";
	}
		
	
}
