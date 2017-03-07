package com.niit.illuminate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
		

	@RequestMapping("/login")
	public ModelAndView getLogin() {

		ModelAndView model = new ModelAndView("login");
		model.addObject("msg", "User login");

		return model;

	}

	@RequestMapping("/register")
	public String viewRegister() {		
		return "register";
	}

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
