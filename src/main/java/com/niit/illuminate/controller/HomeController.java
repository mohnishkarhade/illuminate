package com.niit.illuminate.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.illuminatebe.service.CategoryService;
import com.niit.illuminatebe.service.SupplierService;

@Controller
public class HomeController {
	
	//homeController - getting home page from WEB-INF/views/index.jsp
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String getHome(){
		logger.info("Executing Home page...");
		
//		session.setAttribute("categoryList", categoryService.getAllCategories());
//		session.setAttribute("supplierList", supplierService.getAllSuppliers());
		
		return "index";
	}
		
	
}
