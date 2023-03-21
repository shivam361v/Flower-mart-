package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Cart;
import com.example.demo.entities.User;

@Repository
@Transactional
public interface CartRepository extends JpaRepository<Cart, Integer> {

	@Query("select c from Cart c where user_id = :user")
	public Cart getCartByUser(User user);
	
	@Modifying
	@Query("update Cart c set c.total_amount = :total where c.user_id = :u")
	public int updateTotalAmount(User u , double total);
}
