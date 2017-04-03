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
import com.niit.illuminatebe.model.Customer;
import com.niit.illuminatebe.model.ShippingAddress;
import com.niit.illuminatebe.service.CustomerService;

@Controller
public class CustomerController {

	private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private Customer customer;

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/login") // Getting login page
	public String getLogin() {

		logger.debug("Executing Login page...");
		return "login";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegister(Model model) {
		logger.info("Executing Registration page...");

		ShippingAddress shippingAddress = new ShippingAddress();
		BillingAddress billingAddress = new BillingAddress();
		Customer customer = new Customer();

		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		model.addAttribute("customer", customer);
		return "register";
	}

	// @PostMapping("/register")
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("customer") Customer customer, BindingResult result, Model model) {

		if (result.hasErrors()) {
			logger.error("Binding Result has error");
			model.addAttribute("error", "Binding Result has error");
			return "error";
		}

		List<Customer> usersList = customerService.getAllCustomers();

		try {
			logger.info("Saving user...");
			for (int i = 0; i < usersList.size(); i++) {
				if (customer.getEmail().equalsIgnoreCase(usersList.get(i).getEmail())) {
					model.addAttribute("emailError", "This email is already exists");
					logger.error("Email is already exist");
					return "register";
				}

				if (customer.getUsername().equalsIgnoreCase(usersList.get(i).getUsername())) {
					model.addAttribute("usernameError", "This username is already exists");
					logger.error("Username is already exists");
					return "register";
				}

				if (customer.getMobileno().equalsIgnoreCase(usersList.get(i).getMobileno())) {
					model.addAttribute("mobileError", "Mobile number is already exists");
					logger.error("Mobile number is already exists");
					return "register";
				}
			}

			boolean flag = customerService.save(customer);

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
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}

	}
}
