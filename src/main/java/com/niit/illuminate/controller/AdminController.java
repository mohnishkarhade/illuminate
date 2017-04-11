package com.niit.illuminate.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.niit.illuminatebe.service.CategoryService;
import com.niit.illuminatebe.service.CustomerOrderService;
import com.niit.illuminatebe.service.CustomerService;
import com.niit.illuminatebe.service.ProductService;
import com.niit.illuminatebe.service.SupplierService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private Category category;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private Supplier supplier;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private Product product;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerOrderService customerOrderService;

	@Autowired
	private HttpSession session;

	@RequestMapping(value = { "", "/dashboard" })
	public String dashboard() {
		logger.info("Starting dashboard method");
		session.setAttribute("products", productService.getAllProducts().size());
		session.setAttribute("categories", categoryService.getAllCategories().size());
		session.setAttribute("suppliers", supplierService.getAllSuppliers().size());
		session.setAttribute("customers", customerService.getAllCustomers().size());
		
		logger.info("Ending dashboard method");
		return "admin/dashboard";
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(Model model) {
		logger.info("Starting (manage) category method");
		model.addAttribute("category", category);
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("categoryList", categoryList);
		logger.info("Ending (manage) category method");
		return "admin/category";
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {
		logger.info("Starting (manage) product method");
		model.addAttribute("product", product);
		List<Product> productList = productService.getAllProducts();
		model.addAttribute("productList", productList);
		logger.info("Ending (manage) product method");
		return "admin/product";
	}

	@RequestMapping(value = "/supplier", method = RequestMethod.GET)
	public String supplier(Model model) {
		logger.info("Starting (manage) supplier method");
		model.addAttribute("supplier", supplier);
		List<Supplier> supplierList = supplierService.getAllSuppliers();
		model.addAttribute("supplierList", supplierList);
		logger.info("Ending (manage) supplier method");
		return "admin/supplier";
	}

}
