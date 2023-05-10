package com.example.demo.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="address")
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/Address.java
public class Address 
{
=======
public class Address {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/Address.java

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int add_id;
	
	@Column
	String shop_name, line_1,line_2,city, state;
	
	@Column
	String pincode;
	
//	@JsonIgnoreProperties("address")
//	@OneToOne(mappedBy = "add_id",cascade = CascadeType.ALL)
//	Set<User> user;
	
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/Address.java
	public Address() 
	{
=======
	public Address() {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/Address.java
		super();
		// TODO Auto-generated constructor stub
	}

	
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/Address.java
	public Address(String shop_name, String line_1, String line_2, String city, String state, String pincode)
	{
=======
	public Address(String shop_name, String line_1, String line_2, String city, String state, String pincode) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/Address.java
		super();
		
		this.shop_name = shop_name;
		this.line_1 = line_1;
		this.line_2 = line_2;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
//		this.user = user;
	}

	



//	public Set<User> getUser() {
//		return user;
//	}
//
//
//	public void setUser(Set<User> user) {
//		this.user = user;
//	}


<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/Address.java
	public Address(String line_1, String line_2, String city, String state, String pincode) 
	{
=======
	public Address(String line_1, String line_2, String city, String state, String pincode) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/Address.java
		super();
		this.line_1 = line_1;
		this.line_2 = line_2;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
	}


<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/Address.java
	public int getAdd_id() 
	{
		return add_id;
	}

	public void setAdd_id(int add_id) 
	{
		this.add_id = add_id;
	}

	public String getShop_name() 
	{
		return shop_name;
	}

	public void setShop_name(String shop_name) 
	{
		this.shop_name = shop_name;
	}

	public String getLine_1() 
	{
		return line_1;
	}

	public void setLine_1(String line_1) 
	{
		this.line_1 = line_1;
	}

	public String getLine_2() 
	{
		return line_2;
	}

	public void setLine_2(String line_2) 
	{
		this.line_2 = line_2;
	}

	public String getCity() 
	{
		return city;
	}

	public void setCity(String city) 
	{
		this.city = city;
	}

	public String getState() 
	{
		return state;
	}

	public void setState(String state) 
	{
		this.state = state;
	}

	public String getPincode()
	{
		return pincode;
	}

	public void setPincode(String pincode) 
	{
		this.pincode = pincode;
	}
=======
	public int getAdd_id() {
		return add_id;
	}

	public void setAdd_id(int add_id) {
		this.add_id = add_id;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getLine_1() {
		return line_1;
	}

	public void setLine_1(String line_1) {
		this.line_1 = line_1;
	}

	public String getLine_2() {
		return line_2;
	}

	public void setLine_2(String line_2) {
		this.line_2 = line_2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/Address.java
}
