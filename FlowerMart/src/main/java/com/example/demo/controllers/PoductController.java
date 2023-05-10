package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Product;
import com.example.demo.entities.ProductCategory;
import com.example.demo.entities.StockDummy;
import com.example.demo.services.ProductService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class PoductController {

	@Autowired
	ProductService pservice;
	
	@GetMapping("allProduct")
	public List<Product> getAll()
	{
		return pservice.getAll();
	}
	
	@GetMapping("getProductsByCatId")
	public List<Product> getByCatId(@RequestParam int cat_id)
	{
		return pservice.getByCatId(cat_id);
		
	}
	
	@PostMapping(value="/uploadImage/{pid}",consumes="multipart/form-data")
	public boolean uploadImage(@PathVariable("pid") int  pid,@RequestBody MultipartFile file)
	{
		boolean flag=true;
		try {
			flag=pservice.uploadImage(pid, file.getBytes());
		}
		catch(Exception e)
		{
			flag=false;
		}
		return flag;
	}
	
	@PostMapping("/manageStock")
	public boolean updateProduct(@RequestBody StockDummy sd)
	{
		return pservice.updateProduct(sd);
	}
}
