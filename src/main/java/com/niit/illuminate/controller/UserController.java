package com.niit.illuminate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.illuminatebe.model.Users;
import com.niit.illuminatebe.service.UsersService;

@Controller
public class UserController {
	
//	@Autowired
//	private UsersService usersService;
//
//	@RequestMapping("/login")
//	public ModelAndView getLogin() {
//
//		ModelAndView model = new ModelAndView("login");
//		model.addObject("msg", "User login");
//
//		return model;
//
//	}
//
//	@RequestMapping("/register")
//	public String viewRegister(Model model) {
//
//		Users users = new Users();
//		model.addAttribute("users", users);
//		return "register";
//	}
//
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String saveUser(@ModelAttribute("users") Users users, BindingResult result, Model model) {
//		
//		if(result.hasErrors()){
//			return "register";
//		}
//		
//		//List<Users> usersList = usersService.getAllUsers();
//		
//		try {
//			usersService.save(users);
//			return "login";
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return "register";
//		}
//		
//		
//	}

}
