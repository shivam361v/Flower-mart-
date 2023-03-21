package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartDetails;

@Transactional
@Repository
public interface CartDetailsRepository extends JpaRepository<CartDetails, Integer> {

	@Query("select cd from CartDetails cd where cart_id = :cart_id")
	public List<CartDetails> getAllByCart(Cart cart_id);
	
	@Modifying
	@Query("delete from CartDetails cd where cd.cart_id = :cart_id")
	public int deleteByCart(Cart cart_id);
}
