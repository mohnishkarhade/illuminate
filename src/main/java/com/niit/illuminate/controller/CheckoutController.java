package com.niit.illuminate.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.illuminatebe.model.Customer;
import com.niit.illuminatebe.model.CustomerOrder;
import com.niit.illuminatebe.service.CustomerOrderService;
import com.niit.illuminatebe.service.CustomerService;

@Controller
public class CheckoutController {

	@Autowired
	private Customer customer;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private CustomerOrderService customerOrderService;

	@Autowired
	private HttpSession session;

	@RequestMapping("/order")
	public String createOrder() {
//		CustomerOrder customerOrder = new CustomerOrder();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		String loggedInUsername = username;

		Customer customer = customerService.getUserByUserName(loggedInUsername);
//		customerOrder.setCustomer(customer);
//		customerOrder.setBillingAddress(customer.getBillingAddress());
//		customerOrder.setShippingAddress(customer.getShippingAddress());
//
//		customerOrderService.addCustomerOrder(customerOrder);

		return "redirect:/checkout?userId=" + customer.getId();
	}

}
