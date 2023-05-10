package com.example.demo.services;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Product;
import com.example.demo.entities.ProductCategory;
import com.example.demo.entities.StockDummy;
import com.example.demo.entities.User;
import com.example.demo.repositories.ProductRepository;

@Service
public class ProductService 
{	
	@Autowired
	ProductRepository prepo;
	
	@Autowired
	ProductCategoryService pcservice;
	
	public List<Product> getAll()
	{
		return prepo.findAll();
	}
	
	public List<Product> getByCatId(int cat_id)
	{
		ProductCategory pc = pcservice.getById(cat_id);
		
		return prepo.getByCatId(pc);
	}
	
	public Product getOne(int pid)
	{
		
		Optional<Product> opt = prepo.findById(pid);
		Product c = null;
		try
		{
			c = opt.get();
		}
		catch(NoSuchElementException e)
		{
			c = null;
		}
		return c;
		
	}
	
	public Product save(Product p)
	{
		return prepo.save(p);
	}
	
	public boolean uploadImage(int id,byte[] image)
	{
		if(prepo.uploadImage(id,image)==1)
			return true;
		else
			return false;
	}
	
	public boolean updateProduct(StockDummy sd)
	{
		boolean flag=false;
		int n=prepo.updateProduct(sd.getP_name(),sd.getAvailablity(),sd.getPrice());
		if(n!=0)
		{
			flag=true;
		}
		return flag;
	}
	
}
