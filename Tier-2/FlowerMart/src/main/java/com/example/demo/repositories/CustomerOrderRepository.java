package com.example.demo.repositories;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.CustomerOrder;
import com.example.demo.entities.User;

@Repository
@Transactional
public interface CustomerOrderRepository extends JpaRepository<CustomerOrder, Integer> {

	
	@Query("select co from CustomerOrder co where delivery_status = :delivery_status")
	public List<CustomerOrder> allCustomerOrder(@Param ("delivery_status")int delivery_status);
	
	@Modifying
	@Query("update CustomerOrder co set co.delivery_status = :ds where co.order_id = :oi")
	public int updateDeliveryStatus(@Param ("ds")int ds,@Param ("oi") int oi);
	
	@Query("select co from CustomerOrder co where user_id = :u")
	public List<CustomerOrder> allCustomerOrderByUser(@Param ("u")User u);
	
	@Modifying
	@Query("update CustomerOrder co set co.delivery_date=:ddate where co.user_id=:u")
	public int updateDeliveryDate(@Param ("ddate")Date ddate,@Param ("u")User u);
	
	@Query("select co from CustomerOrder co where order_id=:id")
	public List<CustomerOrder> customerOrderByOrderId(@Param ("id")int id);
	
}
