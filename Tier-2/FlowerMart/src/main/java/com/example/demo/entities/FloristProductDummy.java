package com.example.demo.entities;

public class FloristProductDummy 
{
String p_name;
	
	//BLOB image;
	
	String cat_name;
	
	int availablity;
	
	double price;

	public FloristProductDummy() 
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public FloristProductDummy(String p_name, String cat_name, int availablity, double price) 
	{
		super();
		this.p_name = p_name;
		this.cat_name = cat_name;
		this.availablity = availablity;
		this.price = price;
	}
	
	public String getP_name() 
	{
		return p_name;
	}

	public void setP_name(String p_name) 
	{
		this.p_name = p_name;
	}

	public String getCat_name() 
	{
		return cat_name;
	}

	public void setCat_name(String cat_name) 
	{
		this.cat_name = cat_name;
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
}
