package com.niit.illuminate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.illuminatebe.model.Category;
import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.model.Supplier;
import com.niit.illuminatebe.service.CategoryService;
import com.niit.illuminatebe.service.ProductService;
import com.niit.illuminatebe.service.SupplierService;

@Controller
@RequestMapping("/myCart")
public class CartController {

	private final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private Product product;

	@Autowired
	private Category category;

	@Autowired
	private Supplier supplier;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/addToCart/{id}", method = RequestMethod.POST)
	public String addToCart(@PathVariable("id") int id, Model model) {
		return null;
	}

}
