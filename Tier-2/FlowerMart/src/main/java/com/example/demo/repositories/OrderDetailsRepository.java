package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/OrderDetailsRepository.java
import org.springframework.data.repository.query.Param;
=======
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/OrderDetailsRepository.java
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.OrderDetails;

@Repository
@Transactional
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/OrderDetailsRepository.java
public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Integer> 
{	
	@Query("select od from OrderDetails od where order_id = :co")
	public List<OrderDetails> allOrderDetailsByOrderId(@Param ("co")CustomerOrder co);
=======
public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Integer> {

	
	@Query("select od from OrderDetails od where order_id = :co")
	public List<OrderDetails> allOrderDetailsByOrderId(CustomerOrder co);
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/OrderDetailsRepository.java
}
