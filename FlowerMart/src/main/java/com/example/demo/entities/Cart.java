package com.example.demo.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="cart")
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cart_id;
	
	@JsonIgnoreProperties("user")
	@OneToOne
	@JoinColumn(name="user_id")
	User user_id;
	
	@Column
	double total_amount;
	
	@JsonIgnoreProperties("cart")
	@OneToMany(mappedBy = "cart_id",cascade = CascadeType.ALL)
	Set<CartDetails> cartdetails;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(User user_id) {
		super();
		this.user_id = user_id;
	}

	public Cart(User user_id, double total_amount) {
		super();
		this.user_id = user_id;
		this.total_amount = total_amount;
	}

	public Cart(int cart_id, User user_id, double total_amount) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.total_amount = total_amount;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	
	
	
	
}
