package com.example.demo.services;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.ConditionalOnRepositoryType;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartDetails;
import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.OrderDetails;
import com.example.demo.entities.User;
import com.example.demo.repositories.OrderDetailsRepository;

@Service
public class OrderDetailsService {
	
	@Autowired
	OrderDetailsRepository odrepo;
	
	@Autowired
	CartService cservice;
	
	@Autowired
	CartDetailsService cdservice;
	
	@Autowired
	CustomerOrderService coservice;
	
	public List<OrderDetails> addOrderDetails(User u, CustomerOrder co)
	{
		Cart c = cservice.getCartByUser(u);
		List<CartDetails> acd = cdservice.getAllByCart(c);
		
		
		List<OrderDetails> saved = new ArrayList<OrderDetails> ();
		
		for(CartDetails cd : acd)
		{
			OrderDetails od = new OrderDetails(co,cd.getProduct_id(),cd.getProduct_quantity(),cd.getProduct_rate(),cd.getProduct_amount());
			OrderDetails od1 = odrepo.save(od);
			saved.add(od1);
		}
		Date ddate=new Date(0);
		int n=coservice.updateDeliveryDate(ddate,u);
		System.out.println(saved);
		
		return saved;
	}
	
	public List<OrderDetails> allOrderDetails()
	{
		return odrepo.findAll();
	}
	
	public List<OrderDetails> allOrderDetailsByOrderId(CustomerOrder co)
	{
		return odrepo.allOrderDetailsByOrderId(co);
	}
}
