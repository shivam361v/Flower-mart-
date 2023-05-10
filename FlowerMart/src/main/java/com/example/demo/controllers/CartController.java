package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Cart;
import com.example.demo.entities.User;
import com.example.demo.services.CartService;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class CartController {

	@Autowired
	CartService cservice;
	
	@Autowired
	UserService uservice;
	
	
	
	
	@GetMapping("/updateTotalAmount")
	public int updateTotalAmount(@RequestParam int user_id, @RequestParam double total)
	{
		return cservice.updateTotalAmount(user_id, total);
	}
	
	@GetMapping("/getCartByUser")
	public Cart getCartByUser(@RequestParam("user_id") int user_id)
	{
		User u = uservice.getOne(user_id);
//		System.out.println(u);
		return cservice.getCartByUser(u);
	}
	
}
