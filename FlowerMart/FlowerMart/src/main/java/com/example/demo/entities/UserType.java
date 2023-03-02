package com.example.demo.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="user_type")
public class UserType {

	@Id
	int type_id;
	
	@Column
	String user_type;
	
	@JsonIgnoreProperties("user_type")
	@OneToMany(mappedBy = "type_id",cascade = CascadeType.ALL)
	Set<User> user;

	public UserType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserType(int type_id, String user_type, Set<User> user) {
		super();
		this.type_id = type_id;
		this.user_type = user_type;
		this.user = user;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}
	
	
	
}
