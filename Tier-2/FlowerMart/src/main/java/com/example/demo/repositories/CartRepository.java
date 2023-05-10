package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/CartRepository.java
import org.springframework.data.repository.query.Param;
=======
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/CartRepository.java
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Cart;
import com.example.demo.entities.User;

@Repository
@Transactional
public interface CartRepository extends JpaRepository<Cart, Integer> {

	@Query("select c from Cart c where user_id = :user")
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/CartRepository.java
	public Cart getCartByUser(@Param ("user")User user);
	
	@Modifying
	@Query("update Cart c set c.total_amount = :total where c.user_id = :u")
	public int updateTotalAmount(@Param ("u")User u ,@Param ("total") double total);
=======
	public Cart getCartByUser(User user);
	
	@Modifying
	@Query("update Cart c set c.total_amount = :total where c.user_id = :u")
	public int updateTotalAmount(User u , double total);
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/CartRepository.java
}
