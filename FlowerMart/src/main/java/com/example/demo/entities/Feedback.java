package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="feedbacks")
public class Feedback {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int feedback_id;
	
	@JsonIgnoreProperties("feedbacks")
	@OneToOne
	@JoinColumn(name="user_id")
	User user_id;
	
	@JsonIgnoreProperties("feedbacks")
	@OneToOne
	@JoinColumn(name="product_id")
	Product product_id;
	
	@JsonIgnoreProperties("feedbacks")
	@OneToOne
	@JoinColumn(name="florist_id")
	FloristProduct florist_id;
	
	@Column
	int rating;
	
	@Column
	String comment;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(int feedback_id, User user_id, Product product_id, FloristProduct florist_id, int rating,
			String comment) {
		super();
		this.feedback_id = feedback_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.florist_id = florist_id;
		this.rating = rating;
		this.comment = comment;
	}

	public int getFeedback_id() {
		return feedback_id;
	}

	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public Product getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}

	public FloristProduct getFlorist_id() {
		return florist_id;
	}

	public void setFlorist_id(FloristProduct florist_id) {
		this.florist_id = florist_id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
