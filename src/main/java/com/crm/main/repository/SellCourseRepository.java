package com.crm.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.crm.main.entity.SellCourse;

public interface SellCourseRepository extends JpaRepository<SellCourse, Integer> {
	@Query("SELECT sellDate, COUNT(sellId) FROM SellCourse GROUP BY sellDate")
	List<Object[]> countBySellCourseDate();

	List<SellCourse> findByEmpEmail(String empEmail);
}
