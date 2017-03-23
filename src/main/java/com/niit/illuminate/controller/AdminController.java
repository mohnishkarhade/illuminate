package com.niit.illuminate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("")
	public String dashboard() {
		logger.info("Starting dashboard method");

		logger.info("Ending dashboard method");
		return "admin/dashboard";
	}

	@RequestMapping("/category")
	public String category() {
		logger.info("Starting (manage) category method");

		logger.info("Ending (manage) category method");
		return "admin/category";
	}

	@RequestMapping("/product")
	public String product() {
		logger.info("Starting (manage) product method");

		logger.info("Ending (manage) product method");
		return "admin/product";
	}

	@RequestMapping("/supplier")
	public String supplier() {
		logger.info("Starting (manage) supplier method");

		logger.info("Ending (manage) supplier method");
		return "admin/supplier";
	}

}
