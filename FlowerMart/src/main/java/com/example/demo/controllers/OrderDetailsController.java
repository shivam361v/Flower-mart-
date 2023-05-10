package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.OrderDetails;
import com.example.demo.entities.User;
import com.example.demo.services.CustomerOrderService;
import com.example.demo.services.OrderDetailsService;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class OrderDetailsController {

	@Autowired
	OrderDetailsService odservice;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	CustomerOrderService coservice;
	
	@GetMapping("addOrderDetails")
	public List<OrderDetails> addOrderDetails(@RequestParam int user_id,@RequestParam int customer_order_id)
	{
		User user = uservice.getOne(user_id);
		CustomerOrder co = coservice.getOne(customer_order_id);
		return odservice.addOrderDetails(user, co);
	}
	
	@GetMapping("/allOrderDetails")
	public List<OrderDetails> allOrderDetails()
	{
		return odservice.allOrderDetails();
	}
	
	@GetMapping("/allOrderDetailsByOrderId")
	public List<OrderDetails> allOrderDetailsByOrderId(@RequestParam int order_id)
	{
		CustomerOrder co = coservice.getOne(order_id);
		
		return odservice.allOrderDetailsByOrderId(co);
	}
	
	
}
