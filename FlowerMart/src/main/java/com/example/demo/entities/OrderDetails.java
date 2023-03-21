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
@Table(name="order_details")
public class OrderDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int order_detail_id;
	
	@JsonIgnoreProperties("orderDetails")
	@ManyToOne
	@JoinColumn(name = "order_id")
	CustomerOrder order_id;
	
	@JsonIgnoreProperties("order_details")
	@OneToOne
	@JoinColumn(name="product_id")
	Product product_id;
	
	@Column
	int product_quantity;
	
	@Column
	double product_rate, product_amount;

	public OrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetails(int order_detail_id, CustomerOrder order_id, Product product_id, int product_quantity,
			double product_rate, double product_amount) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
		this.product_id = product_id;
		this.product_quantity = product_quantity;
		this.product_rate = product_rate;
		this.product_amount = product_amount;
	}

	public OrderDetails(CustomerOrder order_id, Product product_id, int product_quantity, double product_rate,
			double product_amount) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.product_quantity = product_quantity;
		this.product_rate = product_rate;
		this.product_amount = product_amount;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public CustomerOrder getOrder_id() {
		return order_id;
	}

	public void setOrder_id(CustomerOrder order_id) {
		this.order_id = order_id;
	}

	public Product getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public double getProduct_rate() {
		return product_rate;
	}

	public void setProduct_rate(double product_rate) {
		this.product_rate = product_rate;
	}

	public double getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(double product_amount) {
		this.product_amount = product_amount;
	}
	
	
}
