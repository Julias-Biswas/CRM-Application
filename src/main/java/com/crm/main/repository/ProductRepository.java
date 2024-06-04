package com.crm.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.crm.main.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	Product findByCourseId(String courseId);

	@Query("SELECT courseHeader FROM Product")
	List<String> findCourseName();

	Product findByCourseHeader(String courseHeader);
}
