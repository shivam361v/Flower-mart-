package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.PaymentDetails;
import com.example.demo.entities.PaymentMethod;
import com.example.demo.entities.User;
import com.example.demo.services.CustomerOrderService;
import com.example.demo.services.PaymentDetailsService;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class CustomerOrderController {

	@Autowired
	CustomerOrderService coservice;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	PaymentDetailsService pdservice;
	
	/*@PostMapping("/customerOrder")
	public boolean saveCustomerOrder(@RequestBody PaymentMethod pm)
	{
		
		System.out.println(pm.getDelivery_status());
		return true;
//		return coservice.saveCustomerOrder(pm);
//		coservice.saveCustomerOrder(pm);
	}
	*/
	
	@GetMapping("/customerOrder")
	public CustomerOrder saveCustomerOrder(@RequestParam int user_id,@RequestParam double total,@RequestParam int payment_id)
	{
		User user = uservice.getOne(user_id);
		PaymentDetails pd = pdservice.getOne(payment_id);
		return coservice.saveCustomerOrder(user,total,pd);
	}
	
	@GetMapping("/customerOrderByOrderId")
	public List<CustomerOrder> customerOrderByOrderId(@RequestParam int order_id)
	{
		return coservice.customerOrderByOrderId(order_id);
	}
	
	@GetMapping("/updateDeliveryStatus")
	public int updateDeliveryStatus(@RequestParam int delivery_status, @RequestParam int order_id)
	{
		return coservice.updateDeliveryStatus(delivery_status,order_id);
	}
	
	@GetMapping("/allCustomerOrderByUser_id")
	public List<CustomerOrder> allCustomerOrderByUser(@RequestParam int user_id)
	{
		User u = uservice.getOne(user_id);
		return coservice.allCustomerOrderByUser(u);
	}
	
}
