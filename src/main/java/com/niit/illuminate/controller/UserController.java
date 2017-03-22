package com.niit.illuminate.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.illuminatebe.model.BillingAddress;
import com.niit.illuminatebe.model.ShippingAddress;
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

		logger.debug("Executing Login page...");
		return "login";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegister(Model model) {
		logger.info("Executing Registration page...");

		ShippingAddress shippingAddress = new ShippingAddress();
		BillingAddress billingAddress = new BillingAddress();

		users.setShippingAddress(shippingAddress);
		users.setBillingAddress(billingAddress);
		model.addAttribute("users", users);
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("users") Users users, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "error";
		}

		List<Users> usersList = usersService.getAllUsers();

		try {
			logger.info("Saving user...");
			for (int i = 0; i < usersList.size(); i++) {
				if (users.getEmail().equalsIgnoreCase(usersList.get(i).getEmail())) {
					model.addAttribute("emailError", "This email is already exists");
					logger.error("Email is already exist");
					return "register";
				}

				if (users.getUsername().equalsIgnoreCase(usersList.get(i).getUsername())) {
					model.addAttribute("usernameError", "This username is already exists");
					logger.error("Username is already exists");
					return "register";
				}
			}

			users.setEnabled(true);
			boolean flag = usersService.save(users);

			if (flag == true) {

				model.addAttribute("success", "Registered successfully");
				logger.info("User registered successfully");
				return "login";
			} else {
				model.addAttribute("error", "Registration Failed, Please try again !");
				logger.error("Registration failed");
				return "register";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}

	}

}
