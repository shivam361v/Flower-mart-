package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartDetails;
import com.example.demo.entities.User;
import com.example.demo.services.CartDetailsService;
import com.example.demo.services.CartService;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class CartDetailsController {

	@Autowired
	CartDetailsService cdservice;
	
	@Autowired
	CartService cservice;
	
	@Autowired
	UserService uservice;
	
	@GetMapping("addToCart")
	public CartDetails addToCart(@RequestParam int user_id, @RequestParam int prod_id)
	{
		return cdservice.addToCart(user_id, prod_id);
	}
	
//	@GetMapping("allCartDetails")
//	public List<CartDetails> getAll()
//	{
//		return cdservice.getAll();
//	}
	
	@GetMapping("allCartDetailsByUser")
	public List<CartDetails> getAllByUser(@RequestParam int user_id)
	{
		User user = uservice.getOne(user_id);
		Cart cart = cservice.getCartByUser(user);
		return cdservice.getAllByCart(cart);
	}
	
	@GetMapping("deleteCartDetails")
	public int deleteCartDetails(@RequestParam int user_id)
	{
		User user = uservice.getOne(user_id);
		
		int a = cservice.updateTotalAmount(user_id, 0);
		return cdservice.deleteCartDetails(user);
	}
}
