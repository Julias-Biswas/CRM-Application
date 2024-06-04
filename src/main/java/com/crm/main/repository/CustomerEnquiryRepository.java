package com.crm.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.crm.main.entity.CustomerEnquiry;
import java.util.List;

public interface CustomerEnquiryRepository extends JpaRepository<CustomerEnquiry, Integer> {
	boolean existsByCustomerPhoneNo(String customerPhoneNo);

	List<CustomerEnquiry> findAllByCustomerPhoneNo(String customerPhoneNo);
	
	@Query("SELECT enquiryDate, COUNT(enquiryId) FROM CustomerEnquiry GROUP BY enquiryDate")
	List<Object[]> countByCustomerEnquriesDate();
}
