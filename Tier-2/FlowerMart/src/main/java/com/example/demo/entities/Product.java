package com.example.demo.entities;

import java.sql.Blob;

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
@Table(name="products")
public class Product 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int product_id;
	
	@Column
	String p_name;
	
	@JsonIgnoreProperties("products")
	@ManyToOne
	@JoinColumn(name="cat_id")
	ProductCategory cat_id;
	
	@Column 
	byte []image;
	
	@Column
	int availablity;
	
	@Column
	double price;
	
	@JsonIgnoreProperties("products")
	@OneToOne
	@JoinColumn(name="florist_id")
	FloristProduct florist_id;

	public Product() 
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int product_id, String p_name, ProductCategory cat_id, byte[] image, int availablity, double price,
			FloristProduct florist_id) 
	{
		super();
		this.product_id = product_id;
		this.p_name = p_name;
		this.cat_id = cat_id;
		this.image = image;
		this.availablity = availablity;
		this.price = price;
		this.florist_id = florist_id;
	}

	public Product(String p_name, ProductCategory cat_id, int availablity, double price, FloristProduct florist_id) 
	{
		super();
		this.p_name = p_name;
		this.cat_id = cat_id;
		this.availablity = availablity;
		this.price = price;
		this.florist_id = florist_id;
	}

	public int getProduct_id() 
	{
		return product_id;
	}

	public void setProduct_id(int product_id) 
	{
		this.product_id = product_id;
	}

	public String getP_name() 
	{
		return p_name;
	}

	public void setP_name(String p_name) 
	{
		this.p_name = p_name;
	}

	public ProductCategory getCat_id() 
	{
		return cat_id;
	}

	public void setCat_id(ProductCategory cat_id) 
	{
		this.cat_id = cat_id;
	}

	public byte[] getImage() 
	{
		return image;
	}

	public void setImage(byte[] image) 
	{
		this.image = image;
	}

	public int getAvailablity() 
	{
		return availablity;
	}

	public void setAvailablity(int availablity) 
	{
		this.availablity = availablity;
	}

	public double getPrice() 
	{
		return price;
	}

	public void setPrice(double price) 
	{
		this.price = price;
	}

	public FloristProduct getFlorist_id() 
	{
		return florist_id;
	}

	public void setFlorist_id(FloristProduct florist_id) 
	{
		this.florist_id = florist_id;
	}
}