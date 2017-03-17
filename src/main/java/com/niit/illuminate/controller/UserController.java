package com.niit.illuminate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.illuminatebe.model.Users;
import com.niit.illuminatebe.service.UsersService;

@Controller
public class UserController {

	private final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private Users users;

	@Autowired
	private UsersService usersService;

	@RequestMapping("/login")
	public String getLogin() {

		logger.info("Executing Login page...");
		return "login";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegister(Model model) {
		logger.info("Executing Login page...");
		model.addAttribute("users", users);
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("users") Users users, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "register";
		}

		// List<Users> usersList = usersService.getAllUsers();

		try {
			boolean flag = usersService.save(users);
			if (flag) {
				return "login";
			} else {
				return "register";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "register";
		}

	}

}
