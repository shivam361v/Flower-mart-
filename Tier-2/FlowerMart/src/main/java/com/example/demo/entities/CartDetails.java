package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="cart_details")
public class CartDetails 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cart_detail_id;
	
	@JsonIgnoreProperties("cartdetails")
	@ManyToOne
	@JoinColumn(name="cart_id")
	Cart cart_id;
	
	@JsonIgnoreProperties("cart_details")
	@OneToOne
	@JoinColumn(name = "product_id")
	Product product_id;
	
	@Column
	int product_quantity;
	
	@Column
	double product_rate;
	
	@Column
	double product_amount;

	public CartDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public CartDetails(Cart cart_id, Product product_id, int product_quantity, double product_rate,
			double product_amount) {
		super();
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.product_quantity = product_quantity;
		this.product_rate = product_rate;
		this.product_amount = product_amount;
	}


	public CartDetails(int cart_detail_id, Cart cart_id, Product product_id, int product_quantity, double product_rate,
			double product_amount) 
	{
		super();
		this.cart_detail_id = cart_detail_id;
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.product_quantity = product_quantity;
		this.product_rate = product_rate;
		this.product_amount = product_amount;
	}

	public int getCart_detail_id() 
	{
		return cart_detail_id;
	}

	public void setCart_detail_id(int cart_detail_id) 
	{
		this.cart_detail_id = cart_detail_id;
	}

	public Cart getCart_id() 
	{
		return cart_id;
	}

	public void setCart_id(Cart cart_id) 
	{
		this.cart_id = cart_id;
	}

	public Product getProduct_id() 
	{
		return product_id;
	}

	public void setProduct_id(Product product_id) 
	{
		this.product_id = product_id;
	}

	public int getProduct_quantity() 
	{
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) 
	{
		this.product_quantity = product_quantity;
	}

	public double getProduct_rate() 
	{
		return product_rate;
	}

	public void setProduct_rate(double product_rate) 
	{
		this.product_rate = product_rate;
	}

	public double getProduct_amount() 
	{
		return product_amount;
	}

	public void setProduct_amount(double product_amount) 
	{
		this.product_amount = product_amount;
	}
	
	
}
