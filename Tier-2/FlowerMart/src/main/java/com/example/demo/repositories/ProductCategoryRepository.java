package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/ProductCategoryRepository.java
import org.springframework.data.repository.query.Param;
=======
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/ProductCategoryRepository.java
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.ProductCategory;

@Transactional
@Repository
<<<<<<< HEAD:Tier-2/FlowerMart/src/main/java/com/example/demo/repositories/ProductCategoryRepository.java
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer> 
{
	@Query("select c from ProductCategory c where cat_name=:cat_name")
	public ProductCategory getByName(@Param ("cat_name")String cat_name);
=======
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer> {

	@Query("select c from ProductCategory c where cat_name=:cat_name")
	public ProductCategory getByName(String cat_name);
>>>>>>> 4aed2d2adae4e4629b68de930bdb9032640ddf41:FlowerMart/src/main/java/com/example/demo/repositories/ProductCategoryRepository.java
}
