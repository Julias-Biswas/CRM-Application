package com.crm.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.crm.main.entity.CustomerFollowUps;
import java.util.List;

public interface CustomerFollowUpsRepository extends JpaRepository<CustomerFollowUps, Integer> {
	CustomerFollowUps findByCustomerPhoneNo(String customerPhoneNo);

	List<CustomerFollowUps> findByFollowUpsDate(String followUpsDate);

	@Query("SELECT followUpsDate, COUNT(customerPhoneNo) FROM CustomerFollowUps WHERE followUpsDate <> '' AND followUpsDate IS NOT NULL GROUP BY followUpsDate")
	List<Object[]> countByFollowUpsDate();
}
