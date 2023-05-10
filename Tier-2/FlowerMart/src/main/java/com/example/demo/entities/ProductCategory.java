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
public class ProductCategory 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cat_id;
	
	@Column
	String cat_name;
	
	@JsonIgnoreProperties("product_categories")
	@OneToMany(mappedBy = "cat_id",cascade = CascadeType.ALL)
	Set<Product> products;

	public ProductCategory() 
	{
		super();
	}
	
	

	public ProductCategory(int cat_id, String cat_name) 
	{
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
	}

	public ProductCategory(int cat_id, String cat_name, Set<Product> product) 
	{
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
		this.products = product;
	}


	public ProductCategory(String cat_name, Set<Product> product) 
	{
		super();
		this.cat_name = cat_name;
		this.products = product;
	}

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
}