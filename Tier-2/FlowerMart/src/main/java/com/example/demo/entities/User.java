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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="user")
public class User 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int user_id;
	
	@Column
	String fname,lname,email,password,contact;
	
	@JsonIgnoreProperties("user")
	@ManyToOne
	@JoinColumn(name="type_id")
	UserType type_id;
	
	@JsonIgnoreProperties("user")
	@OneToOne
	@JoinColumn(name="add_id")
	Address add_id;
	
	
	@JsonIgnoreProperties("user")
	@OneToMany(mappedBy = "user_id",cascade = CascadeType.ALL)
	Set<FloristProduct> fproduct;
	
	@JsonIgnoreProperties("user")
	@OneToMany(mappedBy = "user_id", cascade = CascadeType.ALL) 
	Set<CustomerOrder>  custorder;

	@Column
	int status;

	public User() 
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String fname, String lname, String email, String password, String contact,
			UserType type_id, Address add_id, int status) {
		
		
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.type_id = type_id;
		this.add_id = add_id;
		this.status = status;
	}

	public int getUser_id() 
	{
		return user_id;
	}

	public void setUser_id(int user_id) 
	{
		this.user_id = user_id;
	}


	public Address getAdd_id() 
	{
		return add_id;
	}





	public void setAdd_id(Address add_id) {
		this.add_id = add_id;
	}





	public String getFname() {
		return fname;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getContact() 
	{
		return contact;
	}

	public void setContact(String contact) 
	{
		this.contact = contact;
	}

	public UserType getType_id() 
	{
		return type_id;
	}

	public void setType_id(UserType type_id) 
	{
		this.type_id = type_id;
	}	

	
	
	
}
