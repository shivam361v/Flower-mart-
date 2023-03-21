package com.example.demo.entities;

public class StockDummy {
	String p_name;
	
	int availablity;
	double price;
	public StockDummy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StockDummy(String p_name, int availablity, double price) {
		super();
		this.p_name = p_name;
		this.availablity = availablity;
		this.price = price;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getAvailablity() {
		return availablity;
	}
	public void setAvailablity(int availablity) {
		this.availablity = availablity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
