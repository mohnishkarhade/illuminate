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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.illuminatebe.model.Category;
import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.model.Supplier;
import com.niit.illuminatebe.model.Users;
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

		return "admin/dashboard";
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(Model model) {
		logger.info("Starting (manage) category method");
		model.addAttribute("category", category);
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("categoryList", categoryList);

		return "admin/category";
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {
		logger.info("Starting (manage) product method");
		model.addAttribute("product", product);
		List<Product> productList = productService.getAllProducts();
		model.addAttribute("productList", productList);

		return "admin/product";
	}

	@RequestMapping(value = "/supplier", method = RequestMethod.GET)
	public String supplier(Model model) {
		logger.info("Starting (manage) supplier method");
		model.addAttribute("supplier", supplier);
		List<Supplier> supplierList = supplierService.getAllSuppliers();
		model.addAttribute("supplierList", supplierList);

		return "admin/supplier";
	}

	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String customer(Model model) {
		logger.info("Starting (manage) customer method");
		model.addAttribute("customerList", customerService.getAllCustomers());

		return "admin/customer";
	}

	@RequestMapping(value = "/viewCustomer/{id}", method = RequestMethod.GET)
	public String viewCustomer(@PathVariable("id") int id, Model model) {
		logger.info("Starting viewcustomer method");
		model.addAttribute("customer", customerService.getUserById(id));

		return "admin/customerprofile";
	}

	@RequestMapping(value = "/changeStatus/{id}", method = RequestMethod.POST)
	public String changeStatus(@PathVariable("id") int id, Model model, RedirectAttributes redirect) {
		logger.info("Starting changeStatus customer method");
		try {
			Users users = customerService.getUsersById(id);
			int checkS = customerService.changeStatus(id);
			if (checkS > 0) {
				redirect.addFlashAttribute("success", "Customer status changed successflly.");
				return "redirect:/customer";
			} else {
				redirect.addFlashAttribute("error", "Failed to change Customer status.");
				return "redirect:/customer";
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.\n" + e);
			return "error";
		}
	}

}
