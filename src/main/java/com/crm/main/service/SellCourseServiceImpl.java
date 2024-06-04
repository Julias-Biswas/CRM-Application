package com.crm.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.main.entity.SellCourse;
import com.crm.main.repository.SellCourseRepository;

@Service
public class SellCourseServiceImpl implements SellCourseService {
	@Autowired
	SellCourseRepository sellCourseRepository;

	@Override
	public boolean addSellCourseService(SellCourse sellCourse) {
		boolean status = false;

		try {
			sellCourseRepository.save(sellCourse);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public List<Object[]> getSellCourseCountService() {
		return sellCourseRepository.countBySellCourseDate();
	}

	@Override
	public List<SellCourse> getAllSellCourseService() {
		return sellCourseRepository.findAll();
	}

	@Override
	public List<SellCourse> getAllSellCourseByEmployeeEmailService(String empEmail) {
		return sellCourseRepository.findByEmpEmail(empEmail);
	}
}
