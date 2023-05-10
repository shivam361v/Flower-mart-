package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.FloristProductDummy;
import com.example.demo.entities.Product;
import com.example.demo.entities.User;
import com.example.demo.services.FloristProductService;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class FloristProductController {

	@Autowired
	FloristProductService fpservice;
	
	@Autowired
	UserService uservice;
	
	@PostMapping("/floristDetail")//Add product and Florist_Product
	public Product saveFlorist(@RequestBody FloristProductDummy fp)
	{
		System.out.println(fp.getUser_id());
		User user = uservice.getOne(fp.getUser_id());
		return fpservice.save(fp,user);
	}
	
	
}
