package com.example.demo.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Product;
import com.example.demo.entities.ProductCategory;
import com.example.demo.entities.User;
@Transactional
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> 
{

	@Query("select p from Product p where cat_id = :cat_id")
	public List<Product> getByCatId(@Param ("cat_id")ProductCategory cat_id);
	

	@Modifying
	@Query("update Product p set p.image=:image where p.product_id=:id")
	public int uploadImage(@Param ("id")int id,@Param ("image")byte [] image);
	
	@Modifying
	@Query("delete from Product p where p.product_id=:pid")
	public int delProduct(@Param ("pid")int pid);
	
	@Modifying
	@Query("update Product p set p.availablity=:availablity , p.price=:price where p.p_name=:p_name")
	public int updateProduct(@Param ("p_name")String p_name,@Param ("availablity") int availablity,@Param ("price") double price);

	
}
