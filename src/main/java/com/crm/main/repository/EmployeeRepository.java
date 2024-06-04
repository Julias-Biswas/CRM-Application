package com.crm.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.crm.main.entity.Employee;

@Transactional
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	Employee findByEmail(String email);

	List<Employee> findByModule(String module);

	void deleteByEmpId(String empId);

	Employee findByEmpId(String empId);
}
