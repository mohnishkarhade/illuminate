package com.niit.illuminate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.illuminatebe.model.Category;
import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.model.Supplier;
import com.niit.illuminatebe.service.ProductService;

@Controller
@RequestMapping("/admin")
public class ProductController {

	private final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private Product product;

	@Autowired
	private Category category;

	@Autowired
	private Supplier supplier;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProductView(Model model) {
		logger.info("starting addProductView get method");
		product = new Product();
		category = new Category();
		supplier = new Supplier();

		product.setCategory(category);
		product.setSupplier(supplier);
		model.addAttribute("product", product);
		return "admin/addproduct";
	}

}
