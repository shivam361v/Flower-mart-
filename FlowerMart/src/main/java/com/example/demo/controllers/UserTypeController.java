package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.UserType;
import com.example.demo.services.UserTypeService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class UserTypeController {

	@Autowired
	UserTypeService utservice;
	
	@GetMapping("/userTypeById")
	public UserType getById(@RequestParam("id") int id)
	{
		return utservice.getById(id);
	}
}
