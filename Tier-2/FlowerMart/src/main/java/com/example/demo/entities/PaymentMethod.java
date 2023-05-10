package com.example.demo.entities;

import java.sql.Date;

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
public class PaymentMethod 
{
=======
public class PaymentMethod {

>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
	User user;
	Date order_date;
	double total_amount;
	String payment_mode;
	int delivery_status;
	Address address_id;
	
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
	public PaymentMethod() 
	{
=======
	public PaymentMethod() {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PaymentMethod(User user, Date order_date, double total_amount, String payment_mode, int delivery_status,
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
			Address address_id) 
	{
=======
			Address address_id) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
		super();
		this.user = user;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.payment_mode = payment_mode;
		this.delivery_status = delivery_status;
		this.address_id = address_id;
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
	public User getUser() 
	{
		return user;
	}

	public void setUser(User user) 
	{
		this.user = user;
	}

	public Date getOrder_date() 
	{
		return order_date;
	}

	public void setOrder_date(Date order_date) 
	{
		this.order_date = order_date;
	}

	public double getTotal_amount() 
	{
		return total_amount;
	}

	public void setTotal_amount(double total_amount) 
	{
		this.total_amount = total_amount;
	}

	public String getPayment_mode() 
	{
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) 
	{
		this.payment_mode = payment_mode;
	}

	public int getDelivery_status() 
	{
		return delivery_status;
	}

	public void setDelivery_status(int delivery_status) 
	{
		this.delivery_status = delivery_status;
	}

	public Address getAddress_id() 
	{
		return address_id;
	}

	public void setAddress_id(Address address_id) 
	{
		this.address_id = address_id;
	}
=======
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
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
	
	
	
	
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentMethod.java
}
