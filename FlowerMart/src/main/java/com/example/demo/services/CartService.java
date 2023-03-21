package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Cart;
import com.example.demo.entities.User;
import com.example.demo.repositories.CartRepository;

@Service
public class CartService {

	@Autowired
	CartRepository crepo;
	
	@Autowired
	UserService uservice;
	
	public Cart saveCart(Cart cart)
	{
		return crepo.save(cart);
	}
	
	public Cart getCartByUser(User u)
	{
		return crepo.getCartByUser(u);
	}
	
	public int updateTotalAmount(int user_id, double total)
	{
		User u = uservice.getOne(user_id);
		
		return crepo.updateTotalAmount(u, total);
	}
	
//	public int removeTotalAmount()
//	{
//		
//	}
}
