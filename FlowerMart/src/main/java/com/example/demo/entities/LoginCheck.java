package com.example.demo.entities;

public class LoginCheck {

	String email;
	String password;
	public LoginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginCheck(String email, String password) {
		super();
		this.email = email;
		this.password = password;
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
	
	
}
