package com.example.demo.entities;

public class FloristRegistration {

	int type_id;
	
	String fname, lname,email, password, conformpassword, contact,
	shop_name, line_1, line_2, city, state, pincode,formvalid;
	
	int status = 0;

	public FloristRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FloristRegistration(String fname, String lname, String email, String password,
			String conformpassword, String contact, String shop_name, String line_1, String line_2, String city,
			String state, String pincode) {
		super();
//		this.type_id = type_id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.conformpassword = conformpassword;
		this.contact = contact;
		this.shop_name = shop_name;
		this.line_1 = line_1;
		this.line_2 = line_2;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
//		this.status = status;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConformpassword() {
		return conformpassword;
	}

	public void setConformpassword(String conformpassword) {
		this.conformpassword = conformpassword;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
	
	
}
