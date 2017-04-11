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
		logger.info("starting addSupplier(GET) get method");
		Supplier supplier = new Supplier();
		model.addAttribute("supplier", supplier);
		return "admin/addsupplier";
	}

	@RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
	public String addSupplierPost(@ModelAttribute("supplier") Supplier supplier, BindingResult result, Model model) {

		logger.info("Starting addSupplier(POST) method");
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

			supplier.setStatus("Running");
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

	@RequestMapping("/deleteSupplier/{id}")
	public String deleteSupplier(@PathVariable("id") int id, Model model) {
		logger.info("Starting deleteSupplier method");
		try {
			logger.info("Deleting supplier...");
			boolean flag = supplierService.delete(id);
			if (flag) {
				logger.info("Supplier deleted successfully");
				model.addAttribute("success", "Supplier deleted successfully.");
				return "forward:/admin/supplier";
			} else {
				logger.error("Failed to delete supplier");
				model.addAttribute("error", "Failed to delete supplier");
				return "forward:/admin/supplier";
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	@RequestMapping(value = "/editSupplier/{id}", method = RequestMethod.GET)
	public String editSupplier(@PathVariable("id") int id, Model model) {
		logger.info("Starting editSupplier(GET) method");
		try {
			supplier = supplierService.getSupplierById(id);
			model.addAttribute("supplier", supplier);
			return "admin/editsupplier";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	@RequestMapping(value = "/editSupplier", method = RequestMethod.POST)
	public String editSupplierPost(@ModelAttribute("supplier") Supplier supplier, BindingResult result, Model model) {
		logger.info("Starting editSupplier(POST) method");
		if (result.hasErrors()) {
			return "error";
		}
		List<Supplier> supplierList = supplierService.getAllSuppliers();
		try {
			logger.info("Updating supplier...");
			boolean flag = supplierService.update(supplier);
			if (flag) {
				supplier = new Supplier();
				model.addAttribute("supplier", supplier);
				model.addAttribute("success", "Supplier updated successfully");
				logger.info("Supplier updated successfully");
				return "admin/editsupplier";
			} else {
				model.addAttribute("error", "Failed to update supplier");
				logger.error("Failed to update supplier");
				return "admin/editsupplier";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

}
