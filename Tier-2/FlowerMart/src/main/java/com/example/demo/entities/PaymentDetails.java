package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment_details")
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
public class PaymentDetails 
{	
=======
public class PaymentDetails {
	
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int payment_id;
	
	@Column
	String payment_type;
	
	@Column
	String transaction_id;

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
	public PaymentDetails() 
	{
=======
	public PaymentDetails() {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
		super();
		// TODO Auto-generated constructor stub
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
	public PaymentDetails(int payment_id, String payment_type, String transction_id) 
	{
=======
	public PaymentDetails(int payment_id, String payment_type, String transction_id) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
		super();
		this.payment_id = payment_id;
		this.payment_type = payment_type;
		this.transaction_id = transction_id;
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
	public PaymentDetails(String payment_type, String transaction_id) 
	{
=======
	public PaymentDetails(String payment_type, String transaction_id) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
		super();
		this.payment_type = payment_type;
		this.transaction_id = transaction_id;
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
	public int getPayment_id() 
	{
		return payment_id;
	}

	public void setPayment_id(int payment_id) 
	{
		this.payment_id = payment_id;
	}

	public String getPayment_type() 
	{
		return payment_type;
	}

	public void setPayment_type(String payment_type) 
	{
		this.payment_type = payment_type;
	}

	public String getTransaction_id() 
	{
		return transaction_id;
	}

	public void setTransaction_id(String transction_id) 
	{
		this.transaction_id = transction_id;
	}
=======
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transction_id) {
		this.transaction_id = transction_id;
	}
	
	
	
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/PaymentDetails.java
}
