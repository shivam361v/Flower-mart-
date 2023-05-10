package com.example.demo.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="product_categories")
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
public class ProductCategory 
{
=======
public class ProductCategory {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cat_id;
	
	@Column
	String cat_name;
	
	@JsonIgnoreProperties("product_categories")
	@OneToMany(mappedBy = "cat_id",cascade = CascadeType.ALL)
	Set<Product> products;

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	public ProductCategory() 
	{
		super();
=======
	public ProductCategory() {
		super();
		// TODO Auto-generated constructor stub
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	}
	
	

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	public ProductCategory(int cat_id, String cat_name) 
	{
=======
	public ProductCategory(int cat_id, String cat_name) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	public ProductCategory(int cat_id, String cat_name, Set<Product> product) 
	{
=======


	public ProductCategory(int cat_id, String cat_name, Set<Product> product) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
		this.products = product;
	}


<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	public ProductCategory(String cat_name, Set<Product> product) 
	{
=======
	public ProductCategory(String cat_name, Set<Product> product) {
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
		super();
		this.cat_name = cat_name;
		this.products = product;
	}

<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
	public int getCat_id() 
	{
		return cat_id;
	}

	public void setCat_id(int cat_id) 
	{
		this.cat_id = cat_id;
	}

	public String getCat_name() 
	{
		return cat_name;
	}

	public void setCat_name(String cat_name) 
	{
		this.cat_name = cat_name;
	}

	public Set<Product> getProducts() 
	{
		return products;
	}

	public void setProducts(Set<Product> product) 
	{
		this.products = product;
	}
=======
	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> product) {
		this.products = product;
	}
	
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/entities/ProductCategory.java
}