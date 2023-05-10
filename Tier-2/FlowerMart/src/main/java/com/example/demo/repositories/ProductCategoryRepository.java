package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.ProductCategory;

@Transactional
@Repository
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer> 
{
	@Query("select c from ProductCategory c where cat_name=:cat_name")
	public ProductCategory getByName(@Param ("cat_name")String cat_name);
}
