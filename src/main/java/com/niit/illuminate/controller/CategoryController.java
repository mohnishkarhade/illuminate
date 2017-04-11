package com.niit.illuminate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.illuminatebe.model.Category;
import com.niit.illuminatebe.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class CategoryController {

	private static Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private Category category;

	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public String addCategory(Model model) {
		logger.info("Starting addCategory(GET) method in CategoryController");
		category = new Category();
		model.addAttribute("category", category);
		return "admin/addcategory";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategoryPost(@ModelAttribute("category") Category category, BindingResult result, Model model) {

		logger.info("Starting addCategory(POST) method in CategoryController");
		if (result.hasErrors()) {
			return "error";
		}
		List<Category> categoryList = categoryService.getAllCategories();
		try {
			logger.info("Saving category...");

			for (int i = 0; i < categoryList.size(); i++) {
				if (category.getName().equalsIgnoreCase(categoryList.get(i).getName())) {
					model.addAttribute("duplicateCategory", "Category is already exists.");
					return "admin/addcategory";
				}
			}

			category.setStatus("Running");
			boolean flag = categoryService.save(category);
			if (flag) {
				category = new Category();
				model.addAttribute("category", category);
				model.addAttribute("success", "Category added successfully");
				return "admin/addcategory";
			} else {
				model.addAttribute("error", "Failed to add category");
				return "admin/addcategory";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	@RequestMapping("/deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") int id, Model model) {
		logger.info("Starting deleteCategory method in CategoryController");
		try {
			logger.info("Deleting category...");
			boolean flag = categoryService.delete(id);
			if (flag) {
				logger.info("Category deleted successfully");
				model.addAttribute("success", "Category deleted successfully.");
				return "forward:/admin/category";
			} else {
				logger.error("Failed to delete category");
				model.addAttribute("error", "Failed to delete category");
				return "forward:/admin/category";
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	@RequestMapping(value = "/editCategory/{id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("id") int id, Model model) {
		logger.info("Starting editCategory(GET) method in CategoryController");
		try {
			category = categoryService.getCategoryById(id);
			model.addAttribute("category", category);
			return "admin/editcategory";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	@RequestMapping(value = "/editCategory", method = RequestMethod.POST)
	public String editCategoryPost(@ModelAttribute("category") Category category, BindingResult result, Model model) {
		logger.info("Starting editCategory(POST) method in categoryController");
		if (result.hasErrors()) {
			return "error";
		}
		List<Category> categoryList = categoryService.getAllCategories();
		try {
			logger.info("Updating category...");
			boolean flag = categoryService.update(category);
			if (flag) {
				category = new Category();
				model.addAttribute("category", category);
				model.addAttribute("success", "Category updated successfully");
				logger.info("Category updated successfully");
				return "admin/editcategory";
			} else {
				model.addAttribute("error", "Failed to update category");
				logger.error("Failed to update category");
				return "admin/editcategory";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}
}
