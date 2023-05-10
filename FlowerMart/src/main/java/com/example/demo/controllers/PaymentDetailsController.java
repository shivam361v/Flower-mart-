package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.PaymentDetails;
import com.example.demo.services.PaymentDetailsService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class PaymentDetailsController {
	
	@Autowired
	PaymentDetailsService pdservice;
	
	@GetMapping("savePaymentDetails")
	public PaymentDetails savePaymentDetails(@RequestParam String payment_type)
	{
		return pdservice.savePaymentDetails(payment_type);
	}

}
