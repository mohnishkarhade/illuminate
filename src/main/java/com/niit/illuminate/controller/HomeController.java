package com.niit.illuminate.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.service.CategoryService;
import com.niit.illuminatebe.service.ProductService;
import com.niit.illuminatebe.service.SupplierService;

@Controller
public class HomeController {

	// homeController - getting home page from WEB-INF/views/index.jsp
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private Product product;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private HttpSession session;

	@RequestMapping("/")
	public String getHome() {
		logger.info("Executing Home page...");

		session.setAttribute("categoryList", categoryService.getAllCategories());
		session.setAttribute("supplierList", supplierService.getAllSuppliers());

		return "index";
	}

	@RequestMapping("/getProductByCategory/{id}")
	public String getProductsByCategory(@PathVariable("id") int id, Model model) {
		try {
			logger.info("Starting filterProduct method");
			List<Product> productList = productService.getProductListByCategory(id);
			model.addAttribute("productList", productList);
			logger.info("Ending filterProduct method");
			return "productList";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.\n" + e);
			return "error";
		}
	}

	@RequestMapping("/allProducts")
	public String getProductList(Model model) {
		logger.info("Starting get Product list method");
		model.addAttribute("product", product);
		List<Product> productList = productService.viewByStatus("Running");
		model.addAttribute("productList", productList);
		logger.info("Ending get Product list  method");
		return "/productList";
	}

	@RequestMapping("/product/productDetail/{id}")
	public String getProductDetail(@PathVariable("id") int id, Model model) {
		logger.info("Starting getProductDetail method");
		try {
			Product product = new Product();
			product = productService.getProductByID(id);
			model.addAttribute("product", product);
			return "productdetail";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.\n" + e);
			return "error";
		}
	}

}
