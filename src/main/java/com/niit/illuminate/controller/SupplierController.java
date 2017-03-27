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

import com.niit.illuminatebe.model.Supplier;
import com.niit.illuminatebe.service.SupplierService;

@Controller
@RequestMapping("/admin")
public class SupplierController {

	private static Logger logger = LoggerFactory.getLogger(SupplierController.class);

	@Autowired
	private Supplier supplier;

	@Autowired
	private SupplierService supplierService;

	@RequestMapping(value = "/addSupplier", method = RequestMethod.GET)
	public String addSupplier(Model model) {
		logger.info("starting addSupplier get method");
		Supplier supplier = new Supplier();
		model.addAttribute("supplier", supplier);
		return "admin/addsupplier";
	}
	
	@RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
	public String addSupplierPost(@ModelAttribute("supplier") Supplier supplier, BindingResult result, Model model) {

		logger.info("Starting addSupplier method");
		if (result.hasErrors()) {
			model.addAttribute("error", "Binding result has error.");
			return "error";
		}
		List<Supplier> supplierList = supplierService.getAllSuppliers();
		try {
			logger.info("Saving supplier...");

			for (int i = 0; i < supplierList.size(); i++) {
				if (supplier.getName().equalsIgnoreCase(supplierList.get(i).getName())) {
					model.addAttribute("duplicateSupplier", "Supplier is already exists.");
					return "admin/addsupplier";
				}
			}

			boolean flag = supplierService.save(supplier);
			if (flag) {
				supplier = new Supplier();
				model.addAttribute("supplier", supplier);
				model.addAttribute("success", "Supplier added successfully");
				return "admin/addsupplier";
			} else {
				model.addAttribute("error", "Failed to add supplier");
				return "admin/addsupplier";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

}
