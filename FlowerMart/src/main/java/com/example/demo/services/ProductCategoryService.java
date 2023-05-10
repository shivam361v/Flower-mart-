package com.example.demo.services;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ProductCategory;
import com.example.demo.repositories.ProductCategoryRepository;

@Service
public class ProductCategoryService {
	
	@Autowired
	ProductCategoryRepository pcrepo;
	
	public List<ProductCategory> getAll()
	{
		return pcrepo.findAll();
	}
	
	public ProductCategory getById(int cat_id)
	{
		Optional<ProductCategory> opt = pcrepo.findById(cat_id);

		ProductCategory pc = null;
		try
		{
			pc = opt.get();
		}
		catch(NoSuchElementException e)
		{
			pc = null;
		}
		return pc;
	}
	
	public ProductCategory getByName(String cat_name)
	{
		return pcrepo.getByName(cat_name);
	}

}
