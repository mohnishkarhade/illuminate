package com.niit.illuminate.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.illuminatebe.model.Cart;
import com.niit.illuminatebe.model.Customer;
import com.niit.illuminatebe.model.Product;
import com.niit.illuminatebe.model.Users;
import com.niit.illuminatebe.service.CartService;
import com.niit.illuminatebe.service.CustomerService;
import com.niit.illuminatebe.service.ProductService;

@Controller
@RequestMapping("/myCart")
public class CartController {

	private final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private Cart cart;

	@Autowired
	private CartService cartService;

	@Autowired
	private Product product;

	@Autowired
	private ProductService productService;

	@Autowired
	private HttpSession session;

	@Autowired
	private Customer customer;

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/all")
	public String getCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		String loggedInUsername = username;
		session.setAttribute("numberProducts", cartService.getNumberOfProducts(loggedInUsername));
		session.setAttribute("cartList", cartService.getCartList(loggedInUsername));
		session.setAttribute("totalAmount", cartService.getTotalAmount(loggedInUsername));
		return "cart";
	}

	@RequestMapping(value = "/addToCart/{id}", method = RequestMethod.POST)
	public String addToCart(@PathVariable("id") int id, RedirectAttributes redirect, Model model) {
		logger.info("Starting addtocart method");
		try {
			Cart cart = new Cart();
			Product product = productService.getProductByID(id);
			cart.setProductName(product.getName());
			cart.setPrice(product.getPrice());
			cart.setDateAdded(new Date());
			String loggedInUsername = null;

			if (loggedInUsername == null) {

				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String username = auth.getName();
				loggedInUsername = username;

			}
			cart.setUsername(loggedInUsername);
			cart.setStatus("NEW");
			Cart existCart = cartService.getCartByUsername(loggedInUsername, cart.getProductName());
			if (existCart != null) {
				int currentQuantity = cartService.getQuantity(loggedInUsername, cart.getProductName());
				cart.setId(existCart.getId());
				cart.setQuantity(currentQuantity + 1);
				boolean flag = cartService.update(cart);

				if (flag) {

					redirect.addFlashAttribute("success", product.getName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartService.getNumberOfProducts(loggedInUsername));
					return "redirect:/allProducts";

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/allProducts";
				}
			} else {
				cart.setQuantity(1);
				boolean flag = cartService.save(cart);

				if (flag) {

					redirect.addFlashAttribute("success", product.getName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartService.getNumberOfProducts(loggedInUsername));
					return "redirect:/allProducts";

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/allProducts";
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

}
