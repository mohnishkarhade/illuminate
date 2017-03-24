package com.niit.illuminate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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

		model.addAttribute("category", category);
		return "admin/addcategory";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category, BindingResult result, Model model) {

		logger.info("Starting addCategory method");
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

			boolean flag = categoryService.save(category);
			if (flag) {
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
}
