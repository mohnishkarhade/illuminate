package com.niit.illuminate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//homeController - getting home page from WEB-INF/views/index.jsp
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String getHome(){
		logger.debug("Executing Home page...");
		return "index";
	}
		
	
}
