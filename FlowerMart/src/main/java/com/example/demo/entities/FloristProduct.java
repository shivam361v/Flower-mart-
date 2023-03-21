package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="florist_products")
public class FloristProduct {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int florist_id;
	
	@Column
	int stocks;
	
	@Column
	double price;
	
	@JsonIgnoreProperties("florist_products")
	@OneToOne
	@JoinColumn(name="user_id")
	User user_id;

	public FloristProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FloristProduct(int florist_id, int stocks, double price, User user_id) {
		super();
		this.florist_id = florist_id;
		this.stocks = stocks;
		this.price = price;
		this.user_id = user_id;
	}

	public FloristProduct(int florist_id, int stocks, double price) {
		super();
		this.florist_id = florist_id;
		this.stocks = stocks;
		this.price = price;
	}

	public FloristProduct(int stocks, double price, User user_id) {
		super();
		this.stocks = stocks;
		this.price = price;
		this.user_id = user_id;
	}

	public int getFlorist_id() {
		return florist_id;
	}

	public void setFlorist_id(int florist_id) {
		this.florist_id = florist_id;
	}

	public int getStocks() {
		return stocks;
	}

	public void setStocks(int stocks) {
		this.stocks = stocks;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}
	
	
	
}
