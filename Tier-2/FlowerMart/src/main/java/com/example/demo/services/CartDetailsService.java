package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartDetails;
import com.example.demo.entities.Product;
import com.example.demo.entities.User;
import com.example.demo.repositories.CartDetailsRepository;

@Service
public class CartDetailsService {

	@Autowired
	CartDetailsRepository cdrepo;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	ProductService pservice;
	
	@Autowired
	CartService cservice;
	
	
	
	public CartDetails addToCart(int user_id, int prod_id)
	{
		User user = uservice.getOne(user_id);
		Product prod = pservice.getOne(prod_id);
		
		Cart cart = cservice.getCartByUser(user);
		
		double total = 1 *  prod.getPrice();
		CartDetails cd = new CartDetails (cart, prod,1, prod.getPrice(),total);
		return cdrepo.save(cd);
	}
	
	public List<CartDetails> getAll()
	{
		return cdrepo.findAll();
	}
	
	public List<CartDetails> getAllByCart(Cart cart)
	{
		
		return cdrepo.getAllByCart(cart);
	}
	
	public int deleteCartDetails(User u)
	{
		Cart cart = cservice.getCartByUser(u);
//		int a = cservice.removeTotalAmount();
		
		return cdrepo.deleteByCart(cart);
		
		
	}
}
