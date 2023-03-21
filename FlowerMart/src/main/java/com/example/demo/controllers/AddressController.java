package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Address;
import com.example.demo.services.AddressService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class AddressController {

	@Autowired
	AddressService aservice;
	
	@GetMapping("/getAllAddress")
	public List<Address> getAll()
	{
		return aservice.getAll();
	}
	
	@PostMapping("/saveAddress")
	public Address save(@RequestBody Address add)
	{
		return aservice.save(add);
	}
	
}
