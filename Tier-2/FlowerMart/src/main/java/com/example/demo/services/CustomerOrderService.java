package com.example.demo.services;

import java.sql.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.PaymentDetails;
import com.example.demo.entities.PaymentMethod;
import com.example.demo.entities.ProductCategory;
import com.example.demo.entities.User;
import com.example.demo.repositories.CustomerOrderRepository;

@Service
public class CustomerOrderService 
{

	@Autowired
	CustomerOrderRepository corepo;
	
	@Autowired
	UserService uservice;
	
	
	
	public CustomerOrder saveCustomerOrder(User user,double total, PaymentDetails payment_mode)
	{
		
//		Date d = new Date();
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		
		
		CustomerOrder co = new CustomerOrder(user,date,total,payment_mode,user.getAdd_id());
		
		return corepo.save(co);
	}
	
	public CustomerOrder getOne(int id)
	{
		Optional<CustomerOrder> opt = corepo.findById(id);

		CustomerOrder pc = null;
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
	
//	public CustomerOrder customerOrderByOrderId(int id)
//	{
//		Optional<CustomerOrder> opt = corepo.findById(id);
//
//		CustomerOrder pc = null;
//		try
//		{
//			pc = opt.get();
//		}
//		catch(NoSuchElementException e)
//		{
//			pc = null;
//		}
//		return pc;
//	}

	public List<CustomerOrder> customerOrderByOrderId(int id)
	{
		return corepo.customerOrderByOrderId(id);
	}
	
	public int updateDeliveryStatus(int ds, int oi)
	{
		return corepo.updateDeliveryStatus(ds, oi);
	}
	
	public List<CustomerOrder> allCustomerOrderByUser(User u)
	{
		return corepo.allCustomerOrderByUser(u);
	}
	
	public int updateDeliveryDate(Date ddate,User u)
	{
		return corepo.updateDeliveryDate(ddate,u);
	}
	
}
