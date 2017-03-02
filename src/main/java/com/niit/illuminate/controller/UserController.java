package com.niit.illuminate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@RequestMapping("/login")
	public ModelAndView getLogin(){
		
		ModelAndView model = new ModelAndView("login");
		model.addObject("msg", "User login");
		
		return model;
		
	}
	
	@RequestMapping("/register")
	public String viewRegister(){
		return "register";
	}
	
}
