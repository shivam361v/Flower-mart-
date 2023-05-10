package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.ProductCategory;
import com.example.demo.services.ProductCategoryService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class ProductCategoryController {
	
	@Autowired
	ProductCategoryService pcservice;
	
	@GetMapping("allProductCategory")
	public List<ProductCategory> getAll()
	{
		return pcservice.getAll();
	}
	
	@GetMapping("getByCatId")
	public ProductCategory getById(@RequestParam("cat_id") int cat_id)
	{
		return pcservice.getById(cat_id);
	}

}
