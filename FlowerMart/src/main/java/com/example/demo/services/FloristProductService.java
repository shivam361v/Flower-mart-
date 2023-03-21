package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.FloristProduct;
import com.example.demo.entities.FloristProductDummy;
import com.example.demo.entities.Product;
import com.example.demo.entities.ProductCategory;
import com.example.demo.entities.User;
import com.example.demo.repositories.FloristProductRepository;

@Service
public class FloristProductService {

	@Autowired
	FloristProductRepository fprepo;
	
	@Autowired
	ProductService pservice;
	
	@Autowired
	ProductCategoryService pcservice;
	
	public Product save(FloristProductDummy fp,User user)
	{
		FloristProduct fpp=new FloristProduct(fp.getAvailablity(),fp.getPrice(),user);
		FloristProduct fpp1=fprepo.save(fpp);
		
		ProductCategory cat= pcservice.getByName(fp.getCat_name());
		Product pro=new Product(fp.getP_name(),cat,fp.getAvailablity(),fp.getPrice(),fpp1);
		
		Product p1=pservice.save(pro);
		
		return p1;
	}
}
