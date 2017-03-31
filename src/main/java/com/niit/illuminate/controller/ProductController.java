package com.niit.illuminate.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.illuminate.util.FileUtil;
import com.niit.illuminatebe.model.Category;
import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.model.Supplier;
import com.niit.illuminatebe.service.CategoryService;
import com.niit.illuminatebe.service.ProductService;
import com.niit.illuminatebe.service.SupplierService;

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
	private CategoryService categoryService;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model) {
		logger.info("starting addProductView get method");
		product = new Product();
		model.addAttribute("categoryList", categoryService.getAllCategories());
		model.addAttribute("supplierList", supplierService.getAllSuppliers());
		model.addAttribute("product", product);
		return "admin/addproduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file,
			BindingResult result, Model model, HttpServletRequest request) {
		if (result.hasErrors()) {
			logger.error("Binding Result has error");
			model.addAttribute("error", "Binding Result has error");
			return "error";
		}

		List<Product> productList = productService.getAllProducts();

		try {
			for (int i = 0; i < productList.size(); i++) {
				if (product.getName().equalsIgnoreCase(productList.get(i).getName())) {
					model.addAttribute("duplicateProduct", "This product is already exists");
					logger.error("Product is already exist");
					return "admin/addproduct";
				}
			}
			Set<Product> productSet = new HashSet<Product>();
			productSet.add(product);
			category.setProducts(productSet);
			boolean flag = productService.save(product);
			file = product.getFile();
			String path = request.getServletContext().getRealPath("/resources/images/");

			logger.info(path);
			String filename = product.getId() + ".jpg";
			logger.info(filename);
			FileUtil.upload(path, file, filename);
			if (flag) {
				model.addAttribute("success", "Product added successfully");
				logger.info("Product added successfully");
				return "admin/addproduct";
			} else {
				model.addAttribute("error", "Adding product Failed, Please try again !");
				logger.error("Product adding failed");
				return "admin/addproduct";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.\n" + e);
			return "error";
		}
	}

}
