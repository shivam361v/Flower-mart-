package com.example.demo.entities;

import java.sql.Date;
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
@Table(name="customer_order")
public class CustomerOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int order_id;
	
	@JsonIgnoreProperties("customer_order")
	@OneToOne
	@JoinColumn(name="user_id")
	User user_id;
	
	@Column
	Date order_date;
	
	@Column
	double total_amount;
	
	@JsonIgnoreProperties("customer_order")
	@OneToOne
	@JoinColumn(name="payment_id")
	PaymentDetails payment_id;
	
	@Column
	int delivery_status;
	
	@JsonIgnoreProperties("customer_order")
	@OneToOne
	@JoinColumn(name="address_id")
	Address address_id;
	
	@JsonIgnoreProperties("customer_order")
	@OneToMany(mappedBy = "order_id",cascade = CascadeType.ALL)
	Set<OrderDetails> orderDetails;
	
	@Column
	Date delivery_date;

	public CustomerOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerOrder(int order_id, User user_id, Date order_date, double total_amount, PaymentDetails payment_id,
			int delivery_status, Address address_id, Set<OrderDetails> orderDetails, Date delivery_date) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.payment_id = payment_id;
		this.delivery_status = delivery_status;
		this.address_id = address_id;
		this.orderDetails = orderDetails;
		this.delivery_date = delivery_date;
	}
	
	

	public CustomerOrder(int order_id, User user_id, Date order_date, double total_amount, PaymentDetails payment_id,
			int delivery_status, Address address_id, Date delivery_date) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.payment_id = payment_id;
		this.delivery_status = delivery_status;
		this.address_id = address_id;
		this.delivery_date = delivery_date;
	}

	public CustomerOrder(User user_id, Date order_date, double total_amount, PaymentDetails payment_id,
			int delivery_status, Address address_id, Set<OrderDetails> orderDetails, Date delivery_date) {
		super();
		this.user_id = user_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.payment_id = payment_id;
		this.delivery_status = delivery_status;
		this.address_id = address_id;
		this.orderDetails = orderDetails;
		this.delivery_date = delivery_date;
	}

	public Set<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public CustomerOrder(User user_id, Date order_date, double total_amount, PaymentDetails payment_id,
			Address address_id) {
		super();
		this.user_id = user_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.payment_id = payment_id;
		this.address_id = address_id;
	}

	public void setOrderDetails(Set<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Date getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}


	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public PaymentDetails getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(PaymentDetails payment_mode) {
		this.payment_id = payment_mode;
	}

	public int getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(int delivery_status) {
		this.delivery_status = delivery_status;
	}

	public Address getAddress_id() {
		return address_id;
	}

	public void setAddress_id(Address address_id) {
		this.address_id = address_id;
	}
		
}
