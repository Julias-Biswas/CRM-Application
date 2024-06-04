package com.crm.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.main.entity.Employee;
import com.crm.main.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeRepository empRepository;

	@Override
	public boolean addEmployeeService(Employee emp) {
		boolean status = false;

		try {
			empRepository.save(emp);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public List<Employee> getAllEmployeeService(String module) {
		return empRepository.findByModule(module);
	}

	@Override
	public Employee searchByEmailService(String email) {
		return empRepository.findByEmail(email);
	}

	@Override
	public boolean deleteEmployeeService(String empId) {
		boolean status = false;

		try {
			empRepository.deleteByEmpId(empId);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public Employee searchByEmpIdService(String empId) {
		return empRepository.findByEmpId(empId);
	}

	@Override
	public boolean updateEmployeeService(Employee emp) {
		boolean status = false;

		try {
			Employee existingEmp = empRepository.findByEmpId(emp.getEmpId());
			if (existingEmp != null) {
				empRepository.save(existingEmp);
				status = true;
			}
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

}
