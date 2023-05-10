package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.OrderDetails;

@Repository
@Transactional
public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Integer> 
{	
	@Query("select od from OrderDetails od where order_id = :co")
	public List<OrderDetails> allOrderDetailsByOrderId(@Param ("co")CustomerOrder co);
}
