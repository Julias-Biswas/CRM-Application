package com.crm.main.service;

import java.util.List;

import com.crm.main.entity.Employee;

public interface EmployeeService {
	public boolean addEmployeeService(Employee emp);

	public List<Employee> getAllEmployeeService(String module);

	public Employee searchByEmailService(String email);

	public boolean deleteEmployeeService(String empId);

	public Employee searchByEmpIdService(String empId);

	public boolean updateEmployeeService(Employee emp);
}
